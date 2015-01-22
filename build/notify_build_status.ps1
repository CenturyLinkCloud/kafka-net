#
# Notify the Analytics team that a CI build has failed
#

param(
    [Parameter(Mandatory=$true)][string]$ProjectName,
    [Parameter(Mandatory=$true)][string]$Configuration,
    [Parameter(Mandatory=$true)][string]$BuildStatus,
    [switch]$AlwaysNotify = $false
    )

Import-Module ..\deploy\Tier3Deploy\Scripts\Tier3Deploy\Tier3Deploy.psm1
trap {
    Write-Host "Error sending notification: $_"
    continue;
}


$slackKey = "8a0iqNAFDmY4LXAd6Jxeal3h"

if ($BuildStatus -ne 'succeeded')
{
    Send-SlackNotification ":warning: '$Configuration' failed for project '$ProjectName'" "CI Build" ":gift:" $slackKey
}
else
{
    if ($AlwaysNotify)
    {
        Send-SlackNotification ":white_check_mark: '$Configuration' succeeded for project '$ProjectName'" "CI Build" ":gift:" $slackKey
    }
}
