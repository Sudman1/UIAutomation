<#
.SYNOPSIS
Retrieve the Root UI Element.
.DESCRIPTION
The root element represents the current desktop and its child elements represent application windows.
.EXAMPLE
PS> Get-UIRoot

Returns the root element
#>
function Get-UIRoot {
    [CmdletBinding()]
    [OutputType([System.Windows.Automation.AutomationElement])]
    param()
    [System.Windows.Automation.AutomationElement]::RootElement
}
