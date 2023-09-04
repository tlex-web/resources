

function get-full-date {
    # function to extract 

    $d = Get-Date

    Add-Member -MemberType ScriptMethod -Name GetWeekOfYear `
    -Value {Get-Date -uformat %V} -inputobject $d

    # return the reformatted datetime object 
    $d
}

function display {

    $d = get-full-date

    ($d).getWeekOfYear()

}

Set-Alias week display