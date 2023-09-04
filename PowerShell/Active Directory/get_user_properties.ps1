
# Get and export selected properties of a single user 
# replace username with the respective user
# replace properties with the properties you want


Get-ADUser -Identity username -Properties * | select properties | export-csv -path C:\Scripts\user_properties.csv