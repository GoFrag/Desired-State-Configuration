Configuration SetupDSCPullServer
{
    param
    (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$ComputerName
    )

    $SourcePath = "$($pshome)\modules\psdesiredstateconfiguration\pullserver"
    $DestinationPath = "C:\inetpub\wwwroot\PSDSCPullServer"
    $AppPool = "DSCAppPool"

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
        script SetupDirectory
        {
            GetScript = {
                #
                # Get the directory
                #
                Return @{
                    Result = (Get-Item "C:\inetpub\wwwroot\PSDSCPullServer")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the directory is there
                #
                Return (Test-Path -Path "C:\inetpub\wwwroot\PSDSCPullServer")
                }
            SetScript = {
                #
                # Create the iis directory
                #
                New-Item "C:\inetpub\wwwroot\PSDSCPullServer\bin" -ItemType directory -Force
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
                    Result = (Get-ChildItem -Path "C:\inetpub\wwwroot\PSDSCPullServer" -Filter "psdscpullserver.*" `
                                |Select-Object -Property FullName)
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the pullfiles exist in "$($pshome)\modules\psdesiredstateconfiguration\pullserver"
                #
                $PullFiles = Get-ChildItem -Path "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver" -Filter "psdscpullserver.*"
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
                # Copy pullfiles to "C:\inetpub\wwwroot\PSDSCPullServer"
                #
                Copy-Item "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\psdscpullserver.*" "C:\inetpub\wwwroot\PSDSCPullServer"
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
                    Result = (Get-Item "C:\inetpub\wwwroot\PSDSCPullServer\Global.asax")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the ApplicationFile is found
                #
                Return (Test-Path -Path "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\Global.asax")
                }
            SetScript = {
                #
                # Copy the ApplicationFile to the "C:\inetpub\wwwroot\PSDSCPullServer"
                #
                Copy-Item "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\Global.asax" "C:\inetpub\wwwroot\PSDSCPullServer"
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
                    Result = (Get-Item "C:\inetpub\wwwroot\PSDSCPullServer\bin\Microsoft.Powershell.DesiredStateConfiguration.Service.dll")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the DLL is there
                #
                Return (Test-Path -Path "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\Microsoft.Powershell.DesiredStateConfiguration.Service.dll")
                }
            SetScript = {
                #
                # Copy the DLL file
                #
                Copy-Item "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\Microsoft.Powershell.DesiredStateConfiguration.Service.dll" "C:\inetpub\wwwroot\PSDSCPullServer\bin"
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
                    Result = (Get-Item "C:\inetpub\wwwroot\PSDSCPullServer\web.config")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the default file exists
                #
                Return (Test-Path -Path "C:\inetpub\wwwroot\PSDSCPullServer\psdscpullserver.config")
                }
            SetScript = {
                #
                # Create the WebConfig file by renaming the default one
                #
                Rename-Item "C:\inetpub\wwwroot\PSDSCPullServer\psdscpullserver.config" "C:\inetpub\wwwroot\PSDSCPullServer\web.config"
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
                    Result = (Get-Item "C:\Program Files\WindowsPowerShell\DscService\Devices.mdb")
                    }
                }
            TestScript = {
                #
                # Return $true or $false if the DevicesDatabase exists
                #
                Return (Test-Path -Path "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\Devices.mdb")
                }
            SetScript = {
                #
                # Copy the DevicesDatabase to the default location
                #
                Copy-Item "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\Devices.mdb" "C:\Program Files\WindowsPowerShell\DscService"
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
                New-WebAppPool -Name "DSCAppPool"
                New-Website -Name "DSC-Service" -Port 8080 -PhysicalPath "C:\inetpub\wwwroot\PSDSCPullServer" -ApplicationPool "DSCAppPool"
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