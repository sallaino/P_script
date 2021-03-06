<#
.NOTES
	///ETML 
	///Auteur      : Sallaino
	///Date        : 01.06.2016 
.SYNOPSIS

    Graphical interface allowing to alert the rename the computer
 	
.DESCRIPTION

    This script allows to create a graphical interface which has for feature  to alert the rename the computer 
 	
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
$button_close = New-Object System.Windows.Forms.Button
$button_close.Text = "Annuler"
$button_close.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_close.Location = New-Object System.Drawing.Size(170,100)

# Submit's button
$button_submit = New-Object System.Windows.Forms.Button
$button_submit.Text = "Redémarrer"
$button_submit.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_submit.Location = New-Object System.Drawing.Size(60,100)

#========================================================================

#                              Labels

#========================================================================

# Constants
[int]$widthlabel = 300
[int]$heightlabel = 60

# Description's label
$label_description = New-Object System.Windows.Forms.Label
$label_description.Location = New-Object System.Drawing.Point(20,20)
$label_description.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)
$label_description.Font = New-object System.Drawing.Font("Arial",12)



#========================================================================

#                              Management of events

#========================================================================

# Close the application
$button_close.Add_Click(
{

   $interfaceMenuForm.Close()

})

# description label
$label_description.Text = "Vous devez redémarrer votre ordinateur pour que le changement soit pris en compte " 
 
# Submit the computer name and rename it
$button_submit.Add_Click(
{
   
   Rename-Computer -NewName $rename -Force 

})

# Refresh the form
$interfaceMenuForm.Refresh()

#========================================================================

#                           Display componant

#========================================================================

# Display the button
$interfaceMenuForm.Controls.Add($button_close)
$interfaceMenuForm.Controls.Add($button_submit)

# Add the label and textbox on the form 
$interfaceMenuForm.Controls.Add($label_description)

# Display the form
$interfaceMenuForm.ShowDialog()