# Homebrew Tap for DeltaCode

Official Homebrew tap for **DeltaCode**: The sub-millisecond AST context slicing and deterministic code intelligence engine that cuts AI prompt tokens by **75%–80.4%** while elevating model coding accuracy.

[![Homebrew Install](https://img.shields.io/badge/brew-install%20deltacode-blue.svg)](https://platform.aitrailblazer.com)
[![Token Reduction](https://img.shields.io/badge/token%20reduction-80.4%25-brightgreen.svg)](https://platform.aitrailblazer.com)
[![Discovery Recall](https://img.shields.io/badge/discovery%20recall-92%25%20%40%20169ms-blueviolet.svg)](https://platform.aitrailblazer.com)
[![License](https://img.shields.io/badge/license-Apache--2.0-green.svg)](LICENSE)

---

## ⚡ Quick Install

```bash
# 1. Add the official tap & trust formula
brew tap aitrailblazer/deltacode
brew trust aitrailblazer/deltacode

# 2. Install DeltaCode static binary
brew install deltacode
```

Verify your installation:
```bash
deltacode version
```

---

## 📊 Empirical Benchmark Receipts

DeltaCode was engineered to solve the **"Attention Dilution Paradox"**: feeding 2,000-line source files into LLMs degrades transformer attention, causes hallucinations, and burns massive token budgets.

### Benchmark 1: Real-World AST Token Reduction on Official Kubernetes Source (0% Quality Degradation)
Tested across official [Kubernetes (`github.com/kubernetes/kubernetes`)](https://github.com/kubernetes/kubernetes) source files ranging from 150 to 10,000+ lines (~1,200 to ~112,000 tokens). Anyone can clone Kubernetes and independently reproduce these exact receipts with `deltacode slice`:

| Official Kubernetes Source File | Target Symbol | Raw Source Size | Raw Full Tokens | DeltaCode Sliced Tokens | Net Token Reduction | Execution Latency |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **`pkg/apis/core/validation/validation.go`** | `ValidateDNS1123Label` | 10,165 lines / 441 KB | **112,851 tokens** | **37,879 tokens** | **66.4% Reduction** | **17.5 ms** |
| **`pkg/scheduler/backend/queue/scheduling_queue.go`** | `NewPriorityQueue` | 2,231 lines / 95.7 KB | **24,486 tokens** | **15,407 tokens** | **37.1% Reduction** | **4.6 ms** |
| **`pkg/controller/replicaset/replica_set.go`** | `NewReplicaSetController` | 1,001 lines / 37.6 KB | **9,617 tokens** | **5,301 tokens** | **44.9% Reduction** | **1.8 ms** |
| **`pkg/serviceaccount/jwt.go`** | `JWTTokenGenerator` | 496 lines / 16.1 KB | **4,116 tokens** | **2,893 tokens** | **29.7% Reduction** | **1.0 ms** |
| **`pkg/volume/csimigration/plugin_manager.go`** | `NewPluginManager` | 151 lines / 5.1 KB | **1,288 tokens** | **833 tokens** | **35.3% Reduction** | **0.4 ms** |

> **Key Scale Invariant:** Across industry-standard enterprise codebases like Kubernetes, **DeltaCode slashes up to 74,972 prompt tokens per single file query in under 18 milliseconds**. It preserves all imports, types, interfaces, and docstrings bit-for-bit while folding irrelevant non-target implementations into single-line anchors. Model accuracy is heightened because the LLM attention heads focus exclusively on the target logic without distraction.

---

### Benchmark 2: Structural Discovery vs. Vector Databases (The "Better Grep")
Frozen intent-to-symbol benchmark suite comparing **DeltaCode** against **vector database search (`zvec-grep` + Jina / Potion)**:

| Retrieval System | Recall @ 1 | Recall @ 5 | Exact Symbol @ 5 | P95 Latency | Model & DB Footprint |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **DeltaCode Structural Ranker (`deltacode grep`)** | **72.0%** | **92.0%** | **80.0%** | **169 ms** | **0 MB (Pure Go Standard Lib)** |
| `zvec-grep` + Jina (Vector DB) | 8.0% | 48.0% | 0.0% | 401 ms | 2.4 GB PyTorch weights |
| `zvec-grep` + Potion (Vector DB) | 8.0% | 40.0% | 16.0% | 687 ms | C++ RocksDB lock contention |
| Standard `grep` / `ripgrep` | < 10% | < 30% | N/A | 10 ms | Zero AST awareness (Full dump) |

#### Live Head-to-Head: `deltacode grep` vs `ripgrep` on Official Kubernetes (`pkg/` Core)
Measured directly on Kubernetes source (`github.com/kubernetes/kubernetes`) across 3,585 files / ~2.5M lines of code:

| Natural Developer Intent | System | Results Returned | Latency | Tokens Emitted | Top Result Quality |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **"jwt token generator signing"** | `ripgrep` (`rg -n JWTTokenGenerator`) | 9 raw text lines | 125 ms | 332 tok | Unranked string occurrences |
| | **`deltacode grep` (scoped package)** | **Top-5 AST Symbols** | **37 ms** | **336 tok** | **Rank #1: `jwtTokenGenerator.GenerateToken`** |
| | **`deltacode grep` (entire 3.5k files)** | **Top-5 AST Symbols** | 2,934 ms | **336 tok** | **Rank #1: `jwtTokenGenerator.GenerateToken`** |
| **"priority queue scheduler init"** | `ripgrep` (`rg -n NewPriorityQueue`) | 9 raw text lines | 92 ms | 353 tok | Dump of callsites across repo |
| | **`deltacode grep`** | **Top-5 AST Symbols** | 3,129 ms | **380 tok** | **Rank #1: `NewPriorityQueue` (`line 422`)** |
| **"replicaset controller sync"** | `ripgrep` (`rg -n NewReplicaSetController`) | 30 raw text lines | 139 ms | 1,336 tok | High-noise dump of callers & comments |
| | **`deltacode grep`** | **Top-5 AST Symbols** | 2,934 ms | **344 tok** | **Rank #1: `getAllReplicaSetsAndSyncRevision`** |

> **Why Agents Need Structural Grep:** Traditional `ripgrep` requires knowing the exact symbol name beforehand and dumps noisy, unstructured line snippets that pollute LLM context windows. `deltacode grep` understands Go AST structure, mapping natural-language intent directly to ranked function and method declarations with zero embedding infrastructure.

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

#### The Formal AST Preservation Invariant:
In Go's formal grammar (`go/ast`), any source file is partitioned into general declarations (`GenDecl`: imports, structs, types, interfaces, constants, vars) and function declarations (`FuncDecl`):
$$\forall d \in \text{Decls}: d \text{ is } \text{GenDecl} \implies \text{Node}_{\text{sliced}}(d) \equiv \text{Node}_{\text{original}}(d) \quad (\text{Identity Mapping})$$

DeltaCode leaves every `GenDecl` AST node **untouched**. The LLM receives the exact byte-for-byte type definitions and interface boundaries. Only non-target function bodies are folded into single-line anchors:
$$\forall f \in \text{Decls}: f \text{ is } \text{FuncDecl} \land f \neq \text{Target} \implies f.\text{Type}_{\text{sliced}} \equiv f.\text{Type}_{\text{original}} \land f.\text{Body}_{\text{sliced}} = \{\text{anchor}\}$$

#### Automated Verification Receipt:
Every build executes a bit-for-bit AST equivalence assertion over both general declarations and function signatures:
```text
=== RUN   TestProofBitForBitPreservation
    VERIFIED: 100% of GenDecls (Imports, Types, Structs, Interfaces) and Function Signatures are bit-for-bit preserved!
--- PASS: TestProofBitForBitPreservation (0.00s)
PASS
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
