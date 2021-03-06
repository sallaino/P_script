<#
.NOTES
	///ETML 
	///Auteur      : Sallaino
	///Date        : 01.06.2016 
.SYNOPSIS

    Graphical interface allowing to rename the computer
 	
.DESCRIPTION

    This script allows to create a graphical interface which has for feature  to rename the computer 
 	
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

# Disable the resize, minimise and maximise function
$interfaceMenuForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$interfaceMenuForm.MaximizeBox = $false

# Form's title
$interfaceMenuForm.Text = "Nom de l'ordinateur"

# Form' size
$interfaceMenuForm.Size = New-Object System.Drawing.Size(350,200)


#========================================================================

#                              Buttons

#========================================================================

# Constants
[int]$widthButton = 100
[int]$heightButton = 50

# backup's button
$button_Close = New-Object System.Windows.Forms.Button
$button_Close.Text = "Annuler"
$button_Close.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_Close.Location = New-Object System.Drawing.Size(170,100)

# Submit's button
$button_submit = New-Object System.Windows.Forms.Button
$button_submit.Text = "Redémarrer"
$button_submit.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_submit.Location = New-Object System.Drawing.Size(60,100)

#========================================================================

#                              End Button

#========================================================================

#========================================================================

#                              Labels

#========================================================================

# Constants
    [int]$widthlabel = 325
    [int]$heightlabel = 40

    # name of the computer's label
    $label_name = New-Object System.Windows.Forms.Label
    $label_name.Location = New-Object System.Drawing.Point(40,20)
    $label_name.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)


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
$label_name.Text = "Vous devez redémarrer votre ordinateur pour que le changement soit pris en compte " 
 
# Submit the computer name and rename it
$button_submit.Add_Click(
{
   
   Rename-Computer -NewName $rename -Force 

})

# Refresh the form
$interfaceMenuForm.Refresh()

#========================================================================

#                              End Management of events

#========================================================================

# Display the button
$interfaceMenuForm.Controls.Add($button_Close)
$interfaceMenuForm.Controls.Add($button_submit)

# Add the label and textbox on the form 
$interfaceMenuForm.Controls.Add($label_name)

# Display the form
$interfaceMenuForm.ShowDialog()