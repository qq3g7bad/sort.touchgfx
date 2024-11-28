
param (
  [string]$filePath = ".\MyApplication.touchgfx"
)

Set-Location -Path $PSScriptRoot

if (!(Test-Path -Path $FilePath)) {
  Write-Error "$FilePath is not found."
  exit 1
}


try {
  $indentLevel = 0

  # Get *.touchgfx data
  $jsonString = Get-Content -Path $FilePath -Raw

  # Sort
  $jsonObject = $jsonString | ConvertFrom-Json
  $jsonObject.Application.Screens = $jsonObject.Application.Screens | Sort-Object -Property Name
  $jsonObject.Application.CustomContainerDefinitions = $jsonObject.Application.CustomContainerDefinitions | Sort-Object -Property Name
  $jsonString = $jsonObject | ConvertTo-Json -Depth 50
  Set-Content -Path $FilePath -Value $jsonString
} catch {
    Write-Error "ERROR: $_"
    exit 1
}

