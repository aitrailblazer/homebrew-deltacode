# Changelog

## [v1.1.0] — 2026-09-19

- Publish new, version-injected macOS/Linux ARM64 and AMD64 binaries; retain older
  release assets unchanged. The formula uses checksums generated from these archives.
- Add parser-backed Python discovery, context, slicing and guarded function/method
  replacement. Python operations require host CPython 3.12+; Go-only use does not.
- Fix case-distinct symbol selection and preserve replacement comments in preview
  and write operations. Replace string-literal fold anchors with comment anchors.
- Remove the unqualified CLI latency claim and gate release publication on native
  packaged-binary checks after source verification.
- Compatibility: MCP writes require a current expected source hash and default to
  strict matching. Python writes require strict hashes and exact indentation.

## Historical maintenance — 2026-09-18

- Describe DeltaCode as Go-first structural context and guarded function editing,
  without universal token-saving, latency, or model-accuracy claims.
- Test the exact executable version and a small Go slice in the formula.
- Point the formula homepage to this public distribution repository.
- Document experimental Python slice-only support and MCP write authority.
- Clarify that engine source is private and public binaries require a separate
  reviewed promotion to this tap's releases.

No release archives are replaced by these changes. The verified macOS ARM64
v1.0.2 archive reports `1.0.0`; the exact-version test exposes that mismatch.
A new binary release and matching checksums are required before it is resolved.
