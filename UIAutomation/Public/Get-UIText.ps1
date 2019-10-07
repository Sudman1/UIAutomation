<#
.SYNOPSIS
Retrieves the text value of a UI Element.
.DESCRIPTION
If the element is readable, then the text is returned
.EXAMPLE
PS>
#>
function Get-UIEditText {
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({
            try {
                [void] $_.GetCurrentPattern([System.Windows.Automation.ValuePattern]::Pattern)
                $true
            } catch {
                throw "The AutomationElement passed is not readable."
            }
        })]
        [System.Windows.Automation.AutomationElement] $AutomationElement
    )
    Process {
        $AutomationElement.GetCurrentPattern([System.Windows.Automation.ValuePattern]::Pattern).Current.Value
    }
}
