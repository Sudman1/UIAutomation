---
external help file: UIAutomation-help.xml
Module Name: UIAutomation
online version:
schema: 2.0.0
---

# Get-UIText

## SYNOPSIS
Retrieves the text value of a UI Element.

## SYNTAX

```
Get-UIText [-AutomationElement] <AutomationElement> [<CommonParameters>]
```

## DESCRIPTION
If the element is readable, then the text is returned.

## EXAMPLES

### EXAMPLE 1
```
Get-UIWindow -Name "Untitled - Notepad" | Get-UIControl -Name "Text Editor" | Set-UIText "Hello World!"
```

PS\> Get-UIWindow -Name "Untitled - Notepad" | Get-UIControl -Name "Text Editor" | Get-UIText

Hello World!

## PARAMETERS

### -AutomationElement
AutomationElement object against which to get the text.

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
