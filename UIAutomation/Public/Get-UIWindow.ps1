<#
.SYNOPSIS
Retrieves a list of Windows' properties.
.DESCRIPTION
All children of the root element are returned. The children are all considered "windows".
.EXAMPLE
PS> Get-UIWindow | ft -AutoSize

ControlType                           LocalizedControlType Name
-----------                           -------------------- ----
System.Windows.Automation.ControlType pane
System.Windows.Automation.ControlType window               Windows PowerShell ISE Main Window
System.Windows.Automation.ControlType Dialog               Character Map
System.Windows.Automation.ControlType window               Calculator
System.Windows.Automation.ControlType window               Untitled - Notepad

.EXAMPLE
PS> Get-UIWindow -Name "Calculator"

ControlType          : System.Windows.Automation.ControlType
LocalizedControlType : window
Name                 : Calculator
AcceleratorKey       :
AccessKey            :
HasKeyboardFocus     : False
IsKeyboardFocusable  : True
IsEnabled            : True
BoundingRectangle    : 1097,476,338,541
HelpText             :
IsControlElement     : True
IsContentElement     : True
LabeledBy            :
AutomationId         :
ItemType             :
IsPassword           : False
ClassName            : ApplicationFrameWindow
NativeWindowHandle   : 656600
ProcessId            : 10356
IsOffscreen          : False
Orientation          : None
FrameworkId          : Win32
IsRequiredForForm    : False
ItemStatus           :
AutomationElement    : System.Windows.Automation.AutomationElement
#>
function Get-UIWindow {
    [CmdLetBinding()]
    param(
        # Name of the Window(s) to return. This is typically the window's title. Not all Windows have names - and names can change over the course of an application's runtime.
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Name
    )
    Process {
        $root = Get-UIRoot

        if ($Name) {
            $items = $root.FindAll("Children", [System.Windows.Automation.PropertyCondition]::new([System.Windows.Automation.AutomationElement]::NameProperty, $Name))
        } else {
            $items = $root.FindAll("Children", [System.Windows.Automation.PropertyCondition]::TrueCondition)
        }

        foreach ($item in $items) {
            $item.current | Select-Object *, @{name="AutomationElement";expression={$item}}
        }
    }
}
