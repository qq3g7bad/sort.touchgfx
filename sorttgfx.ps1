
param (
  [Parameter(Mandatory=$false, Position=0)]
  [string]$filePath = ".\MyApplication.touchgfx",

  [Parameter(Mandatory=$false)]
  [switch]$Backup
)

Set-Location -Path $PSScriptRoot

# Check if file exists
if (!(Test-Path -Path $filePath)) {
  Write-Error "$filePath is not found."
  exit 1
}

Write-Host "Processing: $filePath" -ForegroundColor Cyan

try {
  # Create backup if requested
  if ($Backup) {
    $backupPath = "$filePath.backup"
    Write-Verbose "Creating backup: $backupPath"
    Copy-Item -Path $filePath -Destination $backupPath -Force
    Write-Host "Backup created: $backupPath" -ForegroundColor Green
  }

  # Get *.touchgfx data
  Write-Verbose "Reading TouchGFX file..."
  $jsonString = Get-Content -Path $filePath -Raw -Encoding UTF8

  # Parse JSON
  Write-Verbose "Parsing JSON data..."
  $jsonObject = $jsonString | ConvertFrom-Json

  # Validate JSON structure
  if ($null -eq $jsonObject.Application) {
    Write-Error "Invalid TouchGFX file: 'Application' property not found."
    exit 1
  }

  # Sort Screens
  if ($null -ne $jsonObject.Application.Screens) {
    $screenCount = $jsonObject.Application.Screens.Count
    Write-Verbose "Sorting $screenCount screen(s)..."
    $jsonObject.Application.Screens = $jsonObject.Application.Screens | Sort-Object -Property Name
    Write-Host "Sorted $screenCount screen(s)" -ForegroundColor Green
  } else {
    Write-Verbose "No screens found to sort."
  }

  # Sort Custom Container Definitions
  if ($null -ne $jsonObject.Application.CustomContainerDefinitions) {
    $containerCount = $jsonObject.Application.CustomContainerDefinitions.Count
    Write-Verbose "Sorting $containerCount custom container(s)..."
    $jsonObject.Application.CustomContainerDefinitions = $jsonObject.Application.CustomContainerDefinitions | Sort-Object -Property Name
    Write-Host "Sorted $containerCount custom container(s)" -ForegroundColor Green
  } else {
    Write-Verbose "No custom containers found to sort."
  }

  # Convert back to JSON and save
  Write-Verbose "Converting to JSON and saving..."
  $jsonString = $jsonObject | ConvertTo-Json -Depth 50
  Set-Content -Path $filePath -Value $jsonString -Encoding UTF8

  Write-Host "Successfully sorted TouchGFX file!" -ForegroundColor Green

} catch {
  Write-Error "ERROR: $_"
  exit 1
}

