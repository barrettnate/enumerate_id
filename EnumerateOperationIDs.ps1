# Define the list of keywords to search for
$keywords = "USMT"

# Search Active Directory for enabled users whose names contain the keywords
$users = Get-ADUser -Filter {(Enabled -eq $true) -and (Name -match ($keywords -join "|"))}

# Loop through each user in the list
foreach ($user in $users) {
    # Add the user's name to the text file
    Add-Content -Path "C:\scripts\AD\usmtIDs.txt" -Value $user.Name
    Write-Host "Added user $($user.Name) to the text file"
}
