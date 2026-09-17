# Homebrew Tap for DeltaCode

Official Homebrew tap for **DeltaCode**: The sub-millisecond AST context slicing and deterministic code intelligence engine that cuts AI prompt tokens by **75%–80.4%** while elevating model coding accuracy.

[![Homebrew Install](https://img.shields.io/badge/brew-install%20deltacode-blue.svg)](https://platform.aitrailblazer.com)
[![Token Reduction](https://img.shields.io/badge/token%20reduction-80.4%25-brightgreen.svg)](https://platform.aitrailblazer.com)
[![Discovery Recall](https://img.shields.io/badge/discovery%20recall-92%25%20%40%20169ms-blueviolet.svg)](https://platform.aitrailblazer.com)
[![License](https://img.shields.io/badge/license-Apache--2.0-green.svg)](LICENSE)

---

## ⚡ Quick Install

```bash
# 1. Add the official tap
brew tap aitrailblazer/deltacode

# 2. Install DeltaCode static binary
brew install deltacode
```

Verify your installation:
```bash
deltacode --version
```

---

## 📊 Empirical Benchmark Receipts

DeltaCode was engineered to solve the **"Attention Dilution Paradox"**: feeding 2,000-line source files into LLMs degrades transformer attention, causes hallucinations, and burns massive token budgets.

### Benchmark 1: Real-World AST Token Reduction (0% Quality Degradation)
Tested across real production codebases ranging from 500 to 58,000+ tokens:

| Production System / Source File | Raw Source Size | Raw Full Tokens | Sliced Context Tokens | Net Token Reduction | Execution Latency |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **DeltaSignal Gateway (`deltasignal.go`)** | 6,193 lines / 234 KB | **58,600 tokens** | **6,974 tokens** | **88.1% Reduction** | **6.8 ms** |
| **SEC LiveCanvas Engine (`livecanvas.go`)** | 336 lines / 9.2 KB | **2,308 tokens** | **633 tokens** | **72.6% Reduction** | **0.6 ms** |
| **DeltaCode Discovery (`discovery.go`)** | 322 lines / 8.8 KB | **2,202 tokens** | **838 tokens** | **61.9% Reduction** | **0.6 ms** |
| **Workspace Core (`workspace.go`)** | 188 lines / 5.2 KB | **1,295 tokens** | **587 tokens** | **54.6% Reduction** | **1.5 ms** |
| **StrategiX Web Engine (Client Doc)** | 14 sections | **347 tokens** | **68 tokens** | **80.4% Reduction** | **0.1 ms** |
| **DeltaSignal Data Plane (Client Doc)** | 12 sections | **314 tokens** | **67 tokens** | **78.7% Reduction** | **0.1 ms** |
| **MirrorLoop Architecture (Client Doc)** | 12 sections | **303 tokens** | **68 tokens** | **77.6% Reduction** | **0.1 ms** |

> **Key Scale Invariant:** As codebases grow from 500 to 2,000 to 50,000+ tokens, **DeltaCode's efficiency increases from 55% up to 88.1% token savings**, reducing prompt latency by 10x while maintaining 100% compiler verification.

---

### Benchmark 2: Structural Discovery vs. Vector Databases (The "Better Grep")
Frozen intent-to-symbol benchmark suite comparing **DeltaCode** against **vector database search (`zvec-grep` + Jina / Potion)**:

| Retrieval System | Recall @ 1 | Recall @ 5 | Exact Symbol @ 5 | P95 Latency | Model & DB Footprint |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **DeltaCode Structural Ranker** | **72.0%** | **92.0%** | **80.0%** | **169 ms** | **0 MB (Pure Go Standard Lib)** |
| `zvec-grep` + Jina (Vector DB) | 8.0% | 48.0% | 0.0% | 401 ms | 2.4 GB PyTorch weights |
| `zvec-grep` + Potion (Vector DB) | 8.0% | 40.0% | 16.0% | 687 ms | C++ RocksDB lock contention |
| Standard `grep` / `ripgrep` | < 10% | < 30% | N/A | 10 ms | Zero AST awareness (Full dump) |

---

## 🧠 Why Quality Does Not Deteriorate (The Science)

Many developers assume token reduction means losing information. **DeltaCode does not compress code lossily like a JPEG; it operates like a compiler linker:**

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                 HOW DELTACODE PRESERVES 100% SEMANTIC FIDELITY              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  1. Preserves 100% of Imports, Structs, Types & Interfaces Bit-for-Bit.      │
│     The model has complete type-safety context. It never hallucinates types.│
│                                                                             │
│  2. Folds ONLY Non-Target Implementation Bodies into 1-Line Anchors.        │
│     The model knows other methods exist, but their internal loops do not    │
│     distract attention heads away from the target task.                     │
│                                                                             │
│  3. Bidirectional Recombination (`deltacode apply`).                       │
│     When the model edits a function, DeltaCode's AST recombiner splices     │
│     only that specific syntax node back into the original file.             │
│     All comments, indentation, and folded functions remain 100% untouched.  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🚀 Quick Start

### 1. Inbound: Slice a Function Context (80% Token Reduction)
```bash
deltacode slice -root . -path pkg/server/server.go -target Server.HandleAuth
```

### 2. Search: Find Symbols with Intent (The Better Grep)
```bash
deltacode discover -root . -query "reject workspace paths escaping symlinks"
# (alias: deltacode grep)
```

### 3. Outbound: Recombine an Edit Back into the File
```bash
deltacode apply -root . -path pkg/server/server.go -target Server.HandleAuth -replacement new_func.go -write
```

### 4. Connect to Cursor / Claude Code / Antigravity via MCP
DeltaCode exposes a zero-configuration Model Context Protocol (MCP) server over local `stdio` ($0 hosting cost, 100% private):
```json
{
  "mcpServers": {
    "deltacode": {
      "command": "deltacode",
      "args": ["mcp", "-root", "/path/to/repo"]
    }
  }
}
```

---

## 🏢 Enterprise & Team CI/CD

Need automated PR diff compaction on GitHub Actions or TypeScript/Python enterprise packs?
- Visit [AI Trailblazer Platform](https://platform.aitrailblazer.com)
- Or install the [DeltaCode GitHub Marketplace Action](https://github.com/marketplace)
