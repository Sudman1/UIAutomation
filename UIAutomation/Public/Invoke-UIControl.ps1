<#
.SYNOPSIS
Invokes a UI control.
.DESCRIPTION
Performs an invoke action (i.e.:button click) on a control.
.EXAMPLE
PS> Get-UIWindow -Name "Untitled - Notepad" | Get-UIControl -Name "Close" | Invoke-UIControl

Sets the text of the Notepad editor section to "Hello World!"
#>
function Invoke-UIControl {
    [CmdLetBinding()]
    param(
        # The AutomationElement control to be invoked.
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({
            try {
                [void] $_.GetCurrentPattern([System.Windows.Automation.InvokePattern]::Pattern)
                $true
            } catch {
                throw "The AutomationElement passed is not invokable."
            }
        })]
        [System.Windows.Automation.AutomationElement] $AutomationElement
    )
    Process {
        $AutomationElement.GetCurrentPattern([System.Windows.Automation.InvokePattern]::Pattern).Invoke()
    }
}
