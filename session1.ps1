# Cmdlet structure
# [Verb] - [Noun]
# Get-Service
# Set-Service

# List official verbs
Get-Verb | Out-GridView

# Find commands
Get-Command *service*
Get-Command Get*service*
get-command *service* -Module MSonline

# Get help for command in console and online (browser)
Get-Help New-Alias
Get-Help New-Alias -Online


# List all variables
Get-Variable

# Define custom variables manual or from output of other command
$service = ""
$service = "service" # string object
$service = Get-Service | Out-GridView -Title "Services" -OutputMode Single # service object

# Get type and members of a variable (methods, properties)
$service.GetType()
$service | Get-Member

# use a property of a variable in a command
Get-Service -Name $service.Name

# user a method of a variable to transform or work with it
$service.Replace('ice','hot')
$service.Name.Replace('ice','hot')

# store information in the same or different variable
$service = $service.Replace('ice','hot')
$blah = $service.Replace('ice','hot')

# clear and remove variables
Clear-Variable blah
Remove-Variable blah


# using set to manipulate something
$service = Get-Service -Name "wuauserv"
$service | Select-Object Name,Status,StartType

Set-Service -Name $service.Name -StartupType Disabled -Verbose -WhatIf
Set-Service -Name $service.Name -StartupType Disabled -Verbose

Get-Service -Name wuauserv | Select-Object Name,Status,StartType
Set-Service -Name $service.Name -StartupType Manual -Status Running -Verbose

Start-Service -Name $service.Name
Stop-Service -Name $service.Name -Force


# Formatting stuff (for the human eye)
Format-Table
Format-List