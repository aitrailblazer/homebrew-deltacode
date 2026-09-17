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
Tested across live production codebases and web documents using deterministic AST node folding:

| Production System | Raw Full Tokens | Sliced Context Tokens | Net Token Reduction | Invariant Pass Rate |
| :--- | :---: | :---: | :---: | :---: |
| **StrategiX Engine** | 347 tokens | 68 tokens | **80.4% Reduction** | 100% Bit-for-bit |
| **NightEnLight Web** | 322 tokens | 66 tokens | **79.5% Reduction** | 100% Bit-for-bit |
| **DeltaSignal Data Plane** | 314 tokens | 67 tokens | **78.7% Reduction** | 100% Bit-for-bit |
| **AI Trailblazer Core** | 312 tokens | 67 tokens | **78.5% Reduction** | 100% Bit-for-bit |
| **MirrorLoop Architecture** | 303 tokens | 68 tokens | **77.6% Reduction** | 100% Bit-for-bit |
| **Forma Studio Engine** | 231 tokens | 63 tokens | **72.7% Reduction** | 100% Bit-for-bit |
| **AVERAGE** | **305 tokens** | **66 tokens** | **77.9% AVERAGE** | **100% Compiler Pass** |

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
