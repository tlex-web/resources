
# get and export all users


Get-ADUser -filter * -Properties * | select properties | export-csv -path C:\Scripts\users_all.csv