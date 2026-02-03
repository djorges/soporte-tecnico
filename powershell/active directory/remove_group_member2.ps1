$groupName = "Developers"
$username = "jdoe"

$group = Get-ADGroup -Identity $groupName -ErrorAction SilentlyContinue
$user  = Get-ADUser -Identity $username -ErrorAction SilentlyContinue

if ($null -eq $group) {
    Write-Host "Group '$groupName' does not exist."
    return
}

if(Get-ADGroupMember $groupName | WhereObject SamAccountName -eq $username){
    Write-Host "User already a member of the group."
    return
}

Remove-ADGroupMember -Identity $groupName -Members $username -Confirm:$false

Add-Content "C:\logs\group_changes.log" `
"$(Get-Date) - $username removed from $groupName"