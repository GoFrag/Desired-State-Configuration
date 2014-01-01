Configuration Defaults2012R2
{
    param
    (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$ComputerName
    )
    Node $ComputerName
    {
        WindowsFeature FileAndStorageServices
        {
            Name = "FileAndStorage-Services"
            Ensure = "Present"
            }
        WindowsFeature StorageServices
        {
            Name = "Storage-Services"
            Ensure = "Present"
            }
        WindowsFeature NETFramework45Features
        {
            Name = "NET-Framework-45-Features"
            Ensure = "Present"
            }
        WindowsFeature NETFramework45Core
        {
            Name = "NET-Framework-45-Core"
            Ensure = "Present"
            }
        WindowsFeature NETWCFServices45
        {
            Name = "NET-WCF-Services45"
            Ensure = "Present"
            }
        WindowsFeature NETWCFTCPPortSharing45
        {
            Name = "NET-WCF-TCP-PortSharing45"
            Ensure = "Present"
            }
        WindowsFeature FSSMB1
        {
            Name = "FS-SMB1"
            Ensure = "Present"
            }
        WindowsFeature UserInterfacesInfra
        {
            Name = "User-Interfaces-Infra"
            Ensure = "Present"
            }
        WindowsFeature ServerGuiMgmtInfra
        {
            Name = "Server-Gui-Mgmt-Infra"
            Ensure = "Present"
            }
        WindowsFeature ServerGuiShell
        {
            Name = "Server-Gui-Shell"
            Ensure = "Present"
            }
        WindowsFeature PowerShellRoot
        {
            Name = "PowerShellRoot"
            Ensure = "Present"
            }
        WindowsFeature PowerShell
        {
            Name = "PowerShell"
            Ensure = "Present"
            }
        WindowsFeature PowerShellISE
        {
            Name = "PowerShell-ISE"
            Ensure = "Present"
            }
        WindowsFeature WoW64Support
        {
            Name = "WoW64-Support"
            Ensure = "Present"
            }
        WindowsFeature ADCertificate
        {
            Name = "AD-Certificate"
            Ensure = "Absent"
            }
        WindowsFeature ADCSCertAuthority
        {
            Name = "ADCS-Cert-Authority"
            Ensure = "Absent"
            }
        WindowsFeature ADCSEnrollWebPol
        {
            Name = "ADCS-Enroll-Web-Pol"
            Ensure = "Absent"
            }
        WindowsFeature ADCSEnrollWebSvc
        {
            Name = "ADCS-Enroll-Web-Svc"
            Ensure = "Absent"
            }
        WindowsFeature ADCSWebEnrollment
        {
            Name = "ADCS-Web-Enrollment"
            Ensure = "Absent"
            }
        WindowsFeature ADCSDeviceEnrollment
        {
            Name = "ADCS-Device-Enrollment"
            Ensure = "Absent"
            }
        WindowsFeature ADCSOnlineCert
        {
            Name = "ADCS-Online-Cert"
            Ensure = "Absent"
            }
        WindowsFeature ADDomainServices
        {
            Name = "AD-Domain-Services"
            Ensure = "Absent"
            }
        WindowsFeature ADFSFederation
        {
            Name = "ADFS-Federation"
            Ensure = "Absent"
            }
        WindowsFeature ADLDS
        {
            Name = "ADLDS"
            Ensure = "Absent"
            }
        WindowsFeature ADRMS
        {
            Name = "ADRMS"
            Ensure = "Absent"
            }
        WindowsFeature ADRMSServer
        {
            Name = "ADRMS-Server"
            Ensure = "Absent"
            }
        WindowsFeature ADRMSIdentity
        {
            Name = "ADRMS-Identity"
            Ensure = "Absent"
            }
        WindowsFeature ApplicationServer
        {
            Name = "Application-Server"
            Ensure = "Absent"
            }
        WindowsFeature ASNETFramework
        {
            Name = "AS-NET-Framework"
            Ensure = "Absent"
            }
        WindowsFeature ASEntServices
        {
            Name = "AS-Ent-Services"
            Ensure = "Absent"
            }
        WindowsFeature ASDistTransaction
        {
            Name = "AS-Dist-Transaction"
            Ensure = "Absent"
            }
        WindowsFeature ASWSAtomic
        {
            Name = "AS-WS-Atomic"
            Ensure = "Absent"
            }
        WindowsFeature ASIncomingTrans
        {
            Name = "AS-Incoming-Trans"
            Ensure = "Absent"
            }
        WindowsFeature ASOutgoingTrans
        {
            Name = "AS-Outgoing-Trans"
            Ensure = "Absent"
            }
        WindowsFeature ASTCPPortSharing
        {
            Name = "AS-TCP-Port-Sharing"
            Ensure = "Absent"
            }
        WindowsFeature ASWebSupport
        {
            Name = "AS-Web-Support"
            Ensure = "Absent"
            }
        WindowsFeature ASWASSupport
        {
            Name = "AS-WAS-Support"
            Ensure = "Absent"
            }
        WindowsFeature ASHTTPActivation
        {
            Name = "AS-HTTP-Activation"
            Ensure = "Absent"
            }
        WindowsFeature ASMSMQActivation
        {
            Name = "AS-MSMQ-Activation"
            Ensure = "Absent"
            }
        WindowsFeature ASNamedPipes
        {
            Name = "AS-Named-Pipes"
            Ensure = "Absent"
            }
        WindowsFeature ASTCPActivation
        {
            Name = "AS-TCP-Activation"
            Ensure = "Absent"
            }
        WindowsFeature DHCP
        {
            Name = "DHCP"
            Ensure = "Absent"
            }
        WindowsFeature DNS
        {
            Name = "DNS"
            Ensure = "Absent"
            }
        WindowsFeature Fax
        {
            Name = "Fax"
            Ensure = "Absent"
            }
        WindowsFeature FileServices
        {
            Name = "File-Services"
            Ensure = "Absent"
            }
        WindowsFeature FSFileServer
        {
            Name = "FS-FileServer"
            Ensure = "Absent"
            }
        WindowsFeature FSBranchCache
        {
            Name = "FS-BranchCache"
            Ensure = "Absent"
            }
        WindowsFeature FSDataDeduplication
        {
            Name = "FS-Data-Deduplication"
            Ensure = "Absent"
            }
        WindowsFeature FSDFSNamespace
        {
            Name = "FS-DFS-Namespace"
            Ensure = "Absent"
            }
        WindowsFeature FSDFSReplication
        {
            Name = "FS-DFS-Replication"
            Ensure = "Absent"
            }
        WindowsFeature FSResourceManager
        {
            Name = "FS-Resource-Manager"
            Ensure = "Absent"
            }
        WindowsFeature FSVSSAgent
        {
            Name = "FS-VSS-Agent"
            Ensure = "Absent"
            }
        WindowsFeature FSiSCSITargetServer
        {
            Name = "FS-iSCSITarget-Server"
            Ensure = "Absent"
            }
        WindowsFeature iSCSITargetVSSVDS
        {
            Name = "iSCSITarget-VSS-VDS"
            Ensure = "Absent"
            }
        WindowsFeature FSNFSService
        {
            Name = "FS-NFS-Service"
            Ensure = "Absent"
            }
        WindowsFeature FSSyncShareService
        {
            Name = "FS-SyncShareService"
            Ensure = "Absent"
            }
        WindowsFeature HyperV
        {
            Name = "Hyper-V"
            Ensure = "Absent"
            }
        WindowsFeature NPAS
        {
            Name = "NPAS"
            Ensure = "Absent"
            }
        WindowsFeature NPASPolicyServer
        {
            Name = "NPAS-Policy-Server"
            Ensure = "Absent"
            }
        WindowsFeature NPASHealth
        {
            Name = "NPAS-Health"
            Ensure = "Absent"
            }
        WindowsFeature NPASHostCred
        {
            Name = "NPAS-Host-Cred"
            Ensure = "Absent"
            }
        WindowsFeature PrintServices
        {
            Name = "Print-Services"
            Ensure = "Absent"
            }
        WindowsFeature PrintServer
        {
            Name = "Print-Server"
            Ensure = "Absent"
            }
        WindowsFeature PrintScanServer
        {
            Name = "Print-Scan-Server"
            Ensure = "Absent"
            }
        WindowsFeature PrintInternet
        {
            Name = "Print-Internet"
            Ensure = "Absent"
            }
        WindowsFeature PrintLPDService
        {
            Name = "Print-LPD-Service"
            Ensure = "Absent"
            }
        WindowsFeature RemoteAccess
        {
            Name = "RemoteAccess"
            Ensure = "Absent"
            }
        WindowsFeature DirectAccessVPN
        {
            Name = "DirectAccess-VPN"
            Ensure = "Absent"
            }
        WindowsFeature Routing
        {
            Name = "Routing"
            Ensure = "Absent"
            }
        WindowsFeature WebApplicationProxy
        {
            Name = "Web-Application-Proxy"
            Ensure = "Absent"
            }
        WindowsFeature RemoteDesktopServices
        {
            Name = "Remote-Desktop-Services"
            Ensure = "Absent"
            }
        WindowsFeature RDSConnectionBroker
        {
            Name = "RDS-Connection-Broker"
            Ensure = "Absent"
            }
        WindowsFeature RDSGateway
        {
            Name = "RDS-Gateway"
            Ensure = "Absent"
            }
        WindowsFeature RDSLicensing
        {
            Name = "RDS-Licensing"
            Ensure = "Absent"
            }
        WindowsFeature RDSRDServer
        {
            Name = "RDS-RD-Server"
            Ensure = "Absent"
            }
        WindowsFeature RDSVirtualization
        {
            Name = "RDS-Virtualization"
            Ensure = "Absent"
            }
        WindowsFeature RDSWebAccess
        {
            Name = "RDS-Web-Access"
            Ensure = "Absent"
            }
        WindowsFeature VolumeActivation
        {
            Name = "VolumeActivation"
            Ensure = "Absent"
            }
        WindowsFeature WebServer
        {
            Name = "Web-Server"
            Ensure = "Absent"
            }
        WindowsFeature WebWebServer
        {
            Name = "Web-WebServer"
            Ensure = "Absent"
            }
        WindowsFeature WebCommonHttp
        {
            Name = "Web-Common-Http"
            Ensure = "Absent"
            }
        WindowsFeature WebDefaultDoc
        {
            Name = "Web-Default-Doc"
            Ensure = "Absent"
            }
        WindowsFeature WebDirBrowsing
        {
            Name = "Web-Dir-Browsing"
            Ensure = "Absent"
            }
        WindowsFeature WebHttpErrors
        {
            Name = "Web-Http-Errors"
            Ensure = "Absent"
            }
        WindowsFeature WebStaticContent
        {
            Name = "Web-Static-Content"
            Ensure = "Absent"
            }
        WindowsFeature WebHttpRedirect
        {
            Name = "Web-Http-Redirect"
            Ensure = "Absent"
            }
        WindowsFeature WebDAVPublishing
        {
            Name = "Web-DAV-Publishing"
            Ensure = "Absent"
            }
        WindowsFeature WebHealth
        {
            Name = "Web-Health"
            Ensure = "Absent"
            }
        WindowsFeature WebHttpLogging
        {
            Name = "Web-Http-Logging"
            Ensure = "Absent"
            }
        WindowsFeature WebCustomLogging
        {
            Name = "Web-Custom-Logging"
            Ensure = "Absent"
            }
        WindowsFeature WebLogLibraries
        {
            Name = "Web-Log-Libraries"
            Ensure = "Absent"
            }
        WindowsFeature WebODBCLogging
        {
            Name = "Web-ODBC-Logging"
            Ensure = "Absent"
            }
        WindowsFeature WebRequestMonitor
        {
            Name = "Web-Request-Monitor"
            Ensure = "Absent"
            }
        WindowsFeature WebHttpTracing
        {
            Name = "Web-Http-Tracing"
            Ensure = "Absent"
            }
        WindowsFeature WebPerformance
        {
            Name = "Web-Performance"
            Ensure = "Absent"
            }
        WindowsFeature WebStatCompression
        {
            Name = "Web-Stat-Compression"
            Ensure = "Absent"
            }
        WindowsFeature WebDynCompression
        {
            Name = "Web-Dyn-Compression"
            Ensure = "Absent"
            }
        WindowsFeature WebSecurity
        {
            Name = "Web-Security"
            Ensure = "Absent"
            }
        WindowsFeature WebFiltering
        {
            Name = "Web-Filtering"
            Ensure = "Absent"
            }
        WindowsFeature WebBasicAuth
        {
            Name = "Web-Basic-Auth"
            Ensure = "Absent"
            }
        WindowsFeature WebCertProvider
        {
            Name = "Web-CertProvider"
            Ensure = "Absent"
            }
        WindowsFeature WebClientAuth
        {
            Name = "Web-Client-Auth"
            Ensure = "Absent"
            }
        WindowsFeature WebDigestAuth
        {
            Name = "Web-Digest-Auth"
            Ensure = "Absent"
            }
        WindowsFeature WebCertAuth
        {
            Name = "Web-Cert-Auth"
            Ensure = "Absent"
            }
        WindowsFeature WebIPSecurity
        {
            Name = "Web-IP-Security"
            Ensure = "Absent"
            }
        WindowsFeature WebUrlAuth
        {
            Name = "Web-Url-Auth"
            Ensure = "Absent"
            }
        WindowsFeature WebWindowsAuth
        {
            Name = "Web-Windows-Auth"
            Ensure = "Absent"
            }
        WindowsFeature WebAppDev
        {
            Name = "Web-App-Dev"
            Ensure = "Absent"
            }
        WindowsFeature WebNetExt
        {
            Name = "Web-Net-Ext"
            Ensure = "Absent"
            }
        WindowsFeature WebNetExt45
        {
            Name = "Web-Net-Ext45"
            Ensure = "Absent"
            }
        WindowsFeature WebAppInit
        {
            Name = "Web-AppInit"
            Ensure = "Absent"
            }
        WindowsFeature WebASP
        {
            Name = "Web-ASP"
            Ensure = "Absent"
            }
        WindowsFeature WebAspNet
        {
            Name = "Web-Asp-Net"
            Ensure = "Absent"
            }
        WindowsFeature WebAspNet45
        {
            Name = "Web-Asp-Net45"
            Ensure = "Absent"
            }
        WindowsFeature WebCGI
        {
            Name = "Web-CGI"
            Ensure = "Absent"
            }
        WindowsFeature WebISAPIExt
        {
            Name = "Web-ISAPI-Ext"
            Ensure = "Absent"
            }
        WindowsFeature WebISAPIFilter
        {
            Name = "Web-ISAPI-Filter"
            Ensure = "Absent"
            }
        WindowsFeature WebIncludes
        {
            Name = "Web-Includes"
            Ensure = "Absent"
            }
        WindowsFeature WebWebSockets
        {
            Name = "Web-WebSockets"
            Ensure = "Absent"
            }
        WindowsFeature WebFtpServer
        {
            Name = "Web-Ftp-Server"
            Ensure = "Absent"
            }
        WindowsFeature WebFtpService
        {
            Name = "Web-Ftp-Service"
            Ensure = "Absent"
            }
        WindowsFeature WebFtpExt
        {
            Name = "Web-Ftp-Ext"
            Ensure = "Absent"
            }
        WindowsFeature WebMgmtTools
        {
            Name = "Web-Mgmt-Tools"
            Ensure = "Absent"
            }
        WindowsFeature WebMgmtConsole
        {
            Name = "Web-Mgmt-Console"
            Ensure = "Absent"
            }
        WindowsFeature WebMgmtCompat
        {
            Name = "Web-Mgmt-Compat"
            Ensure = "Absent"
            }
        WindowsFeature WebMetabase
        {
            Name = "Web-Metabase"
            Ensure = "Absent"
            }
        WindowsFeature WebLgcyMgmtConsole
        {
            Name = "Web-Lgcy-Mgmt-Console"
            Ensure = "Absent"
            }
        WindowsFeature WebLgcyScripting
        {
            Name = "Web-Lgcy-Scripting"
            Ensure = "Absent"
            }
        WindowsFeature WebWMI
        {
            Name = "Web-WMI"
            Ensure = "Absent"
            }
        WindowsFeature WebScriptingTools
        {
            Name = "Web-Scripting-Tools"
            Ensure = "Absent"
            }
        WindowsFeature WebMgmtService
        {
            Name = "Web-Mgmt-Service"
            Ensure = "Absent"
            }
        WindowsFeature WDS
        {
            Name = "WDS"
            Ensure = "Absent"
            }
        WindowsFeature WDSDeployment
        {
            Name = "WDS-Deployment"
            Ensure = "Absent"
            }
        WindowsFeature WDSTransport
        {
            Name = "WDS-Transport"
            Ensure = "Absent"
            }
        WindowsFeature ServerEssentialsRole
        {
            Name = "ServerEssentialsRole"
            Ensure = "Absent"
            }
        WindowsFeature UpdateServices
        {
            Name = "UpdateServices"
            Ensure = "Absent"
            }
        WindowsFeature UpdateServicesWidDB
        {
            Name = "UpdateServices-WidDB"
            Ensure = "Absent"
            }
        WindowsFeature UpdateServicesServices
        {
            Name = "UpdateServices-Services"
            Ensure = "Absent"
            }
        WindowsFeature UpdateServicesDB
        {
            Name = "UpdateServices-DB"
            Ensure = "Absent"
            }
        WindowsFeature NETFrameworkFeatures
        {
            Name = "NET-Framework-Features"
            Ensure = "Absent"
            }
        WindowsFeature NETFrameworkCore
        {
            Name = "NET-Framework-Core"
            Ensure = "Absent"
            }
        WindowsFeature NETHTTPActivation
        {
            Name = "NET-HTTP-Activation"
            Ensure = "Absent"
            }
        WindowsFeature NETNonHTTPActiv
        {
            Name = "NET-Non-HTTP-Activ"
            Ensure = "Absent"
            }
        WindowsFeature NETFramework45ASPNET
        {
            Name = "NET-Framework-45-ASPNET"
            Ensure = "Absent"
            }
        WindowsFeature NETWCFHTTPActivation45
        {
            Name = "NET-WCF-HTTP-Activation45"
            Ensure = "Absent"
            }
        WindowsFeature NETWCFMSMQActivation45
        {
            Name = "NET-WCF-MSMQ-Activation45"
            Ensure = "Absent"
            }
        WindowsFeature NETWCFPipeActivation45
        {
            Name = "NET-WCF-Pipe-Activation45"
            Ensure = "Absent"
            }
        WindowsFeature NETWCFTCPActivation45
        {
            Name = "NET-WCF-TCP-Activation45"
            Ensure = "Absent"
            }
        WindowsFeature BITS
        {
            Name = "BITS"
            Ensure = "Absent"
            }
        WindowsFeature BITSIISExt
        {
            Name = "BITS-IIS-Ext"
            Ensure = "Absent"
            }
        WindowsFeature BITSCompactServer
        {
            Name = "BITS-Compact-Server"
            Ensure = "Absent"
            }
        WindowsFeature BitLocker
        {
            Name = "BitLocker"
            Ensure = "Absent"
            }
        WindowsFeature BitLockerNetworkUnlock
        {
            Name = "BitLocker-NetworkUnlock"
            Ensure = "Absent"
            }
        WindowsFeature BranchCache
        {
            Name = "BranchCache"
            Ensure = "Absent"
            }
        WindowsFeature NFSClient
        {
            Name = "NFS-Client"
            Ensure = "Absent"
            }
        WindowsFeature DataCenterBridging
        {
            Name = "Data-Center-Bridging"
            Ensure = "Absent"
            }
        WindowsFeature DirectPlay
        {
            Name = "Direct-Play"
            Ensure = "Absent"
            }
        WindowsFeature EnhancedStorage
        {
            Name = "EnhancedStorage"
            Ensure = "Absent"
            }
        WindowsFeature FailoverClustering
        {
            Name = "Failover-Clustering"
            Ensure = "Absent"
            }
        WindowsFeature GPMC
        {
            Name = "GPMC"
            Ensure = "Absent"
            }
        WindowsFeature WebWHC
        {
            Name = "Web-WHC"
            Ensure = "Absent"
            }
        WindowsFeature InkAndHandwritingServices
        {
            Name = "InkAndHandwritingServices"
            Ensure = "Absent"
            }
        WindowsFeature InternetPrintClient
        {
            Name = "Internet-Print-Client"
            Ensure = "Absent"
            }
        WindowsFeature IPAM
        {
            Name = "IPAM"
            Ensure = "Absent"
            }
        WindowsFeature ISNS
        {
            Name = "ISNS"
            Ensure = "Absent"
            }
        WindowsFeature LPRPortMonitor
        {
            Name = "LPR-Port-Monitor"
            Ensure = "Absent"
            }
        WindowsFeature ManagementOdata
        {
            Name = "ManagementOdata"
            Ensure = "Absent"
            }
        WindowsFeature ServerMediaFoundation
        {
            Name = "Server-Media-Foundation"
            Ensure = "Absent"
            }
        WindowsFeature MSMQ
        {
            Name = "MSMQ"
            Ensure = "Absent"
            }
        WindowsFeature MSMQServices
        {
            Name = "MSMQ-Services"
            Ensure = "Absent"
            }
        WindowsFeature MSMQServer
        {
            Name = "MSMQ-Server"
            Ensure = "Absent"
            }
        WindowsFeature MSMQDirectory
        {
            Name = "MSMQ-Directory"
            Ensure = "Absent"
            }
        WindowsFeature MSMQHTTPSupport
        {
            Name = "MSMQ-HTTP-Support"
            Ensure = "Absent"
            }
        WindowsFeature MSMQTriggers
        {
            Name = "MSMQ-Triggers"
            Ensure = "Absent"
            }
        WindowsFeature MSMQMulticasting
        {
            Name = "MSMQ-Multicasting"
            Ensure = "Absent"
            }
        WindowsFeature MSMQRouting
        {
            Name = "MSMQ-Routing"
            Ensure = "Absent"
            }
        WindowsFeature MSMQDCOM
        {
            Name = "MSMQ-DCOM"
            Ensure = "Absent"
            }
        WindowsFeature MultipathIO
        {
            Name = "Multipath-IO"
            Ensure = "Absent"
            }
        WindowsFeature NLB
        {
            Name = "NLB"
            Ensure = "Absent"
            }
        WindowsFeature PNRP
        {
            Name = "PNRP"
            Ensure = "Absent"
            }
        WindowsFeature qWave
        {
            Name = "qWave"
            Ensure = "Absent"
            }
        WindowsFeature CMAK
        {
            Name = "CMAK"
            Ensure = "Absent"
            }
        WindowsFeature RemoteAssistance
        {
            Name = "Remote-Assistance"
            Ensure = "Absent"
            }
        WindowsFeature RDC
        {
            Name = "RDC"
            Ensure = "Absent"
            }
        WindowsFeature RSAT
        {
            Name = "RSAT"
            Ensure = "Absent"
            }
        WindowsFeature RSATFeatureTools
        {
            Name = "RSAT-Feature-Tools"
            Ensure = "Absent"
            }
        WindowsFeature RSATSMTP
        {
            Name = "RSAT-SMTP"
            Ensure = "Absent"
            }
        WindowsFeature RSATFeatureToolsBitLocker
        {
            Name = "RSAT-Feature-Tools-BitLocker"
            Ensure = "Absent"
            }
        WindowsFeature RSATFeatureToolsBitLockerRemoteAdminTool
        {
            Name = "RSAT-Feature-Tools-BitLocker-RemoteAdminTool"
            Ensure = "Absent"
            }
        WindowsFeature RSATFeatureToolsBitLockerBdeAducExt
        {
            Name = "RSAT-Feature-Tools-BitLocker-BdeAducExt"
            Ensure = "Absent"
            }
        WindowsFeature RSATBitsServer
        {
            Name = "RSAT-Bits-Server"
            Ensure = "Absent"
            }
        WindowsFeature RSATClustering
        {
            Name = "RSAT-Clustering"
            Ensure = "Absent"
            }
        WindowsFeature RSATClusteringMgmt
        {
            Name = "RSAT-Clustering-Mgmt"
            Ensure = "Absent"
            }
        WindowsFeature RSATClusteringPowerShell
        {
            Name = "RSAT-Clustering-PowerShell"
            Ensure = "Absent"
            }
        WindowsFeature RSATClusteringAutomationServer
        {
            Name = "RSAT-Clustering-AutomationServer"
            Ensure = "Absent"
            }
        WindowsFeature RSATClusteringCmdInterface
        {
            Name = "RSAT-Clustering-CmdInterface"
            Ensure = "Absent"
            }
        WindowsFeature IPAMClientFeature
        {
            Name = "IPAM-Client-Feature"
            Ensure = "Absent"
            }
        WindowsFeature RSATNLB
        {
            Name = "RSAT-NLB"
            Ensure = "Absent"
            }
        WindowsFeature RSATSNMP
        {
            Name = "RSAT-SNMP"
            Ensure = "Absent"
            }
        WindowsFeature RSATWINS
        {
            Name = "RSAT-WINS"
            Ensure = "Absent"
            }
        WindowsFeature RSATRoleTools
        {
            Name = "RSAT-Role-Tools"
            Ensure = "Absent"
            }
        WindowsFeature RSATADTools
        {
            Name = "RSAT-AD-Tools"
            Ensure = "Absent"
            }
        WindowsFeature RSATADPowerShell
        {
            Name = "RSAT-AD-PowerShell"
            Ensure = "Absent"
            }
        WindowsFeature RSATADDS
        {
            Name = "RSAT-ADDS"
            Ensure = "Absent"
            }
        WindowsFeature RSATADAdminCenter
        {
            Name = "RSAT-AD-AdminCenter"
            Ensure = "Absent"
            }
        WindowsFeature RSATADDSTools
        {
            Name = "RSAT-ADDS-Tools"
            Ensure = "Absent"
            }
        WindowsFeature RSATNIS
        {
            Name = "RSAT-NIS"
            Ensure = "Absent"
            }
        WindowsFeature RSATADLDS
        {
            Name = "RSAT-ADLDS"
            Ensure = "Absent"
            }
        WindowsFeature RSATHyperVTools
        {
            Name = "RSAT-Hyper-V-Tools"
            Ensure = "Absent"
            }
        WindowsFeature HyperVTools
        {
            Name = "Hyper-V-Tools"
            Ensure = "Absent"
            }
        WindowsFeature HyperVPowerShell
        {
            Name = "Hyper-V-PowerShell"
            Ensure = "Absent"
            }
        WindowsFeature RSATRDSTools
        {
            Name = "RSAT-RDS-Tools"
            Ensure = "Absent"
            }
        WindowsFeature RSATRDSGateway
        {
            Name = "RSAT-RDS-Gateway"
            Ensure = "Absent"
            }
        WindowsFeature RSATRDSLicensingDiagnosisUI
        {
            Name = "RSAT-RDS-Licensing-Diagnosis-UI"
            Ensure = "Absent"
            }
        WindowsFeature RDSLicensingUI
        {
            Name = "RDS-Licensing-UI"
            Ensure = "Absent"
            }
        WindowsFeature UpdateServicesRSAT
        {
            Name = "UpdateServices-RSAT"
            Ensure = "Absent"
            }
        WindowsFeature UpdateServicesAPI
        {
            Name = "UpdateServices-API"
            Ensure = "Absent"
            }
        WindowsFeature UpdateServicesUI
        {
            Name = "UpdateServices-UI"
            Ensure = "Absent"
            }
        WindowsFeature RSATADCS
        {
            Name = "RSAT-ADCS"
            Ensure = "Absent"
            }
        WindowsFeature RSATADCSMgmt
        {
            Name = "RSAT-ADCS-Mgmt"
            Ensure = "Absent"
            }
        WindowsFeature RSATOnlineResponder
        {
            Name = "RSAT-Online-Responder"
            Ensure = "Absent"
            }
        WindowsFeature RSATADRMS
        {
            Name = "RSAT-ADRMS"
            Ensure = "Absent"
            }
        WindowsFeature RSATDHCP
        {
            Name = "RSAT-DHCP"
            Ensure = "Absent"
            }
        WindowsFeature RSATDNSServer
        {
            Name = "RSAT-DNS-Server"
            Ensure = "Absent"
            }
        WindowsFeature RSATFax
        {
            Name = "RSAT-Fax"
            Ensure = "Absent"
            }
        WindowsFeature RSATFileServices
        {
            Name = "RSAT-File-Services"
            Ensure = "Absent"
            }
        WindowsFeature RSATDFSMgmtCon
        {
            Name = "RSAT-DFS-Mgmt-Con"
            Ensure = "Absent"
            }
        WindowsFeature RSATFSRMMgmt
        {
            Name = "RSAT-FSRM-Mgmt"
            Ensure = "Absent"
            }
        WindowsFeature RSATNFSAdmin
        {
            Name = "RSAT-NFS-Admin"
            Ensure = "Absent"
            }
        WindowsFeature RSATCoreFileMgmt
        {
            Name = "RSAT-CoreFile-Mgmt"
            Ensure = "Absent"
            }
        WindowsFeature RSATNPAS
        {
            Name = "RSAT-NPAS"
            Ensure = "Absent"
            }
        WindowsFeature RSATPrintServices
        {
            Name = "RSAT-Print-Services"
            Ensure = "Absent"
            }
        WindowsFeature RSATRemoteAccess
        {
            Name = "RSAT-RemoteAccess"
            Ensure = "Absent"
            }
        WindowsFeature RSATRemoteAccessMgmt
        {
            Name = "RSAT-RemoteAccess-Mgmt"
            Ensure = "Absent"
            }
        WindowsFeature RSATRemoteAccessPowerShell
        {
            Name = "RSAT-RemoteAccess-PowerShell"
            Ensure = "Absent"
            }
        WindowsFeature RSATVATools
        {
            Name = "RSAT-VA-Tools"
            Ensure = "Absent"
            }
        WindowsFeature WDSAdminPack
        {
            Name = "WDS-AdminPack"
            Ensure = "Absent"
            }
        WindowsFeature RPCoverHTTPProxy
        {
            Name = "RPC-over-HTTP-Proxy"
            Ensure = "Absent"
            }
        WindowsFeature SimpleTCPIP
        {
            Name = "Simple-TCPIP"
            Ensure = "Absent"
            }
        WindowsFeature FSSMBBW
        {
            Name = "FS-SMBBW"
            Ensure = "Absent"
            }
        WindowsFeature SMTPServer
        {
            Name = "SMTP-Server"
            Ensure = "Absent"
            }
        WindowsFeature SNMPService
        {
            Name = "SNMP-Service"
            Ensure = "Absent"
            }
        WindowsFeature SNMPWMIProvider
        {
            Name = "SNMP-WMI-Provider"
            Ensure = "Absent"
            }
        WindowsFeature TelnetClient
        {
            Name = "Telnet-Client"
            Ensure = "Absent"
            }
        WindowsFeature TelnetServer
        {
            Name = "Telnet-Server"
            Ensure = "Absent"
            }
        WindowsFeature TFTPClient
        {
            Name = "TFTP-Client"
            Ensure = "Absent"
            }
        WindowsFeature DesktopExperience
        {
            Name = "Desktop-Experience"
            Ensure = "Absent"
            }
        WindowsFeature BiometricFramework
        {
            Name = "Biometric-Framework"
            Ensure = "Absent"
            }
        WindowsFeature WFF
        {
            Name = "WFF"
            Ensure = "Absent"
            }
        WindowsFeature WindowsIdentityFoundation
        {
            Name = "Windows-Identity-Foundation"
            Ensure = "Absent"
            }
        WindowsFeature WindowsInternalDatabase
        {
            Name = "Windows-Internal-Database"
            Ensure = "Absent"
            }
        WindowsFeature PowerShellV2
        {
            Name = "PowerShell-V2"
            Ensure = "Absent"
            }
        WindowsFeature DSCService
        {
            Name = "DSC-Service"
            Ensure = "Absent"
            }
        WindowsFeature WindowsPowerShellWebAccess
        {
            Name = "WindowsPowerShellWebAccess"
            Ensure = "Absent"
            }
        WindowsFeature WAS
        {
            Name = "WAS"
            Ensure = "Absent"
            }
        WindowsFeature WASProcessModel
        {
            Name = "WAS-Process-Model"
            Ensure = "Absent"
            }
        WindowsFeature WASNETEnvironment
        {
            Name = "WAS-NET-Environment"
            Ensure = "Absent"
            }
        WindowsFeature WASConfigAPIs
        {
            Name = "WAS-Config-APIs"
            Ensure = "Absent"
            }
        WindowsFeature SearchService
        {
            Name = "Search-Service"
            Ensure = "Absent"
            }
        WindowsFeature WindowsServerBackup
        {
            Name = "Windows-Server-Backup"
            Ensure = "Absent"
            }
        WindowsFeature Migration
        {
            Name = "Migration"
            Ensure = "Absent"
            }
        WindowsFeature WindowsStorageManagementService
        {
            Name = "WindowsStorageManagementService"
            Ensure = "Absent"
            }
        WindowsFeature WindowsTIFFIFilter
        {
            Name = "Windows-TIFF-IFilter"
            Ensure = "Absent"
            }
        WindowsFeature WinRMIISExt
        {
            Name = "WinRM-IIS-Ext"
            Ensure = "Absent"
            }
        WindowsFeature WINS
        {
            Name = "WINS"
            Ensure = "Absent"
            }
        WindowsFeature WirelessNetworking
        {
            Name = "Wireless-Networking"
            Ensure = "Absent"
            }
        WindowsFeature XPSViewer
        {
            Name = "XPS-Viewer"
            Ensure = "Absent"
            }
        }
    }