
# get and export all users in a specific container
# specify the paths of the containers you want to extract users from

Get-ADUser -Filter * -Properties * -SearchBase "OU=Accounting,OU=ADPRO Users,DC=ad,DC=activedirectorypro,DC=com" | select displayname, Enabled | export-csv -path C:\Scripts\user_container.csv