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
$interfaceMenuForm.AutoSize = $true


#========================================================================

#                              Buttons

#========================================================================

# Constants
[int]$widthButton = 300
[int]$heightButton = 60

# backup's button
$button_Close = New-Object System.Windows.Forms.Button
$button_Close.Text = "Annuler"
$button_Close.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_Close.Location = New-Object System.Drawing.Size(5,230)

# Submit's button
$button_submit = New-Object System.Windows.Forms.Button
$button_submit.Text = "Lancer le script"
$button_submit.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_submit.Location = New-Object System.Drawing.Size(5,160)

$button_script = New-Object System.Windows.Forms.Button
$button_script.Text = "Choisissez un script"
$button_script.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_script.Location = New-Object System.Drawing.Size(5,90)


#========================================================================

#                              End Button

#========================================================================

#========================================================================

#                              Labels

#========================================================================

# Constants

   
     # rename of the computer's textbox 
    $textbox_desti = New-Object System.Windows.Forms.TextBox
    $textbox_desti.AutoSize = $true
    $textbox_desti.Location = New-Object System.Drawing.Point(5,50)
    $textbox_desti.Size = New-Object System.Drawing.Size(300,60)
    $textbox_desti.ReadOnly = $true


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
# Verify the user's entry and redirect to the other form to rename
$button_script.Add_Click(
{       
    # name of the computer's textbox 
    $openFile_file = New-Object System.Windows.Forms.OpenFileDialog
    $openFile_file.FilterIndex = 3
    $show = $openFile_file.ShowDialog()
    

    $textbox_desti.Text = $openFile_file.FileName
    
    $file = $textbox_desti.Text
    
})



# Verify the user's entry and redirect to the other form to rename
$button_submit.Add_Click(
{       
    
    Start-Process Powershell.exe

})



# Refresh the form
$interfaceMenuForm.Refresh()

#========================================================================

#                              End Management of events

#========================================================================

# Display the button
$interfaceMenuForm.Controls.Add($button_script)
$interfaceMenuForm.Controls.Add($button_submit)
$interfaceMenuForm.Controls.Add($button_Close)



# Add the label and textbox on the form 
$interfaceMenuForm.Controls.Add($textbox_desti)

# Display the form
$interfaceMenuForm.ShowDialog()
