function Get-PSWSUSSyncSchedule {
<#
	.SYNOPSIS
		Shows whether the WSUS server synchronizes the updates and sets the number of server-to-server synchronizations a day.

    .DESCRIPTION
        About SynchronizeAutomaticallyTimeOfDay property.
        WSUS stores the time in Coordinated Universal Time. This can affect the local time value that you display. For example, 
        if the user wants the server to synchronize at 03:00 local time in a standard time zone that is 8 hours west of Coordinated 
        Universal Time, you would set this property to 11:00 Coordinated Universal Time. When daylight saving time occurs, the server 
        will continue to synchronize at 11:00 Coordinated Universal Time, however the local time value of this property will be 04:00. 

	.EXAMPLE
		Get-PSWSUSSyncSchedule

	.OUTPUTS
		Microsoft.UpdateServices.Internal.BaseApi.UpdateServerConfiguration

	.NOTES
		Name: Get-PSWSUSSyncSchedule
        Author: Dubinsky Evgeny
        DateCreated: 1DEC2013

	.LINK
		http://blog.itstuff.in.ua/?p=62#Get-PSWSUSSyncSchedule

#>

    [CmdletBinding()]
    Param()

    Begin
    {
        if($wsus)
        {
            $subscription = $wsus.GetSubscription()
        }#endif
        else
        {
            Write-Warning "Use Connect-PoshWSUSServer for establish connection with your Windows Update Server"
            Break
        }
    }
    Process
    {
        Write-Verbose "Getting WSUS update source configuration"
                       
        $subscription | select SynchronizeAutomatically,SynchronizeAutomaticallyTimeOfDay, NumberOfSynchronizationsPerDay
        
    }
    End{}
}
