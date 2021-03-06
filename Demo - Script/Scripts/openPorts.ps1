<#
.NOTES
	///ETML 
	///Auteur      : Sallaino
	///Date        : 01.06.2016 
.SYNOPSIS

    Graphical interface allowing to display the computer's name 

.DESCRIPTION

    This script allows to create a graphical interface which has for feature to display the computer's name 
 	
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

# backup's button
$button_Close = New-Object System.Windows.Forms.Button
$button_Close.Text = "Fermer"
$button_Close.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_Close.Location = New-Object System.Drawing.Size($posWidthButton,$posHeightButton)

#========================================================================

#                              End Button

#========================================================================

#========================================================================

#                              Labels

#========================================================================

# Constants
    [int]$widthlabel = 400
    [int]$heightlabel = 300

    # name of the computer's label
    $label_proto = New-Object System.Windows.Forms.Label
    $label_proto.Location = New-Object System.Drawing.Point(10,50)
    $label_proto.AutoSize = $true 

        # name of the computer's label
    $label_adress = New-Object System.Windows.Forms.Label
    $label_adress.Location = New-Object System.Drawing.Point(80,50)
    $label_adress.AutoSize = $true 

        # name of the computer's label
    $label_local = New-Object System.Windows.Forms.Label
    $label_local.Location = New-Object System.Drawing.Point(320,50)
    $label_local.AutoSize = $true 

        # name of the computer's label
    $label_secAdress = New-Object System.Windows.Forms.Label
    $label_secAdress.Location = New-Object System.Drawing.Point(400,50)
    $label_secAdress.AutoSize = $true 

#========================================================================

#                              End Label

#========================================================================

#========================================================================

#                              Management of events

#========================================================================

# Close the application
$button_Close.Add_Click(
{

   $interfaceMenuForm.Close()

})    
    # Set the computer name and prepare to display it

    $netstat = netstat -ano

    $proto = $netstat[3..$netstat.count] | ConvertFrom-String | select p2

    $adress = $netstat[3..$netstat.count] | ConvertFrom-String | select p3

    $local = $netstat[3..$netstat.count] | ConvertFrom-String | select p4

    $secAdress = $netstat[3..$netstat.count] | ConvertFrom-String | select p5


    $pr = $proto | Format-Table -HideTableHeaders | Out-String

    $ad = $adress | Format-Table -HideTableHeaders | Out-String

    $lo = $local | Format-Table -HideTableHeaders | Out-String

    $se = $secAdress | Format-Table -HideTableHeaders | Out-String


    
    $label_proto.text = $pr 
    $label_adress.text = $ad
    $label_local.text = $lo
    $label_secAdress.text = $se

    
    # Refresh the form
    $interfaceMenuForm.Refresh()

#========================================================================

#                              End Management of events

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