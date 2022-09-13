curl -s https://api.github.com/repos/microsoft/winget-cli/releases/latest | sls "*.msixbundle" | mci


https://api.github.com/repos/d2phap/ImageGlass/releases/latest