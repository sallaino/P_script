<#
.NOTES
	///ETML 
	///Auteur      : Sallaino
	///Date        : 01.06.2016 
.SYNOPSIS

    Graphical interface allowing to display the informations

.DESCRIPTION

    This script allows to create a graphical interface which has for feature to display the informations
 	
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
$interfaceMenuForm.Text = "Aide !"

# Form' size
$interfaceMenuForm.Size = New-Object System.Drawing.Size(350,260)


#========================================================================

#                              Buttons

#========================================================================

# Constants
[int]$posWidthButton = 20
[int]$posHeightButton = 170
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
[int]$widthlabel = 300
[int]$heightlabel = 100

# Description's label
$label_description = New-Object System.Windows.Forms.Label
$label_description.Location = New-Object System.Drawing.Point(30,50)
$label_description.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)
$label_description.Font = New-object System.Drawing.Font("Arial",12)
$label_description.Text = "Si le dossier spécifié dans le chemin que vous avez entré n'existe pas , il sera crée à cet emplacement !"

#========================================================================

#                              Management of events

#========================================================================

# Close the application
$button_close.Add_Click(
{

   $interfaceMenuForm.Close()

})

 
#========================================================================

#                              End Management of events

#========================================================================

# Display the button
$interfaceMenuForm.Controls.Add($button_close)

# Add the label on the form 
$interfaceMenuForm.Controls.Add($label_description)

# Display the form
$interfaceMenuForm.ShowDialog()