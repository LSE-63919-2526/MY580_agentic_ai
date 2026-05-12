# Gemini CLI — Free Setup Guide (Windows)

A terminal-based agentic AI from Google. Free tier gives **60 requests/min and 1,000 requests/day** on Gemini 2.5 Pro with a personal Google account.

## 1. Install Node.js

Gemini CLI needs **Node.js 20 or newer**.

- Open **PowerShell** and check: `node --version`
- If missing or older than 20, download the **LTS** installer from [nodejs.org](https://nodejs.org/) and run it. Accept the defaults, **but uncheck "Automatically install the necessary tools for Native Modules"** — it pulls in several GB of build tools (Chocolatey, Python, Visual Studio Build Tools) that Gemini CLI doesn't need. If you already left it checked, you can close the secondary PowerShell window that pops up; Node itself will still be installed correctly.
- Close and reopen PowerShell, then re-check `node --version`.

## 2. Install Gemini CLI

In PowerShell:

```powershell
npm install -g @google/gemini-cli
```

**If you see `npm.ps1 cannot be loaded because running scripts is disabled on this system`:**
PowerShell's default policy blocks script files. Run this once, type `Y` to confirm, then retry the install:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

This only affects your user account and allows local scripts (like npm's) to run while still blocking unsigned scripts from the internet — the standard setting for Windows development.

**If you see a different permission error** (`EACCES` or similar), open PowerShell as Administrator and retry.

Verify:

```powershell
gemini --version
```

## 3. Sign in with your Google account

Run:

```powershell
gemini
```

The first time, it will ask you to log in with a Google account or with an API key. **Choose "Login with Google"** — that's the option that unlocks the free tier. Your browser opens; sign in with a **personal Google account** (university/Workspace accounts often don't qualify for the free tier). Approve access; the token is stored locally.

## 4. Try it out

Once you're in the Gemini prompt, ask it something simple:

```
Hello, can you explain how much free usage I get, and what will happen when I run out?
```

This confirms the CLI is working and gives you a clear picture of the free-tier limits from Gemini itself.

## Useful commands inside the CLI

- `/help` — list commands
- `/quit` — exit
- `Ctrl+C` — cancel the current action

## Limits & cautions

- 1,000 requests/day, resets every 24h
- Don't paste secrets or private data — Google may use free-tier inputs to improve models
- If you hit limits, get a free API key from [aistudio.google.com](https://aistudio.google.com/) and set it in PowerShell:
  ```powershell
  $env:GEMINI_API_KEY = "your-key-here"
  ```
