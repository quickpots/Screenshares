cmd /c "del /f /q c:\serial.txt"
Clear-Host
Write-Host @"
   ____        _      _    _____      _       
  / __ \      (_)    | |  |  __ \    | |      
 | |  | |_   _ _  ___| | _| |__) |__ | |_ ___ 
 | |  | | | | | |/ __| |/ /  ___/ _ \| __/ __|
 | |__| | |_| | | (__|   <| |  | (_) | |_\__ \
  \___\_\\__,_|_|\___|_|\_\_|   \___/ \__|___/
                                              
                                              
"@ -ForegroundColor Blue										

$outputFile = 'c:\serial.txt'
$cmds = @(
    'wmic os get serialnumber'
	'wmic cpu get processorid'
	'wmic os get installdate'
	'wmic memorychip get serialnumber'
)
	
foreach ($cmd in $cmds) {
	"command used: $cmd" | Out-File -FilePath $outputFile -Append
    $result = Invoke-Expression $cmd

    $result | Out-File -FilePath $outputFile -Append
    ("=" * 50) | Out-File -FilePath $outputFile -Append
}
Write-Host "Serials saved to c:\serial.txt"
notepad.exe c:\serial.txt
