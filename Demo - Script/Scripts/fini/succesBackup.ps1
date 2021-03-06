<#
.NOTES
	///ETML 
	///Auteur      : Sallaino
	///Date        : 01.06.2016 
.SYNOPSIS

    Graphical interface allowing to display the success of the back up

.DESCRIPTION

    This script allows to create a graphical interface which has for feature to display the success of the back up
 	
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
$interfaceMenuForm.Text = "Succès !"

# Form' size
$interfaceMenuForm.Size = New-Object System.Drawing.Size(350,260)


#========================================================================

#                              Buttons

#========================================================================

# Constants
[int]$posWidthButton = 20
[int]$posHeightButton = 160
[int]$widthButton = 300
[int]$heightButton = 50

# close's button
$button_close = New-Object System.Windows.Forms.Button
$button_close.Text = "Fermer"
$button_close.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_close.Location = New-Object System.Drawing.Size($posWidthButton,$posHeightButton)

#========================================================================

#                              Labels

#========================================================================

# Constants
    [int]$widthlabel = 400
    [int]$heightlabel = 20


# success's label
$label_success = New-Object System.Windows.Forms.Label
$label_success.Location = New-Object System.Drawing.Point(20,80)
$label_success.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)

#========================================================================

#                           Management of events

#========================================================================

# Close the application
$button_close.Add_Click(
{

   $interfaceMenuForm.Close()

})

    # succes' labels
    
    $label_success.Text = "Le back up à été effectué correctement !"   
    $label_success.Font = New-object System.Drawing.Font("Arial",12)

    # Refresh the form
    $interfaceMenuForm.Refresh()

#========================================================================

#                           Display componant

#========================================================================

# Display the button
$interfaceMenuForm.Controls.Add($button_close)

# Add the on the form 
$interfaceMenuForm.Controls.Add($label_success)


# Display the form
$interfaceMenuForm.ShowDialog()