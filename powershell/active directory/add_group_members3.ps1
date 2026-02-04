$group = “YourGroupName”

$members = Import-Csv -Path “C:\Path\To\Your\GroupMembers.csv”

foreach ($member in $members) {

    $user = Get-ADUser -Identity $member.Username

    if ($user) {

        Add-ADGroupMember -Identity $group -Members $user.SamAccountName

        Write-Host "Added $($member.Username) to $group"

    } else {

        Write-Host "User $($member.Username) not found."

    }

}