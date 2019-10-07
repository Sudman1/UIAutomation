$addtlAssemblies = Get-Item "$env:SystemRoot\Microsoft.NET\Framework\v4.0.30319\WPF\UIAutomation*.dll" | Select-Object -ExpandProperty FullName
$addtlAssemblies | ForEach-Object {
    [void] [System.Reflection.Assembly]::LoadFile($_)
}