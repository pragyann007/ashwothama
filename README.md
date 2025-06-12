
 ![image](https://github.com/user-attachments/assets/24a9506e-5b96-4c8b-b5ce-3298042a57d0)



<h1 align="center" style="font-weight: bold;">
  🔱 ASHWATHAMA 🔱
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0-blue.svg" alt="version" />
  <img src="https://img.shields.io/badge/bash-script-green" />
  <img src="https://img.shields.io/badge/author-cipher_p-red" />
</p>

---

## 🚀 Overview

**ASHWATHAMA** is a powerful and automated **information gathering & recon tool** built using Bash. It simplifies bug bounty recon by performing WHOIS lookups, subdomain enumeration, live subdomain detection, and optional screenshotting—all in one go. 🔥

---

## ✨ Features

- 🔍 WHOIS Information Extraction
- 🌐 Subdomain Enumeration using **subfinder**
- ✅ Live Subdomain Detection using **httpx**
- 📸 Screenshot Capture using **EyeWitness**
- 🧾 Saves all outputs to organized `results/` directory
- 🧠 Interactive prompts with color-coded CLI interface
- 📂 Clean directory & file structure

---

## 📦 Requirements

Make sure the following tools are installed and added to your PATH:

- `subfinder`
- `httpx`
- `eyewitness`
- `whois`
- `git` (to clone the repo)
- `bash` (pre-installed in Linux/macOS)

To install required tools:

```bash
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo apt install whois
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness && sudo ./setup.sh



chmod +x ashwathama.sh
./ashwathama.sh

results/
├── whois_info_<timestamp>.txt
├── subdomain_<domain>.txt
├── live_<domain>.txt
EyeWitness/
└── screenshots/

Credits:
Created with ❤️ by cipher_p

Inspired by the need for fast, efficient, and beginner-friendly recon tools in the bug bounty space.

Special thanks to the creators of subfinder, httpx, and EyeWitness.

LICENSE :
Open-source. Feel free to fork, contribute, or suggest improvements!

🧠 Happy Hacking! — Team ASHWATHAMA 🔱
