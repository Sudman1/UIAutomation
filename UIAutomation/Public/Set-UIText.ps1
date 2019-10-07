function Set-UIEditText {
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({
            if ($_.Current.IsKeyboardFocusable) {
                $true
            } else {
                throw "The AutomationElement passed is not editable"
            }
        })]
        [System.Windows.Automation.AutomationElement] $AutomationElement,

        [Parameter(Mandatory)]
        [string] $Value
    )
    Process {
        try {
            $valuePattern = $AutomationElement.GetCurrentPattern([System.Windows.Automation.ValuePattern]::Pattern)
            Write-Verbose "Writing to control using ValuePattern"
            $valuePattern.SetValue($Value)
        } catch {
            Write-Verbose "Writing to control using SendKeys"
            # Use SendKeys instead
            # ensure System.Windows.Forms is loaded
            [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
            
            # Set focus for input functionality and begin.
            $AutomationElement.SetFocus(); 

            # Pause before sending keyboard input.
            Sleep -Milliseconds 100

            # Delete existing content in the control and insert new content.
            [System.Windows.Forms.SendKeys]::SendWait("^{HOME}");   # Move to start of control
            [System.Windows.Forms.SendKeys]::SendWait("^+{END}");   # Select everything
            [System.Windows.Forms.SendKeys]::SendWait("{DEL}");     # Delete selection
            [System.Windows.Forms.SendKeys]::SendWait($Value);
        }
    }
}