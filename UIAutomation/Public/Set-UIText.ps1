<#
.SYNOPSIS
Sets the text value of a UI Element.
.DESCRIPTION
If the element is editable, then nothig is returned on success.
.EXAMPLE
PS> Get-UIWindow -Name "Untitled - Notepad" | Get-UIControl -Name "Text Editor" | Set-UIText "Hello World!"

Sets the text of the Notepad editor section to "Hello World!"
#>
function Set-UIText {
    [CmdLetBinding()]
    param(
        # The desired contents of the control's text value
        [Parameter(Mandatory, Position=0)]
        [string] $Value,

        # AutomationElement object against which to set the text
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({
            if ($_.Current.IsKeyboardFocusable) {
                $true
            } else {
                throw "The AutomationElement passed is not editable"
            }
        })]
        [System.Windows.Automation.AutomationElement] $AutomationElement
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
