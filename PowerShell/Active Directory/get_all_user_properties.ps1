
# Get and export all properties of a single user 
# replace username with the respective user


Get-ADUser -Identity username -Properties * | export-csv -path C:\Scripts\user_all_properties.csv