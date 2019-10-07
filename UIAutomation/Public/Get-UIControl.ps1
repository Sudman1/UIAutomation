<#
.SYNOPSIS
Retrieves a list of an object's controls.
.DESCRIPTION
All decendants of the passed AutomationElement which are controls are returned. For performance reasons, it is disallowed to list controls from the root of the UI tree.
.EXAMPLE
PS> & notepad.exe
PS> $win = Get-UIWindow -Name "Untitled - Notepad"
PS> Get-UIControl -AutomationElement $win.AutomationElement -ControlType button | ft -AutoSize

ControlType                           LocalizedControlType Name                    AcceleratorKey AccessKey HasKeyboardFocus IsKeyboardFocusable IsEnabled BoundingRectangle He
                                                                                                                                                                             lp
                                                                                                                                                                             Te
                                                                                                                                                                             xt
-----------                           -------------------- ----                    -------------- --------- ---------------- ------------------- --------- ----------------- --
System.Windows.Automation.ControlType button               Back by small amount                                        False               False     False 1745,224,17,17
System.Windows.Automation.ControlType button               Forward by small amount                                     False               False     False 1745,884,17,17
System.Windows.Automation.ControlType button               Minimize                                                    False               False      True 1623,174,47,30
System.Windows.Automation.ControlType button               Maximize                                                    False               False      True 1670,174,46,30
System.Windows.Automation.ControlType button               Close                                                       False               False      True 1716,174,47,30
.EXAMPLE
PS> Get-UIWindow -Name "Untitled - Notepad" | Get-UIControl | ft -AutoSize

ControlType                           LocalizedControlType Name                    AcceleratorKey AccessKey   HasKeyboardFocus IsKeyboardFocusable IsEnabled BoundingRectangle
-----------                           -------------------- ----                    -------------- ---------   ---------------- ------------------- --------- -----------------
System.Windows.Automation.ControlType window               Untitled - Notepad                                            False                True      True 646,173,1124,759
System.Windows.Automation.ControlType document             Text Editor                                                   False                True      True 654,224,1108,677
System.Windows.Automation.ControlType scroll bar           Vertical Scroll Bar                                           False               False     False 1745,224,17,677
System.Windows.Automation.ControlType button               Back by small amount                                          False               False     False 1745,224,17,17
System.Windows.Automation.ControlType button               Forward by small amount                                       False               False     False 1745,884,17,17
System.Windows.Automation.ControlType status bar                                                                         False               False      True 654,901,1108,23
System.Windows.Automation.ControlType edit                                                                               False               False      True 654,903,554,21
System.Windows.Automation.ControlType edit                    Windows (CRLF)                                             False               False      True 1210,903,182,21
System.Windows.Automation.ControlType edit                    Ln 1, Col 1                                                False               False      True 1394,903,183,21
System.Windows.Automation.ControlType edit                 100%                                                          False               False      True 1579,903,167,21
System.Windows.Automation.ControlType Grip                                                                               False               False      True 1746,908,16,16
System.Windows.Automation.ControlType title bar            Untitled - Notepad                                            False               False      True 654,181,1108,23
System.Windows.Automation.ControlType menu bar             System Menu Bar                                               False                True      True 654,181,22,22
System.Windows.Automation.ControlType menu item            System                                 Alt + Space            False                True      True 654,181,22,22
System.Windows.Automation.ControlType button               Minimize                                                      False               False      True 1623,174,47,30
System.Windows.Automation.ControlType button               Maximize                                                      False               False      True 1670,174,46,30
System.Windows.Automation.ControlType button               Close                                                         False               False      True 1716,174,47,30
System.Windows.Automation.ControlType menu bar             Application                                                   False                True      True 654,204,1108,19
System.Windows.Automation.ControlType menu item            File                                   Alt+F                  False                True      True 654,204,32,19
System.Windows.Automation.ControlType menu item            Edit                                   Alt+E                  False                True      True 686,204,34,19
System.Windows.Automation.ControlType menu item            Format                                 Alt+o                  False                True      True 720,204,52,19
System.Windows.Automation.ControlType menu item            View                                   Alt+V                  False                True      True 772,204,39,19
System.Windows.Automation.ControlType menu item            Help                                   Alt+H                  False                True      True 811,204,39,19

#>
function Get-UIControl {
    [CmdLetBinding()]
    param(
        # AutomationElement object against which to search for controls
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({
            if ($_ -eq (Get-UIRoot)) {
                Write-Error -Message "For performance reasons, it is disallowed to list controls from the root of the UI tree." -ErrorAction Stop
            }
            $true
        })]
        [System.Windows.Automation.AutomationElement] $AutomationElement,

        # Name of the control
        [string] $Name,

        # Name of the control type
        [string] $ControlType
    )
    Process {
        $conditions = @()

        if ($Name) {
            $conditions += [System.Windows.Automation.PropertyCondition]::new([System.Windows.Automation.AutomationElement]::NameProperty, $Name)
        }

        if ($ControlType) {
            $conditions += [System.Windows.Automation.PropertyCondition]::new([System.Windows.Automation.AutomationElement]::ControlTypeProperty, [System.Windows.Automation.ControlType]::$ControlType)
        }

        if ($conditions.Count -eq 0) {
            $condition =  [System.Windows.Automation.PropertyCondition]::new([System.Windows.Automation.AutomationElement]::IsControlElementProperty, $true)
        } elseif ($conditions.Count -eq 1) {
            $condition = $conditions[0]
        } else {
            $condition = [System.Windows.Automation.AndCondition]::new($conditions)
        }

        $items = $AutomationElement.FindAll([System.Windows.Automation.TreeScope]::Subtree, $condition)

        foreach ($item in $items) {
            $item.current | Select-Object *, @{name="AutomationElement";expression={$item}}
        }
    }
}
