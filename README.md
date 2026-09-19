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

**Release status:** the verified macOS ARM64 v1.0.2 archive reports `1.0.0`. The formula's
exact-version test deliberately rejects that mismatch. Do not bypass the test or
assume the installed archive contains current source changes.

Without Homebrew, obtain the matching archive and `.sha256` file from the release,
run `shasum -a 256 -c <archive>.sha256` (or `sha256sum -c` on Linux), extract it,
and check `./deltacode --version` against the release tag before installation.
Checksums detect corruption; obtain them from a trusted release source.

## Scope

- Go supports discovery, context, slicing, and function replacement.
- Python support is experimental and slice-only; some syntax is deliberately rejected.
- TypeScript, JavaScript, Rust, and Java are not supported.
- Token savings and runtime vary with input and scope. Slices are context, not a
  substitute for compiler validation or tests.
- The stdio MCP server includes a writing tool. Authorize its root and configure
  client approvals; do not treat it as read-only.

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
These repository updates do not replace the existing release archives.
See the [changelog](CHANGELOG.md) for the maintenance history.

Licensed under [Apache-2.0](LICENSE).
