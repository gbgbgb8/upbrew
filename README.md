# 🍺 UpBrew - Homebrew Maintenance Script

A simple, user-friendly bash script to automate Homebrew maintenance tasks on macOS and Linux. UpBrew keeps your Homebrew installation clean, up-to-date, and healthy with a single command.

## 📝 Features

- Updates Homebrew package database
- Upgrades all installed formulae (packages)
- Upgrades all installed casks (macOS applications)
- Cleans up old versions and cached downloads
- Checks system for potential problems
- Beautiful color-coded output for easy reading
- Smart DNS resolution handling
  - Pre-resolves required domains
  - Automatically fixes DNS issues when needed
  - Only requests sudo access when necessary
- Single password prompt design
  - Asks for password only once at start
  - Additional prompt only if DNS cache needs flushing

## 🚦 Status Indicators Explained

When running UpBrew, you'll see these indicators:
- `==>` (Blue): Starting a new task or providing information
- `✔` (Green): Task completed successfully
- `!` (Yellow): Minor issue or warning - usually handled automatically
- `✘` (Red): Error that needs attention

## 📊 What UpBrew Does (In Detail)

1. **Initial Setup**
   - Checks for Homebrew installation
   - Requests sudo privileges if needed
   - Pre-resolves required domains

2. **Updates Homebrew** (`brew update`)
   - Downloads latest package information
   - Automatically handles DNS issues if they occur
   - Retries with DNS warm-up if needed

3. **Upgrades Packages** (`brew upgrade`)
   - Updates all your command-line tools
   - Similar to updating apps on your phone

4. **Upgrades Casks** (`brew upgrade --cask`)
   - Updates GUI applications installed via Homebrew
   - Only runs on macOS

5. **Cleanup** (`brew cleanup`)
   - Removes old versions of packages
   - Frees up disk space
   - Like emptying the trash

6. **Health Check** (`brew doctor`)
   - Checks for system issues
   - Suggests fixes if needed
   - Like running a diagnostic test

## 🔒 About Permissions

When you see:
```
Administrator privileges needed for some operations. Please enter your password:
```
This is normal! UpBrew needs your password for:
- Initial Homebrew operations
- DNS cache flushing (only if needed)

You might occasionally see a second password prompt if:
- DNS resolution fails on first try
- The DNS cache needs to be flushed
- The system needs to restart the DNS resolver

Your password is never stored and is only used for system operations.

## 💫 Pro Tips

1. **Quick Access**
   - Create an alias in your `~/.zshrc` or `~/.bashrc`:
   ```bash
   alias upbrew='upbrew.sh'
   ```

2. **Scheduling**
   - Use macOS Calendar to remind you to run UpBrew weekly
   - Or set up a recurring reminder in your preferred app

3. **Troubleshooting**
   - If you see yellow warnings, run `brew doctor` for detailed explanations
   - Most warnings are informational and don't need fixing
   - Red errors usually need attention - check the error message carefully

4. **Best Practices**
   - Run UpBrew before installing new software
   - Run it after macOS updates
   - Run it if you notice your development tools acting strange

5. **DNS Issues**
   - If you frequently see DNS-related errors, consider:
     - Checking your network connection
     - Verifying your DNS settings
     - Running UpBrew again after network changes

6. **Performance**
   - The script automatically optimizes DNS resolution
   - First-time runs might take longer due to DNS cache warming
   - Subsequent runs should be faster

## 🎬 Quick Start for macOS Users

New to command line tools? Here's the easiest way to get started:

1. Install Homebrew first:
   - Open Terminal (press `Cmd + Space`, type "Terminal", press Enter)
   - Copy and paste this command:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   - Follow the prompts on screen

2. Download UpBrew:
   - Download this repository by clicking the green "Code" button above
   - Choose "Download ZIP"
   - Unzip the downloaded file

3. Set up UpBrew:
   - Open Terminal
   - Type `cd ` (with a space after cd)
   - Drag the unzipped upbrew folder into Terminal
   - Press Enter
   - Run these commands:
   ```bash
   chmod +x upbrew.sh
   sudo mv upbrew.sh /usr/local/bin/upbrew
   ```
   - Enter your computer's password when asked

## 💻 Usage

Simply run the script:
```bash
./upbrew.sh
```

Or if you moved it to your PATH:
```bash
upbrew
```

## ⌨️ Terminal Tips for Beginners

- To open Terminal: Press `Cmd + Space`, type "Terminal", press Enter
- Copy commands: `Cmd + C`
- Paste into Terminal: `Cmd + V` or `Cmd + Shift + V`
- If a command doesn't work, try adding `sudo ` before it
- When typing your password in Terminal, you won't see any characters - this is normal!

## 🕐 When to Run UpBrew

For best results:
- Run weekly to keep your system updated
- Run before installing new software
- Run when you notice your Mac acting sluggish
- Run after major macOS updates

## 💡 Common Questions

**Q: What is Homebrew?**
A: Homebrew is like an App Store for developer tools and command-line programs. It makes installing and managing software much easier.

**Q: Is it safe to use?**
A: Yes! UpBrew only runs official Homebrew commands that are recommended for regular maintenance.

**Q: What if I see warnings?**
A: Yellow warnings are usually harmless and can be ignored. Red errors might need attention - check the Troubleshooting section.

**Q: Do I need to understand the command line?**
A: No! Once you set up the Dock application (see below), you can run UpBrew with a single click.

## 📺 Output Example

The script provides clear, color-coded status updates:
- 🔵 Status messages show current operations
- ✅ Green checkmarks indicate successful operations
- ⚠️ Yellow warnings for minor issues
- ❌ Red X marks for critical errors

## ⚙️ Requirements

- macOS or Linux
- [Homebrew](https://brew.sh) installed
- Bash shell

## 🤔 Why Use UpBrew?

Maintaining your Homebrew installation manually requires running multiple commands and checking their output. UpBrew automates this process, saving you time and ensuring you don't forget any maintenance steps.

## 🐛 Troubleshooting

If you encounter any issues:
1. Make sure Homebrew is installed correctly
2. Verify you have proper permissions
3. Check your internet connection
4. Run `brew doctor` separately to identify specific issues

## 🤝 Contributing

Contributions are welcome! Feel free to:
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

MIT License

Copyright (c) [year] [your name]

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

## 🔍 Keywords

homebrew, brew, maintenance, automation, macos, linux, package manager, upgrade, update, cleanup, system maintenance, bash script, terminal, command line, package management

## 🎯 Creating a Dock Application (macOS)

You can create a clickable application icon for your Dock:

1. Open **Automator**
2. Create a new **Application**
3. Add a "Run Shell Script" action and paste this code:

```applescript
# Run Terminal with our script
osascript <<EOF
tell application "Terminal"
    activate
    do script "\"$HOME/Documents/codeprojects/upbrew/upbrew.sh\""
    delay 1
    repeat
        if not busy of window 1 then
            delay 2
            close window 1
            exit repeat
        end if
        delay 1
    end repeat
end tell
EOF
```

4. Save as "UpBrew.app" in your desired location
5. To use the custom icon:
   - Right-click UpBrew.app > Get Info
   - Drag `icon.icns` onto the icon in the top-left corner
6. Drag UpBrew.app to your Dock

Now you can run your Homebrew maintenance with a single click! The Terminal window will open, run the script, and close automatically when finished.
```
