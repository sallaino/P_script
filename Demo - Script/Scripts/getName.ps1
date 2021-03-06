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
$interfaceMenuForm.Text = "Nom de l'ordinateur"

# Form' size
$interfaceMenuForm.Size = New-Object System.Drawing.Size(350,260)


#========================================================================

#                              Buttons

#========================================================================

# Constants
[int]$posWidthButton = 125
[int]$posHeightButton = 150
[int]$widthButton = 100
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
    [int]$heightlabel = 20

    # name of the computer's label
    $label_name = New-Object System.Windows.Forms.Label
    $label_name.Location = New-Object System.Drawing.Point(100,50)
    $label_name.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)

    # name of the computer's textbox 
    $textbox_name = New-Object System.Windows.Forms.TextBox
    $textbox_name.AutoSize = $true
    $textbox_name.Location = New-Object System.Drawing.Point(60,80)
    $textbox_name.Size = New-Object System.Drawing.Size(220,20)
    $textbox_name.readonly = $true


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
    $servName = (Get-ItemProperty -path registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ComputerName").ComputerName
    $label_name.Text = "Le nom de votre PC est : " 
    $textbox_name.Text = $servName

    # Refresh the form
    $interfaceMenuForm.Refresh()

#========================================================================

#                              End Management of events

#========================================================================

# Display the button
$interfaceMenuForm.Controls.Add($button_Close)

# Add the label and textbox on the form 
$interfaceMenuForm.Controls.Add($label_name)
$interfaceMenuForm.Controls.Add($textbox_name)


# Display the form
$interfaceMenuForm.ShowDialog()