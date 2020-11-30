# declare variables manually
$varString = ""
[System.String]$varString = ""

$varInteger = 1
[System.Int32]$varInteger = 1

$varArray = @()
[System.Array]$varArray = ""

# files from directory
$files = Get-ChildItem -Path .\demofiles -Include *.log -Recurse
$files.GetType()

# methods of the array object
$files | Get-Member

# count the amount of items in the array
$files.count

# get an item in an array by position
$files[0]
$files[1..2]

# get information about a item in the array
$files[0].GetType()
$files[0] | Get-Member


# Select specific attributes, sort and group by attribute
$files | Select-Object Name,LastAccessTime | Sort-Object LastAccessTime | Group-Object LastAccessTime

# Limit result
$files | Sort-Object LastWriteTime -Descending | Select-Object -First 1

# Limit/filter by value using Where-Object
$files | Where-Object {$_.Name -eq "20201123.log"}
$files | Where-Object {$_.Name -like "*23*"}

# What type is the attribute i'd like to filter for
$files[0].LastWriteTime.GetType()
$yesterday = (Get-Date).AddDays(-1)
$files | Where-Object {$_.LastWriteTime -gt $yesterday}

# Execute action after filtering using Copy-Item or Rename-Item as an example
$files | Where-Object {$_.LastWriteTime -gt $yesterday} | Copy-Item -Destination .\copydest -Verbose
$files | Where-Object {$_.LastWriteTime -gt $yesterday} | Rename-Item -NewName "blah.log" -verbose -Force

# Go through all files and move them to another destination
$files[0].Fullname
$files | ForEach-Object { Move-Item -Path $_ -Destination .\copydest -verbose }

# Custom array with numbers
$numbers = @(1,2,3)
$numbers.count
$numbers[0].GetType()

# doing some simple math
$numbers[0] + 1
$numbers | ForEach-Object {$_ + 1}

# Custom array with strings
$strings = @('abc','def','ghi')
$strings.count
$strings[0].gettype()

# appending text to strings
$strings[0] + "-zzz"
$strings | ForEach-Object {$_ + "-zzz"}


# CONTROL FLOW (flow-control)
$string = "blahmon"
$strings = @('Simon','Rafael','Lava','Claudio','Daniel')

# if/else
if ($_ -eq "Simon") {
    Write-Host "My name is '$_'" -ForegroundColor green
}
elseif ($_ -eq "Rafael") {
    Write-Host "My name is '$_'" -ForegroundColor Magenta
}
else {
    Write-Host "My name is '$_'" -ForegroundColor Yellow
}

# if/else within a Foreach
$strings | ForEach-Object {
    if ($_ -eq "Simon") {
        Write-Host "My name is '$_'" -ForegroundColor green
    }
    elseif ($_ -eq "Rafael") {
        Write-Host "My name is '$_'" -ForegroundColor Magenta
    }
    else {
        Write-Host "My name is '$_'" -ForegroundColor Yellow
    }
}

# switch/case
$strings | ForEach-Object {
    switch ($_) {
        Simon {
            Write-Host "My name is '$_'" -ForegroundColor green
        }
        Rafael {
            Write-Host "My name is '$_'" -ForegroundColor Magenta
        }
        Default {
            Write-Host "My name is '$_'" -ForegroundColor Yellow
        }
    }

}

# swtich/case within a Foreach
Foreach ($string in $strings) {

    switch ($string) {
        Simon { Write-Host "My name is '$string'" -ForegroundColor green }
        Rafael { Write-Host "My name is '$string'" -ForegroundColor Magenta }
        Default { Write-Host "My name is '$string'" -ForegroundColor Yellow }
    }

}

# do/while - do/until
$integer = 0
do {
    $integer++
    Write-host "Currently at '$integer'" -ForegroundColor Magenta
    Start-Sleep -Seconds 3

} while ($integer -lt 3)

$integer = 0
do {
    $integer++
    Write-host "Currently at '$integer'" -ForegroundColor Magenta
    Start-Sleep -Seconds 3

} until ($integer -eq 3)


# loop forever
do {
    # whatever needs to be done
    # blah blah blah some code ...

    # wait until next loop
    Start-Sleep -Seconds 500
} until ("fuchs" -eq "hase")


# try/catch
try {
    $service = Get-Service -Name "wuauserv" -ErrorAction Stop
    Write-host "Service with name '$($service.name)' found" -ForegroundColor Cyan

    # additional code...
    # if that codes throws an error it will proceed with the 'catch' block
}
catch {
    Write-host "An error occurred" -ForegroundColor Yellow
}