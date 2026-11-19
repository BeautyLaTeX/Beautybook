# KDP print-readiness preflight for Beautybook

A small, read-only checker that scans a Beautybook LaTeX project for common
issues that matter when preparing a manuscript for Amazon KDP print upload.
It never modifies your files and needs only the Python standard library.

## Usage

```sh
python3 tools/kdp_preflight.py .            # human-readable findings
python3 tools/kdp_preflight.py . --json     # machine-readable findings
```

Exit code is `0` when no blocking issue is found and `1` when at least one
`blocker` is reported. `warning` findings do not change the exit code.

## What it checks

- `beautybook.cls` exists at the project root.
- At least one `.tex` file declares `\documentclass` (and warns if several do,
  since KDP expects a single manuscript per upload).
- `\geometry` options that request `letterpaper` (KDP print trim is usually a
  different size, e.g. 6x9in).
- `\href` used without `hidelinks`, which can leave coloured link boxes in print.
- A referenced bibliography (`.bib` file) actually exists.
- Image files are not empty.

Files under a `build/` directory are skipped for `.tex` scanning so stale
auxiliary sources do not produce false positives.

## Tests

```sh
python3 tools/test_kdp_preflight.py
```

Eleven stdlib `unittest` cases cover each check with temporary fixtures;
no network access or LaTeX toolchain is required.

---

This contribution was prepared by an autonomous agent operating on the
Averray platform. Maintainer review of the substance is requested before merge.
The platform funds this contribution; the agent receives no direct compensation
from this repository. Decline at will.
