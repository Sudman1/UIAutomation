---
external help file: UIAutomation-help.xml
Module Name: UIAutomation
online version:
schema: 2.0.0
---

# Invoke-UIControl

## SYNOPSIS
Invokes a UI control.

## SYNTAX

```
Invoke-UIControl [-AutomationElement] <AutomationElement> [<CommonParameters>]
```

## DESCRIPTION
Performs an invoke action (i.e.:button click) on a control.

## EXAMPLES

### EXAMPLE 1
```
Get-UIWindow -Name "Untitled - Notepad" | Get-UIControl -Name "Close" | Invoke-UIControl
```

Sets the text of the Notepad editor section to "Hello World!"

## PARAMETERS

### -AutomationElement
The AutomationElement control to be invoked.

```yaml
Type: AutomationElement
Parameter Sets: (All)
Aliases:

Required: True
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
