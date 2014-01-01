Configuration SetupDSCPullServer
{
    param
    (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$ComputerName,
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [Int]$Port
    )

    Node $ComputerName
    {
        WindowsFeature DSCService
        {
            Name = "DSC-Service"
            Ensure = "Present"
            }
        WindowsFeature WebServerRole
        {
            <#
                Installs the following features
                -------------------------------
                Web-Server
                Web-WebServer
                Web-Common-Http
                Web-Default-Doc
                Web-Dir-Browsing
                Web-Http-Errors
                Web-Static-Content
                Web-Health
                Web-Http-Logging
                Web-Performance
                Web-Stat-Compression
                Web-Security
                Web-Filtering
            #>
            Name = "Web-Server"
            Ensure = "Present"
            }

        $SourcePath = "$($pshome)\modules\psdesiredstateconfiguration\pullserver"
        $DestinationPath = "C:\inetpub\wwwroot\PSDSCPullServer"
        $AppPool = "DSCAppPool"
                
        script SetupDirectory
        {
            GetScript = {
                #
                # Get the directory
                #
                Return @{
                    Result = (Get-Item $DestinationPath)
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the directory is there
                #
                Return (Test-Path -Path $DestinationPath)
                }
            SetScript = {
                #
                # Create the iis directory
                #
                New-Item "$($DestinationPath)\bin" -ItemType directory -Force
                }
            DependsOn = "[WindowsFeature]DSCService"
            }
        script CopyPullServerFiles
        {
            GetScript = {
                #
                # Get the files
                #
                Return @{
                    Result = (Get-ChildItem -Path $DestinationPath -Filter "psdscpullserver.*" `
                                |Select-Object -Property FullName)
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the pullfiles exist in $SourcePath
                #
                $PullFiles = Get-ChildItem -Path $SourcePath -Filter "psdscpullserver.*"
                if ($PullFiles)
                {
                    Return $true
                    }
                else
                {
                    Return $false
                    }
                }
            SetScript = {
                #
                # Copy pullfiles to $DestinationPath
                #
                Copy-Item "$($SourcePath)\psdscpullserver.*" $DestinationPath
                }
            DependsOn = "[script]SetupDirectory"
            }
        script CopyPullServerApplicationFile
        {
            GetScript = {
                #
                # Get the ApplicationFile
                #
                Return @{
                    Result = (Get-Item "$($DestinationPath)\Global.asax")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the ApplicationFile is found
                #
                Return (Test-Path -Path "$($SourcePath)\Global.asax")
                }
            SetScript = {
                #
                # Copy the ApplicationFile to the $DestinationPath
                #
                Copy-Item "$($SourcePath)\Global.asax" $DestinationPath
                }
            DependsOn = "[script]CopyPullServerFiles"
            }
        script CopyDSCServiceDLL
        {
            GetScript = {
                #
                # Get the DLL file
                #
                Return = @{
                    Result = (Get-Item "$($DestinationPath)\bin\Microsoft.Powershell.DesiredStateConfiguration.Service.dll")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the DLL is there
                #
                Return (Test-Path -Path "$($SourcePath)\Microsoft.Powershell.DesiredStateConfiguration.Service.dll")
                }
            SetScript = {
                #
                # Copy the DLL file
                #
                Copy-Item "$($SourcePath)\Microsoft.Powershell.DesiredStateConfiguration.Service.dll" "$($DestinationPath)\bin"
                }
            DependsOn = "[script]SetupDirectory"
            }
        script CreateWebConfig
        {
            GetScript = {
                #
                # Get the WebConfig file
                #
                Return = @{
                    Result = (Get-Item "$($DestinationPath)\web.config")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the default file exists
                #
                Return (Test-Path -Path "$($DestinationPath)\psdscpullserver.config")
                }
            SetScript = {
                #
                # Create the WebConfig file by renaming the default one
                #
                Rename-Item "$($DestinationPath)\psdscpullserver.config" "$($DestinationPath)\web.config"
                }
            DependsOn = "[script]CopyPullServerFiles"
            }
        script CopyDevicesDatabase
        {
            GetScript = {
                #
                # Get the DevicesDatabase
                #
                Return = @{
                    Result = (Get-Item "$($env:programfiles)\WindowsPowerShell\DscService\Devices.mdb")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the DevicesDatabase exists
                #
                Return (Test-Path -Path "$($SourcePath)\Devices.mdb")
                }
            SetScript = {
                #
                # Copy the DevicesDatabase to the default location
                #
                Copy-Item "$($SourcePath)\Devices.mdb" "$($env:programfiles)\WindowsPowerShell\DscService"
                }
            DependsOn = "[WindowsFeature]DSCService"
            }
        script CreateWebSite
        {
            GetScript = {
                #
                # Get the WebSite
                #
                Return = @{
                    Result = (Get-Website -Name "DSC-Service")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the WebSite exists
                #
                if (Get-Website -Name "DSC-Service")
                {
                    Return $true
                    }
                else
                {
                    Return $false
                    }
                }
            SetScript = {
                #
                # Create the WebSite
                #
                New-WebAppPool -Name $AppPool
                New-Website -Name "DSC-Service" -Port $Port -PhysicalPath $DestinationPath -ApplicationPool $AppPool
                }
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        script UnlockApplication
        {
            GetScript = {
                #
                # Get settings
                #
                Return = @{
                    Result = ("")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the command is present
                #
                Return (Test-Path -Path "$env:windir\system32\inetsrv\appcmd.exe")
                }
            SetScript = {
                #
                # Unlock the web aplication
                #
                $appcmd = "$env:windir\system32\inetsrv\appcmd.exe" 
                & $appCmd unlock config -section:access
                & $appCmd unlock config -section:anonymousAuthentication
                & $appCmd unlock config -section:basicAuthentication
                & $appCmd unlock config -section:windowsAuthentication
                }
            DependsOn = "[script]CreateWebSite"
            }
        }
    }