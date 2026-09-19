# Homebrew Tap for DeltaCode

DeltaCode provides Go-first structural discovery, bounded source context, and
guarded function editing. This public repository distributes Homebrew formulas and
[binary releases](https://github.com/aitrailblazer/homebrew-deltacode/releases).
The engine source repository is private and requires collaborator access.

## Install

```bash
brew tap aitrailblazer/deltacode
brew install deltacode
deltacode --version
brew test deltacode
```

The formula selects macOS or Linux archives for ARM64 or AMD64.
Homebrew verifies the archive SHA-256 before installation.

**Current release: v1.1.0.** The executable must report `1.1.0`; the formula
checks that exact version. Existing users can run `brew update` followed by
`brew upgrade aitrailblazer/deltacode/deltacode`.
Historical v1.0.2 archives report `1.0.0` and do not contain these fixes.
Those archives remain unchanged; do not bypass version checks or relabel them.

Without Homebrew, obtain the matching archive and `.sha256` file from the release,
run `shasum -a 256 -c <archive>.sha256` (or `sha256sum -c` on Linux), extract it,
and check `./deltacode --version` against the release tag before installation.
Checksums detect corruption; obtain them from a trusted release source.

## Scope

- Go supports discovery, context, slicing, and function replacement.
- Python supports parser-backed discovery, context, slicing, and guarded
  function/method replacement. Decorators, async functions, nested definitions,
  classes, multiline strings and f-strings are covered. Classes are context
  targets, not replacement targets.
- Python features require trusted host **CPython 3.12+** as `python3` on PATH.
  An older or missing runtime fails explicitly; Go-only features do not require
  Python. Install a supported Python separately if needed and check `python3 --version`.
- TypeScript, JavaScript, Rust, and Java are not supported.
- Token savings and runtime vary with input and scope. Slices are context, not a
  substitute for compiler validation or tests.
- The stdio MCP server includes a writing tool. Authorize its root and configure
  client approvals; do not treat it as read-only.

**Compatibility:** target names are case-sensitive. MCP `apply_slice` requires
the current `expected_source_sha256` and defaults to strict matching. Python writes
require strict source hashes, the target's exact indentation, and valid merged
module syntax. CLI apply previews unless `-write` is supplied. Advisory writer
locks do not provide unconditional CAS against arbitrary external editors.

## Updating this tap

The private engine's release workflow builds clean, tagged source and produces
checksummed archives plus `deltacode.rb`. A maintainer must first promote the
approved binary archives and checksums to a release in this public tap. Then review
and copy the generated formula here and run `brew test deltacode` on the new installation.
Never substitute guessed hashes, reuse old binaries under a new version, or publish
private source, internal release notes, or audit evidence.

## Maintenance changes

The formula now checks the exact executable version and a small Go slice instead
of a branding substring. Documentation separates current binary availability from
development-source features and avoids universal latency or token-saving claims.
The v1.1.0 release adds case-distinct selection and replacement-comment fixes,
neutral CLI help wording, and native packaged-binary acceptance gates on Linux
and macOS. Only the runner-native architectures are executed by those gates;
the other archives are cross-built. Older release archives are not replaced.
See the [changelog](CHANGELOG.md) for the maintenance history.

Licensed under [Apache-2.0](LICENSE).
