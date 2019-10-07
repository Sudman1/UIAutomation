function Invoke-UIAutomationElement {
    [CmdLetBinding()]
    param(
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