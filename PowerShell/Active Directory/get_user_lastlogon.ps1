
# get and export all users with their names 
# and their last logon date


Get-ADUser -Filter *  -Properties * | select displayname, LastLogonDate | export-csv -path C:\Scripts\user_lastlogon.csv