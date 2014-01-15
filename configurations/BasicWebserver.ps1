Configuration BasicWebServer
{
    param
    (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$ComputerName,
    [string]$Source = $null,
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$WebDeployPath = $null
    )

    Node $ComputerName
    {
        WindowsFeature WebServerRole
        {
            # Installs the following features
            <#
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
            Source = $Source
            }
        WindowsFeature WebAppDev
        {
            Name = "Web-App-Dev"
            Ensure = "Present"
            Source = $Source
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        WindowsFeature WebAspNet
        {
            Name = "Web-Asp-Net"
            Ensure = "Present"
            Source = $Source
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        WindowsFeature WebNetExt
        {
            Name = "Web-Net-Ext"
            Ensure = "Present"
            Source = $Source
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        WindowsFeature WebISAPIExt
        {
            Name = "Web-ISAPI-Ext"
            Ensure = "Present"
            Source = $Source
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        WindowsFeature WebISAPIFilter
        {
            Name = "Web-ISAPI-Filter"
            Ensure = "Present"
            Source = $Source
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        WindowsFeature WebLogLibraries
        {
            Name = "Web-Log-Libraries"
            Ensure = "Present"
            Source = $Source
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        WindowsFeature WebRequestMonitor
        {
            Name = "Web-Request-Monitor"
            Ensure = "Present"
            Source = $Source
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        WindowsFeature WebMgmtTools
        {
            Name = "Web-Mgmt-Tools"
            Ensure = "Present"
            Source = $Source
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        WindowsFeature WebMgmtConsole
        {
            Name = "Web-Mgmt-Console"
            Ensure = "Present"
            Source = $Source
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        Package WebDeploy
        {
            Name = "Web Deploy 3.5"
            Path = $WebDeployPath
            ProductId = "3674F088-9B90-473A-AAC3-20A00D8D810C"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]WebServerRole"
            }
        Script WebDeployFwRule
        {
            GetScript = 
            {
                #
                # This must return at least the Result property in a hash table
                #
                $Rule = Get-NetFirewallRule -DisplayName "WebDeploy_TCP_8172"
                Return @{
                    GetScript = $GetScript
                    Result = "DisplayName = $($Rule.DisplayName); Enabled = $($Rule.Enabled)"
                    SetScript = $SetScript
                    TestScript = $TestScript
                    }
                }
            TestScript =
            {
                #
                # This must return either true or false
                #
                if (Get-NetFirewallRule -DisplayName "WebDeploy_TCP_8172" -ErrorAction SilentlyContinue) 
                {
                    $true
                    } 
                else 
                {
                    $false
                    }
                }
            SetScript =
            {
                New-NetFirewallRule -DisplayName "WebDeploy_TCP_8172" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 8172
                }
            DependsOn = "[Package]WebDeploy"
            }
        }
    }