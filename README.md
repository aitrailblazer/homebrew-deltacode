# Homebrew Tap for DeltaCode

Official Homebrew tap for **DeltaCode**: The sub-millisecond AST context slicing and token optimization engine that reduces AI prompt tokens by **75%–80.4%**.

[![Homebrew Install](https://img.shields.io/badge/brew-install%20deltacode-blue.svg)](https://platform.aitrailblazer.com)
[![License](https://img.shields.io/badge/license-Apache--2.0-green.svg)](LICENSE)

---

## ⚡ Quick Install

```bash
# Add the AI Trailblazer Homebrew tap
brew tap aitrailblazer/deltacode

# Install DeltaCode
brew install deltacode
```

Verify your installation:
```bash
deltacode --version
```

---

## 🚀 Quick Start

### 1. Slice a Function Context (80% Token Reduction)
Fold away irrelevant non-target code while preserving types, imports, and interface signatures:
```bash
deltacode slice -path main.go -target Server.HandleRequest
```

### 2. Search Symbols with the Better Grep (92% Recall in 169ms)
Find the exact function implementing an intent without guessing file names:
```bash
deltacode discover -query "reject symlink escapes"
```

### 3. Connect to Cursor / Claude Code / Antigravity via MCP
DeltaCode exposes a high-speed Model Context Protocol (MCP) server over local `stdio`:
```json
{
  "mcpServers": {
    "deltacode": {
      "command": "deltacode",
      "args": ["mcp"]
    }
  }
}
```

---

## 🏢 Enterprise & Team CI/CD

Need automated PR diff compaction on GitHub Actions or TypeScript/Python enterprise packs?
- Visit [AI Trailblazer Platform](https://platform.aitrailblazer.com)
- Or install the [DeltaCode GitHub Marketplace Action](https://github.com/marketplace)
