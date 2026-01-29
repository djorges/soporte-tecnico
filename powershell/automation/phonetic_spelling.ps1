# this script takes a list of words and converts each word into a basic phonetic spelling by replacing certain vowels with their phonetic equivalents.
$words = @("example", "automation", "PowerShell")

$phoneticSpelling = $words | ForEach-Object { 

    $_ -replace "a", "ay" -replace "e", "ee" -replace "i", "eye"

}

$phoneticSpelling