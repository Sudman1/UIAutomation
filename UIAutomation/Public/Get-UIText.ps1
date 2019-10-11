<#
.SYNOPSIS
Retrieves the text value of a UI Element.
.DESCRIPTION
If the element is readable, then the text is returned.
.EXAMPLE
PS> Get-UIWindow -Name "Untitled - Notepad" | Get-UIControl -Name "Text Editor" | Set-UIText "Hello World!"
PS> Get-UIWindow -Name "Untitled - Notepad" | Get-UIControl -Name "Text Editor" | Get-UIText

Hello World!
#>
function Get-UIText {
    [CmdLetBinding()]
    param(
        # AutomationElement object against which to get the text.
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({
            $ae = $_
            try {
                [void] $ae.GetCurrentPattern([System.Windows.Automation.ValuePattern]::Pattern)
                $true
            } catch {
                try {
                    [void] $ae.GetCurrentPattern([System.Windows.Automation.TextPattern]::Pattern)
                    $true
                } catch {
                    throw "The AutomationElement passed is not readable."
                }
            }
        })]
        [System.Windows.Automation.AutomationElement] $AutomationElement
    )
    Process {
        try {
            $AutomationElement.GetCurrentPattern([System.Windows.Automation.ValuePattern]::Pattern).Current.Value
        } catch {
            $AutomationElement.GetCurrentPattern([System.Windows.Automation.TextPattern]::Pattern).DocumentRange.GetText(-1).TrimEnd('\r'); # often there is an extra '\r' hanging off the end.
        }
    }
}
