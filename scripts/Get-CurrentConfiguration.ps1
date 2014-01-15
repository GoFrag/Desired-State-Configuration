<#
    .SYNOPSIS
        Get current configuration of a server
    .DESCRIPTION
        This script will process all features and generate a DSC script that
        you can use to bring up a new server with the same feature set. You
        can also use it to generate a configuration of the default installed
        features of a given server.

        This script need to have it's output redirected to a file, please
        see the example section to see how that works.
    .PARAMETER ConfigurationName
        A string that will define the name of the Configuration. This is the
        name used when you run the Configuration.
    .EXAMPLE
        .\Get-CurrentConfiguration.ps1 -ConfigurationName "Default-2012R2" > .\Default-2012r2.ps1

        Description
        -----------
        In order to save this script you will need to redirect the output to a 
        file. This involves using the redirection operator "">".
    .NOTES
        ScriptName : Get-CurrentConfiguration.ps1
        Created By : Jeffrey
        Date Coded : 01/02/2014 08:06:32
        ScriptName is used to register events for this script
 
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
    .LINK
        https://github.com/jeffpatton1971/Desired-State-Configuration/blob/master/scripts/Get-CurrentConfiguration.ps1
#>
[CmdletBinding()]
Param
    (
    [string]$ConfigurationName
    )
Begin
    {
        $ScriptName = $MyInvocation.MyCommand.ToString()
        $ScriptPath = $MyInvocation.MyCommand.Path
        $Username = $env:USERDOMAIN + "\" + $env:USERNAME
 
        New-EventLog -Source $ScriptName -LogName 'Windows Powershell' -ErrorAction SilentlyContinue
 
        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nStarted: " + (Get-Date).toString()
        Write-EventLog -LogName 'Windows Powershell' -Source $ScriptName -EventID "104" -EntryType "Information" -Message $Message
 
        Import-Module ServerManager
        }
Process
    {
        $Features = Get-WindowsFeature
        Write-Output "Configuration $($ConfigurationName)"
        Write-Output "{"
        Write-Output "    param"
        Write-Output "    ("
        Write-Output "    [Parameter(Mandatory=`$true)]"
        Write-Output "    [ValidateNotNullOrEmpty()]"
        Write-Output "    [string]`$ComputerName"
        Write-Output "    )"
        Write-Output "    Node `$ComputerName"
        Write-Output "    {"
        foreach ($Feature in $Features)
        {
            if ($Feature.Installed)
            {
                Write-Output "        WindowsFeature $($Feature.Name.Replace('-',''))"
                Write-Output "        {"
                if ($Feature.Description)
                {
                    Write-Output "            <#"
                    Write-Output "                Description"
                    Write-Output "                -----------"
                    Write-Output "                $($Feature.Description)"
                    Write-Output "            #>"
                    }
                Write-Output "            Name = `"$($Feature.Name)`""
                Write-Output "            Ensure = `"Present`""
                Write-Output "            }"
                Write-Output $null
                }
            else
            {
                Write-Output "        WindowsFeature $($Feature.Name.Replace('-',''))"
                Write-Output "        {"
                if ($Feature.Description)
                {
                    Write-Output "            <#"
                    Write-Output "                Description"
                    Write-Output "                -----------"
                    Write-Output "                $($Feature.Description)"
                    Write-Output "            #>"
                    }
                Write-Output "            Name = `"$($Feature.Name)`""
                Write-Output "            Ensure = `"Absent`""
                Write-Output "            }"
                Write-Output $null
                }
            }
        Write-Output "        }"
        Write-Output "    }"
        }
End
    {
        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nFinished: " + (Get-Date).toString()
        Write-EventLog -LogName 'Windows Powershell' -Source $ScriptName -EventID "104" -EntryType "Information" -Message $Message
        }