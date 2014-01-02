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
        File CopyPullServerMOF
        {
            Ensure = "Present"
            Type = "File"
            SourcePath = "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\psdscpullserver.mof"
            DestinationPath = "C:\inetpub\wwwroot\PSDSCPullServer"
            DependsOn = "[WindowsFeature]DSCService"
            }
        File CopyPullServerSVC
        {
            Ensure = "Present"
            Type = "File"
            SourcePath = "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\psdscpullserver.svc"
            DestinationPath = "C:\inetpub\wwwroot\PSDSCPullServer"
            DependsOn = "[WindowsFeature]DSCService"
            }
        File CopyPullServerXML
        {
            Ensure = "Present"
            Type = "File"
            SourcePath = "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\psdscpullserver.xml"
            DestinationPath = "C:\inetpub\wwwroot\PSDSCPullServer"
            DependsOn = "[WindowsFeature]DSCService"
            }
        File CopyPullServerApplicationFile
        {
            Ensure = "Present"
            Type = "File"
            SourcePath = "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\Global.asax"
            DestinationPath = "C:\inetpub\wwwroot\PSDSCPullServer"
            DependsOn = "[script]SetupDirectory"
            }
        File CopyDSCServiceDLL
        {
            Ensure = "Present"
            Type = "File"
            SourcePath = "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\Microsoft.Powershell.DesiredStateConfiguration.Service.dll"
            DestinationPath = "C:\inetpub\wwwroot\PSDSCPullServer\bin"
            }
        File CreateWebConfig
        {
            Ensure = "Present"
            Type = "File"
            SourcePath = "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserverpsdscpullserver.config"
            DestinationPath = "C:\inetpub\wwwroot\PSDSCPullServer\web.config"
            DependsOn = "[script]SetupDirectory"
            }
        File CopyDevicesDatabase
        {
            Ensure = "Present"
            Type = "File"
            SourcePath = "C:\Windows\System32\WindowsPowerShell\v1.0\modules\psdesiredstateconfiguration\pullserver\Devices.mdb"
            DestinationPath = "C:\Program Files\WindowsPowerShell\DscService"
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