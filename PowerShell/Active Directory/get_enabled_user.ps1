
# get and export all enabled users 
# add or remove the user properties


Get-ADUser -Filter {Enabled -eq $true} -properties * | select-object displayname ,Enabled | export-csv -path C:\Scripts\enabled_users.csv

# or if a LDAP directory is available

Get-ADUser -LDAPFilter '(!userAccountControl:1.2.840.113556.1.4.803:=2)'