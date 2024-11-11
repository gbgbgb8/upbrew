# 🍺 UpBrew - Homebrew Maintenance Script

A simple, user-friendly bash script to automate Homebrew maintenance tasks on macOS and Linux. UpBrew keeps your Homebrew installation clean, up-to-date, and healthy with a single command.

## 📝 Features

- Updates Homebrew package database
- Upgrades all installed formulae (packages)
- Upgrades all installed casks (macOS applications)
- Cleans up old versions and cached downloads
- Checks system for potential problems
- Beautiful color-coded output for easy reading

## 🚀 Installation

1. Download the script:
```bash
curl -O https://raw.githubusercontent.com/YOUR_USERNAME/upbrew/main/upbrew.sh
```

2. Make it executable:
```bash
chmod +x upbrew.sh
```

3. Optionally, move it to your PATH for easier access:
```bash
sudo mv upbrew.sh /usr/local/bin/upbrew
```

## 💻 Usage

Simply run the script:
```bash
./upbrew.sh
```

Or if you moved it to your PATH:
```bash
upbrew
```

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
```
