# UIAutomation

A simple wrapper for the UI Automation functionality exposed by the System.Windows.Automation namespace.

## Overview

This module makes some simple capabilities from the Microsoft UI
Automation .Net library easily accessible to PowerShell users.

All UI controls are considered AutomationElements. The top-level
AutomationElement is the desktop. The desktop contains windows which,
in turn, contain controls.

This module honors that conceptualization and provides commands to
get the root element (Get-UIRoot), get a list of window objects
(Get-Window), and get a list of a window's controls (Get-Control).

The contents of text controls, such as labels and text boxes can be
retrieved with the Get-UIText function and set with the Set-UIText
function.

Finally, to click a button, use Invoke-UIControl.

## Installation

Build the module using

```Powershell
PS> build.ps1 test -bootstrap
```

and copy the contents of the Output directory to a folder on the module path of the target system.

## Examples

To get a list of window properties, use Get-Window

```Powershell
PS> Get-UIWindow
```

To get a list of a window's controls' properties, use Get-Control

```Powershell
PS> (Get-Window)[1] | Get-Control
```
