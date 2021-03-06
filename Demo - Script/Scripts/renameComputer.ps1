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
$interfaceMenuForm.Size = New-Object System.Drawing.Size(350,325)


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
$button_Close.Location = New-Object System.Drawing.Size(170,220)

# Submit's button
$button_submit = New-Object System.Windows.Forms.Button
$button_submit.Text = "Modifier"
$button_submit.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_submit.Location = New-Object System.Drawing.Size(60,220)

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
    $label_name.Location = New-Object System.Drawing.Point(100,20)
    $label_name.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)

    # name of the computer's textbox 
    $textbox_name = New-Object System.Windows.Forms.TextBox
    $textbox_name.AutoSize = $true
    $textbox_name.Location = New-Object System.Drawing.Point(60,50)
    $textbox_name.Size = New-Object System.Drawing.Size(220,20)
    $textbox_name.readonly = $true



    # rename of the computer's label
    $label_rename = New-Object System.Windows.Forms.Label
    $label_rename.Location = New-Object System.Drawing.Point(15,120)
    $label_rename.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)

    # rename of the computer's textbox 
    $textbox_rename = New-Object System.Windows.Forms.TextBox
    $textbox_rename.AutoSize = $true
    $textbox_rename.Location = New-Object System.Drawing.Point(60,150)
    $textbox_rename.Size = New-Object System.Drawing.Size(220,20)


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
$label_name.Text = "Le nom actuel de votre PC est : " 
$textbox_name.Text = $servName


# Set the computer name and prepare to display it
$label_rename.Text = "Entrez le nouveau nom: (Sans ecpaces et max: 15 caractères) "



# Verify the user's entry and redirect to the other form to rename
$button_submit.Add_Click(
{       
            $regex = "[¦@#°§¬|¢~'_.,;:\\\/\* èàéàäüö\=\)\(\>\<\!\?\^\$\¨\£]"

             if($textbox_rename.Text -match $regex)
            {
                   
            }
            else{

                if($textbox_rename.Text -ne ""){    
            
                       $rename = $textbox_rename.Text

                       Set-Location \\VBOXSVR\Scripts

                       .\AlertRename.ps1
              
                }
            }
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
$interfaceMenuForm.Controls.Add($textbox_name)
$interfaceMenuForm.Controls.Add($label_rename)
$interfaceMenuForm.Controls.Add($textbox_rename)

# Display the form
$interfaceMenuForm.ShowDialog()