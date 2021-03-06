<#
.NOTES
	///ETML 
	///Auteur      : Sallaino
	///Date        : 01.06.2016 
.SYNOPSIS

    Graphical interface allowing to display the open ports

.DESCRIPTION

    This script allows to create a graphical interface which has for feature to display the open ports 
 	
.EXAMPLE
    
    Refer to the screen shot being in the file script
 	
.LINK

    Canevas.ps1

#>

# clean screen (old commands erased)
Clear-Host

# Loading the assemblies
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

# Create the form
$interfaceMenuForm = New-Object Windows.Forms.Form

# Disable the resize and maximise function
$interfaceMenuForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$interfaceMenuForm.MaximizeBox = $false

# Form's title
$interfaceMenuForm.Text = "Liste de ports"

# Form' size
$interfaceMenuForm.AutoSize = $true

#========================================================================

#                              Buttons

#========================================================================

# Constants
[int]$posWidthButton = 5
[int]$posHeightButton = 5
[int]$widthButton = 500
[int]$heightButton = 50

# close's button
$button_Close = New-Object System.Windows.Forms.Button
$button_Close.Text = "Fermer"
$button_Close.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_Close.Location = New-Object System.Drawing.Size($posWidthButton,$posHeightButton)

#========================================================================

#                              Labels

#========================================================================

# Constants
[int]$widthlabel = 400
[int]$heightlabel = 300

# port's label
$label_proto = New-Object System.Windows.Forms.Label
$label_proto.Location = New-Object System.Drawing.Point(10,50)
$label_proto.AutoSize = $true 

# address' label
$label_adress = New-Object System.Windows.Forms.Label
$label_adress.Location = New-Object System.Drawing.Point(80,50)
$label_adress.AutoSize = $true 

# local's label
$label_local = New-Object System.Windows.Forms.Label
$label_local.Location = New-Object System.Drawing.Point(320,50)
$label_local.AutoSize = $true 

# address's label
$label_secAdress = New-Object System.Windows.Forms.Label
$label_secAdress.Location = New-Object System.Drawing.Point(400,50)
$label_secAdress.AutoSize = $true 

#========================================================================

#                              Management of events

#========================================================================

# Close the application
$button_Close.Add_Click(
{

   $interfaceMenuForm.Close()

})    

# search the network data
$netstat = netstat -

# set in an array by column  
$proto = $netstat[3..$netstat.count] | ConvertFrom-String | select 
    
$adress = $netstat[3..$netstat.count] | ConvertFrom-String | select 
    
$local = $netstat[3..$netstat.count] | ConvertFrom-String | select 
    
$secAdress = $netstat[3..$netstat.count] | ConvertFrom-String | select p5

# Transform the column on table in column
$pr = $proto | Format-Table -HideTableHeaders | Out-String

$ad = $adress | Format-Table -HideTableHeaders | Out-String

$lo = $local | Format-Table -HideTableHeaders | Out-String

$se = $secAdress | Format-Table -HideTableHeaders | Out-String

# Display the tables   
$label_proto.text = $pr 
$label_adress.text = $ad
$label_local.text = $lo
$label_secAdress.text = $se

    
# Refresh the form
$interfaceMenuForm.Refresh()

#========================================================================

#                           display componant

#========================================================================

# Display the button
$interfaceMenuForm.Controls.Add($button_Close)

# Add the label and textbox on the form 

$interfaceMenuForm.Controls.Add($label_proto)
$interfaceMenuForm.Controls.Add($label_adress)
$interfaceMenuForm.Controls.Add($label_local)
$interfaceMenuForm.Controls.Add($label_secAdress)


# Display the form
$interfaceMenuForm.ShowDialog()