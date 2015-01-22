#
#   Run this script after the NUnit step to fail the build immediately if there are any failed tests.
#
param([Parameter(Mandatory=$true)][string]$TestResults)

Microsoft.PowerShell.Utility\Select-Xml -Path $TestResults -XPath "/test-results" | % { $failed = $_.Node.failures }
if ($failed -gt 0) {
    throw "Failing build step on purpose because one or more NUnit tests failed."
}

