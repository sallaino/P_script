<#
.NOTES
	///ETML 
	///Auteur      : Sallaino
	///Date        : 01.06.2016 
.SYNOPSIS

    Graphical interface allowing to rename the computer
 	
.DESCRIPTION

    This script allows to create a graphical interface which has for feature  to modifie the IP adress of the computer
 	
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
    $label_IP = New-Object System.Windows.Forms.Label
    $label_IP.Location = New-Object System.Drawing.Point(135,20)
    $label_IP.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)

    # name of the computer's textbox 
    $textbox_IP = New-Object System.Windows.Forms.TextBox
    $textbox_IP.AutoSize = $true
    $textbox_IP.Location = New-Object System.Drawing.Point(60,50)
    $textbox_IP.Size = New-Object System.Drawing.Size(220,20)



    # rename of the computer's label
    $label_gateWay = New-Object System.Windows.Forms.Label
    $label_gateWay.Location = New-Object System.Drawing.Point(110,120)
    $label_gateWay.Size = New-Object System.Drawing.Size($widthlabel,$heightlabel)

    # rename of the computer's textbox 
    $textbox_gateway = New-Object System.Windows.Forms.TextBox
    $textbox_gateway.AutoSize = $true
    $textbox_gateway.Location = New-Object System.Drawing.Point(60,150)
    $textbox_gateway.Size = New-Object System.Drawing.Size(220,20)


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

$label_IP.Text = "Adresse IP" 



# Set the computer name and prepare to display it
$label_gateWay.Text = "Gateway par default"




# Verify the user's entry and redirect to the other form to rename
$button_submit.Add_Click(
{       

     $userValueIP = $textbox_IP.Text

     $userValueGateway = $textbox_gateway.Text

     $ip = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]

     $defaultGateway = ((ipconfig | findstr [0-9].\.)[2]).Split()[-1]

     if($defaultGateway = $null)
     {
        Remove-NetIPAddress –InterfaceIndex 3 –IPAddress $ip –PrefixLength 16 –DefaultGateway $null
        New-NetIPAddress –InterfaceIndex 3 –IPAddress $userValueIP –PrefixLength 16 –DefaultGateway $userValueGateway
     }
     else
     {
     
        Remove-NetIPAddress –InterfaceIndex 3 –IPAddress $ip –PrefixLength 16 –DefaultGateway $defaultGateway    

        New-NetIPAddress –InterfaceIndex 3 –IPAddress $userValueIP –PrefixLength 16 –DefaultGateway $userValueGateway
     
     }
     $interfaceMenuForm.Close()
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
$interfaceMenuForm.Controls.Add($label_IP)
$interfaceMenuForm.Controls.Add($textbox_IP)
$interfaceMenuForm.Controls.Add($label_gateWay)
$interfaceMenuForm.Controls.Add($textbox_gateway)

# Display the form
$interfaceMenuForm.ShowDialog()