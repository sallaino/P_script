<#
.NOTES
	///ETML 
	///Auteur      : Sallaino
	///Date        : 08.06.2016 
.SYNOPSIS

    Graphical interface allowing to do a backup
 	
.DESCRIPTION

    This script allows to create a graphical interface which has for feature to do a backup
 	
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
$interfaceMenuForm.Text = "Back up !"

# Form' size
$interfaceMenuForm.Size = New-Object system.Drawing.Size(350,345)

#========================================================================

#                              DataTables

#========================================================================

# Create the data table
$PartitionData = New-Object system.Data.DataTable

# Defined the 2 columns (name, type)
$PartitionName = New-Object system.Data.DataColumn PartitionName,([string])
$Partition = New-Object system.Data.DataColumn Partition,([string])

# Add the columns in the data table
$PartitionData.Columns.Add($PartitionName)
$PartitionData.Columns.Add($Partition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "D:\"
$lignePartition.PartitionName = "D:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "E:\"
$lignePartition.PartitionName = "E:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "F:\"
$lignePartition.PartitionName = "F:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "G:\"
$lignePartition.PartitionName = "G:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "H:\"
$lignePartition.PartitionName = "H:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "I:\"
$lignePartition.PartitionName = "I:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "J:\"
$lignePartition.PartitionName = "J:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "K:\"
$lignePartition.PartitionName = "K:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "L:\"
$lignePartition.PartitionName = "L:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "M:\"
$lignePartition.PartitionName = "M:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "N:\"
$lignePartition.PartitionName = "N:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "O:\"
$lignePartition.PartitionName = "O:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "P:\"
$lignePartition.PartitionName = "P:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "Q:\"
$lignePartition.PartitionName = "Q:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "R:\"
$lignePartition.PartitionName = "R:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "S:\"
$lignePartition.PartitionName = "S:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "T:\"
$lignePartition.PartitionName = "T:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "U:\"
$lignePartition.PartitionName = "U:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "V:\"
$lignePartition.PartitionName = "V:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "W:\"
$lignePartition.PartitionName = "W:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "X:\"
$lignePartition.PartitionName = "X:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "Y:\"
$lignePartition.PartitionName = "Y:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)
#------------------------------------------------------------------------

# Create a new line
$lignePartition = $PartitionData.NewRow()

# Defined the patition's column and the Partition's name column
$lignePartition.Partition = "Z:\"
$lignePartition.PartitionName = "Z:"

# Add the new line in the data table
$PartitionData.Rows.Add($lignePartition)

#========================================================================

#                              Views

#========================================================================

# Create the views
$view_part = New-Object System.Data.DataView($PartitionData)

# Sorting the column "Partition" in increasing order.
$view_part.Sort="Partition ASC"


#========================================================================

#                              ComboBox

#========================================================================

# Create the combobox
$comboBox_part = New-Object System.Windows.Forms.Combobox
$comboBox_part.Location = New-Object Drawing.Point (120, 50)
$comboBox_part.Size = New-Object System.Drawing.Size(200, 30)
$comboBox_part.DropDownStyle = "DropDownList"

# Set the combobox with the data and create a Binding Context
$comboBox_part.BindingContext = New-Object System.Windows.Forms.BindingContext
$comboBox_part.DataSource = $view_part            
$comboBox_part.DisplayMember = "PartitionName"        
$comboBox_part.ValueMember = "Partition"     
$comboBox_part.SelectedValue = "D:\"

#========================================================================

#                              Buttons

#========================================================================

# Constants
[int]$widthButton = 300
[int]$heightButton = 60

# backup's button
$button_backup = New-Object System.Windows.Forms.Button
$button_backup.Text = "Back up"
$button_backup.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_backup.Location = New-Object System.Drawing.Size(20,170)

# close's button
$button_close = New-Object System.Windows.Forms.Button
$button_close.Text = "Annuler"
$button_close.Size = New-Object System.Drawing.Size($widthButton,$heightButton)
$button_close.Location = New-Object System.Drawing.Size(20,240)

# informatiion's button
$button_info = New-Object System.Windows.Forms.Button
$button_info.Text = "Aide !"
$button_info.Size = New-Object System.Drawing.Size(330,30)
$button_info.Location = New-Object System.Drawing.Size(5,5)

#========================================================================

#                             Labels

#========================================================================

# Partition's label 
$label_part = New-Object System.Windows.Forms.Label
$label_part.AutoSize = $true
$label_part.Location = New-Object System.Drawing.Point(20,55)
$label_part.Text = "Partition a copier:"

# Destination's label 
$label_desti = New-Object System.Windows.Forms.Label
$label_desti.AutoSize = $true
$label_desti.Location = New-Object System.Drawing.Point(20,100)
$label_desti.Text = "Indiquez le chemin de destination"

#========================================================================

#                             Textboxes

#========================================================================


# Destination path's textbox 
$textbox_desti = New-Object System.Windows.Forms.TextBox
$textbox_desti.Location = New-Object System.Drawing.Point(20,125)
$textbox_desti.Size = New-Object System.Drawing.Size(300,30)

#========================================================================

#                              Management of events

#========================================================================


# Copy the disc and past it in the destination folder
$button_backup.Add_Click(
{       
   
   # Variables
   $pathDesti = $textbox_desti.Text
   $path = $comboBox_part.SelectedValue

   # test if the path exist and create it if it doesn't exist
   $test = Test-Path $path

   # test if $value is empty
   if($pathDesti -eq "")
   {
        # - 
   }
   else
   {
        
        $regex = "^[ ]"

        # Verifie that the path is not a empty character
        if($textbox_desti.Text -match $regex)
        {
            # -           
        }
        else
        {
            # Verifie if it's an existing path, copy it and display success form
            if ($test -eq $true){

                Robocopy $path $pathDesti /mir

                Set-Location \\VBOXSVR\Scripts

                .\succesBackup.ps1

                $interfaceMenuForm.close()

            }     
        }

   }
  
   

})

# Display the information's form
$button_info.Add_Click(
{       
    
   Set-Location \\VBOXSVR\Scripts

   .\Info.ps1

})

# Close the application
$button_close.Add_Click(
{

 $interfaceMenuForm.close()

})

#========================================================================

#                              Display componants

#========================================================================



# Add the buttons on the form
$interfaceMenuForm.Controls.Add($button_backup)
$interfaceMenuForm.Controls.Add($button_info)
$interfaceMenuForm.Controls.Add($button_close)


# Add the textboxes on the form 
$interfaceMenuForm.Controls.Add($textbox_desti)

# Add the labels on the form 
$interfaceMenuForm.Controls.Add($label_part)
$interfaceMenuForm.Controls.Add($label_desti)

# Add the combobox on the form 
$interfaceMenuForm.controls.add($comboBox_part)

# Display the form
$interfaceMenuForm.ShowDialog()
