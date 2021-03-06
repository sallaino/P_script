<#
.NOTES
	///ETML 
	///Auteur      : Sallaino
	///Date        : 01.06.2016 
.SYNOPSIS

    Graphical interface allowing to launch scripts
 	
.DESCRIPTION

    This script allows to create a graphical interface which has for feature to allow the user of throw of the scripts by default or personal scripts 
 	
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
$interfaceForm = New-Object Windows.Forms.Form

# Disable the resize, minimise and maximise function
$interfaceForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$interfaceForm.MaximizeBox = $false

# Form's title
$interfaceForm.Text = "Script launcher"

# Form' size
$interfaceForm.Size = New-Object System.Drawing.Size(800,650)


#========================================================================

#                              Buttons

#========================================================================

# backup's button
$button_backup = New-Object System.Windows.Forms.Button
$button_backup.Text = "Lancer un backup"
$button_backup.Size = New-Object System.Drawing.Size(360,50)
$button_backup.Location = New-Object System.Drawing.Size(18,50)

# port list's button
$button_portList = New-Object System.Windows.Forms.Button
$button_portList.Text = "Obtenir la liste des ports ouverts"
$button_portList.Size = New-Object System.Drawing.Size(360,50)
$button_portList.Location = New-Object System.Drawing.Size(18,110)

# network informations' button
$button_networkInfo = New-Object System.Windows.Forms.Button
$button_networkInfo.Text = "Information du reseau"
$button_networkInfo.Size = New-Object System.Drawing.Size(360,50)
$button_networkInfo.Location = New-Object System.Drawing.Size(18,170)

# Modifie IP Address's button
$button_modifieIPAddress = New-Object System.Windows.Forms.Button
$button_modifieIPAddress.Text = "Modifier l'addresse IP"
$button_modifieIPAddress.Size = New-Object System.Drawing.Size(360,50)
$button_modifieIPAddress.Location = New-Object System.Drawing.Size(18,230)

# Get back computer's name's button
$button_getName = New-Object System.Windows.Forms.Button
$button_getName.Text = "Nom du PC"
$button_getName.Size = New-Object System.Drawing.Size(360,50)
$button_getName.Location = New-Object System.Drawing.Size(18,290)

# Modifie computer's name's button
$button_modifieName = New-Object System.Windows.Forms.Button
$button_modifieName.Text = "Modifier le nom du PC"
$button_modifieName.Size = New-Object System.Drawing.Size(360,50)
$button_modifieName.Location = New-Object System.Drawing.Size(18,350)

# Launch personnal' script's button
$button_launchScript = New-Object System.Windows.Forms.Button
$button_launchScript.Text = "Lancer vos scripts personnels"
$button_launchScript.Size = New-Object System.Drawing.Size(360,50)
$button_launchScript.Location = New-Object System.Drawing.Size(18,410)

# Close the application
$button_Close = New-Object System.Windows.Forms.Button
$button_Close.Text = "Quitter l'application"
$button_Close.Size = New-Object System.Drawing.Size(760,50)
$button_Close.Location = New-Object System.Drawing.Size(18,530)

#========================================================================

#                              End Button

#========================================================================

#========================================================================

#                              Labels

#========================================================================

# Default script's label
$label_defScript = New-Object System.Windows.Forms.Label
$label_defScript.Location = New-Object System.Drawing.Point(150,20)
$label_defScript.Size = New-Object System.Drawing.Size(100,20)
$label_defScript.Text = "Script par défaut :"

# Result of the scripts' label
$label_result = New-Object System.Windows.Forms.Label
$label_result.Location = New-Object System.Drawing.Point(550,20)
$label_result.Size = New-Object System.Drawing.Size(100,20)
$label_result.Text = "Résulat :"

#========================================================================

#                              End Label

#========================================================================

# Display the button
$interfaceForm.Controls.Add($button_backup)
$interfaceForm.Controls.Add($button_portList)
$interfaceForm.Controls.Add($button_networkInfo)
$interfaceForm.Controls.Add($button_modifieIPAddress)
$interfaceForm.Controls.Add($button_getName)
$interfaceForm.Controls.Add($button_modifieName)
$interfaceForm.Controls.Add($button_launchScript)
$interfaceForm.Controls.Add($button_Close)

# Display the label
$interfaceForm.Controls.Add($label_defScript)
$interfaceForm.Controls.Add($label_result)


# Display the form
$interfaceForm.ShowDialog()