# 🔃 sort.touchgfx

## 🌱 Overview

Sort.TouchGFX is a PowerShell script designed to sort screens and containers inside a `*.touchgfx` file used by TouchGFX Designer.
This script processes the `*.touchgfx` file as JSON and sorts the screens and containers in alphabetical order.

## 🚀 Usage

### 1. Clone the Repository

First, clone the repository to your local environment:

```bash
git clone https://github.com/qq3g7bad/sort.touchgfx.git
```

### 2. Run the PowerShell Script

Next, execute the PowerShell script, providing the path to your `*.touchgfx` file as an argument:

```powershell
.\sorttgfx.ps1 ..\MyApplication.touchgfx
```

### Notes:

- This script is designed to run on Windows.
- The `*.touchgfx` file is stored in JSON format, and the script modifies this JSON structure.
- The script will overwrite the original `*.touchgfx` file.
- After sorting, the formatting of the `*.touchgfx` file may appear disrupted. However, opening it in TouchGFX Designer will automatically restore proper formatting.


