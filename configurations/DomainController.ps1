Configuration DomainController
{
    param
    (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$ComputerName
    )
    Node $ComputerName
    {
        WindowsFeature ADDomainServices
        {
            <#
                The following features are installed along with AD-Domain-Services
                RSAT
                RSAT-Role-Tools
                RSAT-AD-Tools
                RSAT-AD-PowerShell
            #>
            Name = "AD-Domain-Services"
            Ensure = "Present"
            }
        WindowsFeature RSATADDS
        {
            Name = "RSAT-ADDS"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]ADDomainServices"
            }
        WindowsFeature RSATADAdminCenter
        {
            Name = "RSAT-AD-AdminCenter"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]ADDomainServices"
            }
        WindowsFeature RSATADDSTools
        {
            Name = "RSAT-ADDS-Tools"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]ADDomainServices"
            }
        WindowsFeature WindowsServerBackup
        {
            Name = "Windows-Server-Backup"
            Ensure = "Present"
            }
        }
    }