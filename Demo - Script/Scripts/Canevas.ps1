<#
.NOTES
	///ETML 
	///Auteur      : Luke Skywalker
	///Date        : 19.01.2014 

.SYNOPSIS
    Summary 
 	
.DESCRIPTION
    Description (explanation of script)
  	
.PARAMETER param1
    Description first parameter
 	
.PARAMETER param2
    Description second parameter
 	
.PARAMETER param3
    Description third parameter
 	
.EXAMPLE
    Example of using the script with results obtained.\
 	
.LINK
    Canevas.ps1
    other script
#>

# "..." value by default
param([string]$param1="...", [string]$param2, [string]$param3)

# clean screen (old commands erased)
Clear-Host

#display help if parameter is missing
if(!$param2 -or !$param3)
{
    Get-Help $MyInvocation.Mycommand.Path
    
}
else
{
    
    write-host "coucou"
    
}# endif


