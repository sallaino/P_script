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
[void][System.Windows.Forms.Application]::EnableVisualStyles()

# Create the form
$interfaceMenuForm = New-Object Windows.Forms.Form

# Disable the resize, minimise and maximise function
$interfaceMenuForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$interfaceMenuForm.MaximizeBox = $false

# Form's title
$interfaceMenuForm.Text = "Script launcher"

# Form' size
$interfaceMenuForm.Size = New-Object System.Drawing.Size(400,620)


#========================================================================

#                              Buttons

#========================================================================

# Constants
[int]$posWidthButton = 16
[int]$widthButton = 360
[int]$heightButton = 50

# backup's button
$button_backup = New-Object System.Windows.Forms.Button
$button_backup.Text = "Lancer un backup"
$button_backup.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_backup.Location = New-Object System.Drawing.Size($posWidthButton,50)

# port list's button
$button_portList = New-Object System.Windows.Forms.Button
$button_portList.Text = "Obtenir la liste des ports ouverts"
$button_portList.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_portList.Location = New-Object System.Drawing.Size($posWidthButton,110)

# network informations' button
$button_networkInfo = New-Object System.Windows.Forms.Button
$button_networkInfo.Text = "Information du reseau"
$button_networkInfo.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_networkInfo.Location = New-Object System.Drawing.Size($posWidthButton,170)

# Modifie IP Address's button
$button_modifieIPAddress = New-Object System.Windows.Forms.Button
$button_modifieIPAddress.Text = "Modifier l'addresse IP"
$button_modifieIPAddress.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_modifieIPAddress.Location = New-Object System.Drawing.Size($posWidthButton,230)

# Get back computer's name's button
$button_getName = New-Object System.Windows.Forms.Button
$button_getName.Text = "Nom du PC"
$button_getName.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_getName.Location = New-Object System.Drawing.Size($posWidthButton,290)

# Modifie computer's name's button
$button_modifieName = New-Object System.Windows.Forms.Button
$button_modifieName.Text = "Modifier le nom du PC"
$button_modifieName.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_modifieName.Location = New-Object System.Drawing.Size($posWidthButton,350)

# Launch personnal' script's button (not in the specification)
$button_launchScript = New-Object System.Windows.Forms.Button
$button_launchScript.Text = "Lancer vos scripts personnels"
$button_launchScript.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_launchScript.Location = New-Object System.Drawing.Size($posWidthButton,410)
$button_launchScript.Enabled = $false

# Close the application
$button_close = New-Object System.Windows.Forms.Button
$button_close.Text = "Quitter l'application"
$button_close.Size = New-Object System.Drawing.Size(364,$heightButton)
$button_close.Location = New-Object System.Drawing.Size($posWidthButton,530)

#========================================================================

#                              Labels

#========================================================================

# Constants
[int]$widthlabel = 100
[int]$heightlabel = 20

# Default script's label
$label_defScript = New-Object System.Windows.Forms.Label
$label_defScript.Location = New-Object System.Drawing.Point(150,20)
$label_defScript.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)
$label_defScript.Text = "Script par défaut :"

# Result of the scripts' label
$label_result = New-Object System.Windows.Forms.Label
$label_result.Location = New-Object System.Drawing.Point(550,20)
$label_result.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)
$label_result.Text = "Résulat :"

#========================================================================

#                              Management of events

#========================================================================

# Close the application
$button_close.Add_Click(
{

    $interfaceMenuForm.Close()

})

# Get back the computer's name
$button_getName.Add_Click(
{

    Set-Location \\VBOXSVR\Scripts

    .\getName.ps1


})

# Modifie the computer's name
$button_modifieName.Add_Click(
{

    Set-Location \\VBOXSVR\Scripts

    .\renameComputer.ps1


})

# Display the data informations
$button_networkInfo.Add_Click(
{

    Set-Location \\VBOXSVR\Scripts

    .\networkData


})

# Change IP address
$button_modifieIPAddress.Add_Click(
{

    Set-Location \\VBOXSVR\Scripts

    .\modifieIp


})

# Launch your own scripts (not in the specification)
$button_launchScript.Add_Click(
{

    Set-Location \\VBOXSVR\Scripts

    .\ownScript


})

# Display open ports 'list
$button_portList.Add_Click(
{

    Set-Location \\VBOXSVR\Scripts

    .\openPorts.ps1


})

# Make a back up
$button_backup.Add_Click(
{

    Set-Location \\VBOXSVR\Scripts

    .\backup.ps1


})

#========================================================================

#                              End Management of events

#========================================================================

# Display the button
$interfaceMenuForm.Controls.Add($button_backup)
$interfaceMenuForm.Controls.Add($button_portList)
$interfaceMenuForm.Controls.Add($button_networkInfo)
$interfaceMenuForm.Controls.Add($button_modifieIPAddress)
$interfaceMenuForm.Controls.Add($button_getName)
$interfaceMenuForm.Controls.Add($button_modifieName)
$interfaceMenuForm.Controls.Add($button_launchScript)
$interfaceMenuForm.Controls.Add($button_close)

# Display the form
$interfaceMenuForm.ShowDialog()