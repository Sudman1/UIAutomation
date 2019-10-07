---
external help file: UIAutomation-help.xml
Module Name: UIAutomation
online version:
schema: 2.0.0
---

# Get-UIWindow

## SYNOPSIS
Retrieves a list of Windows' properties.

## SYNTAX

```
Get-UIWindow [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
All children of the root element are returned.
The children are all considered "windows".

## EXAMPLES

### EXAMPLE 1
```
Get-UIWindow | ft -AutoSize
```

ControlType                           LocalizedControlType Name
-----------                           -------------------- ----
System.Windows.Automation.ControlType pane
System.Windows.Automation.ControlType window               Windows PowerShell ISE Main Window
System.Windows.Automation.ControlType Dialog               Character Map
System.Windows.Automation.ControlType window               Calculator
System.Windows.Automation.ControlType window               Untitled - Notepad

### EXAMPLE 2
```
Get-UIWindow -Name "Calculator"
```

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

## PARAMETERS

### -Name
Name of the Window(s) to return.
This is typically the window's title.
Not all Windows have names - and names can change over the course of an application's runtime.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
