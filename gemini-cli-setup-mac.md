# Gemini CLI — Free Setup Guide (macOS)

A terminal-based agentic AI from Google. Free tier gives **60 requests/min and 1,000 requests/day** on Gemini 2.5 Pro with a personal Google account.

## 1. Install Node.js

Gemini CLI needs **Node.js 20 or newer**.

- Open **Terminal** (Spotlight → "Terminal") and check: `node --version`
- If missing or older than 20, the easiest path is Homebrew:
  ```bash
  brew install node
  ```
  No Homebrew? Install it first from [brew.sh](https://brew.sh/), or just grab the **LTS** installer from [nodejs.org](https://nodejs.org/).
- Re-check: `node --version`

## 2. Install Gemini CLI

In Terminal:

```bash
npm install -g @google/gemini-cli
```

If you get an `EACCES` permission error, **don't use sudo**. Instead, set npm's global directory to your home folder:

```bash
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.zshrc
source ~/.zshrc
```

Then retry the install.

Verify:

```bash
gemini --version
```

## 3. Sign in with your Google account

Run:

```bash
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
- If you hit limits, get a free API key from [aistudio.google.com](https://aistudio.google.com/) and add it to your shell:
  ```bash
  echo 'export GEMINI_API_KEY="your-key-here"' >> ~/.zshrc
  source ~/.zshrc
  ```
