---
external help file: UIAutomation-help.xml
Module Name: UIAutomation
online version:
schema: 2.0.0
---

# Set-UIText

## SYNOPSIS
Sets the text value of a UI Element.

## SYNTAX

```
Set-UIText [-Value] <String> -AutomationElement <AutomationElement> [<CommonParameters>]
```

## DESCRIPTION
If the element is editable, then nothig is returned on success.

## EXAMPLES

### EXAMPLE 1
```
Get-UIWindow -Name "Untitled - Notepad" | Get-UIControl -Name "Text Editor" | Set-UIText "Hello World!"
```

Sets the text of the Notepad editor section to "Hello World!"

## PARAMETERS

### -Value
The desired contents of the control's text value

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AutomationElement
AutomationElement object against which to set the text

```yaml
Type: AutomationElement
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
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
