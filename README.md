# EclipticLynx

# Usage

For Windows you have to run ```sheet_genie``` with either:
```sh
./sheet_genie
```
**or**
```sh
mix escript sheet_genie
```

**Create Theme**:
```sh
exlynx create [THEME_NAME] 
```
This will create a KDE config script based on the selected settings.
It will prompt to overwrite existing themes with that name.

```sh
exlynx set [THEME_NAME]
```
This will set the current KDE global config to the selected theme.
It will also reload the config and restart the plasma shell.


## Prerequisites

In order to run Elixir applications, you must first have Elixir and the Erlang VM installed on your machine. To do this, you must first have a package manager such as Homebrew (Mac), Chocolatey (Windows), or any Linux distro's package manager.

### macOS

1. **Install Homebrew**:
   - Open your Terminal and run the following command to install Homebrew:
     ```sh
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     ```
     
2. **Install Erlang and Elixir**:
   - Once Homebrew is installed, run the following commands to install Erlang and Elixir:
     ```sh
     brew install erlang
     brew install elixir
     ```

### Windows

1. **Install Chocolatey**:
   - Open PowerShell as an Administrator and run the following command to install Chocolatey:
     ```powershell
     Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
     
     ```
2. **Install Erlang and Elixir**:
   - Once Chocolatey is installed, run the following commands to install Erlang and Elixir:
     ```powershell
     choco install erlang
     choco install elixir
     ```

### Linux

1. **Install Erlang and Elixir**:
   - Depending on your Linux distribution, follow the respective instructions below:

   **Ubuntu/Debian**:
   ```sh
    sudo apt update
    sudo apt install -y esl-erlang elixir
   ```

   **Fedora:**
   ```sh
    sudo dnf install -y erlang elixir
   ```

   **Arch Linux:**
   ```sh
    sudo pacman -S erlang elixir
   ```

## Installation

The program can be built and installed using the respective setup file for your operating system.   
**Important: You ONLY need the install script. No need to clone the repository 
  since the script will handle that.**

```sh
# For macOS
./install_mac.sh

# For Linux
./install_linux.sh

# For Windows
install_windows.bat
```

If the setup doesn't run then try adding this before running the install script:
```sh
chmod +x install_mac.sh 
```

# License

**MIT License**

Copyright (c) 2024 RyanBlaney

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
