# 🔃 sort.touchgfx

Sort screens and containers in TouchGFX Designer file.

## 🚀 Usage

* Provide a *.touchgfx file as an argument.
  * Then the screens and containers in the *.touchgfx file are sorted.
  * The file is overwritten.
* The *.touchgfx file is written as JSON and runs only on Windows. Therefore this script is written by PowerShell and uses JSON objects.
  * Once sorted the *.touchgfx file will have an unformatted style, but when run in TouchGFX Designer the file will be formatted.

```powershell
.\sorttgfx.ps1 ..\MyApplication.touchgfx
```


