$FILE = "sample.csv"
# This file was originally created by Google Gemini and then edited by admin -at- calyaconsult.com

# Read the file and remove carriage returns
$content = Get-Content $FILE -Encoding UTF8 | ForEach-Object { $_ -replace "\r", "" }

# Replace commas with table cell separators
$content = $content | ForEach-Object { $_ -replace ",", "</td><td>" }

# Wrap each line in table row and cell tags
$content = $content | ForEach-Object { "<tr><td>$_</td></tr>" }

# Remove quotes
$content = $content | ForEach-Object { $_ -replace '"', "" }

# Create the table header
$header = "<table>"
$header += @("$($content[0] -replace "td", "th")")

# Remove the first line - which has already been used to create the header - from the body of the table
$content = $content | Select-Object -Skip 1

# Combine header and content
$html = $header + $content

# Add final table closing tag
$html += "</table>"

# Write to console
# Write-Output $html

# Write to file
$html | Out-File -Encoding UTF8 "table.html"
