#!/usr/bin/env python3
"""Check a Beautybook LaTeX project for common KDP print-readiness issues.

Read-only: never writes to the project. Prints human-readable findings and
exits non-zero when at least one blocking issue is found.

Usage:
    python3 tools/kdp_preflight.py ROOT [--json]

ROOT is the project directory containing beautybook.cls and the main .tex.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

BLOCKER = "blocker"
WARNING = "warning"


def _tex_files(root: Path) -> list[Path]:
    return sorted(p for p in root.rglob("*.tex") if "build" not in p.parts)


def check_cls(root: Path) -> list[dict]:
    findings = []
    if not (root / "beautybook.cls").is_file():
        findings.append({
            "level": BLOCKER,
            "code": "missing_cls",
            "message": "beautybook.cls not found at project root",
        })
    return findings


def check_main(root: Path) -> list[dict]:
    tex = _tex_files(root)
    if not tex:
        return [{"level": BLOCKER, "code": "no_tex", "message": "no .tex files outside build/"}]
    mains = [p for p in tex if r"\documentclass" in p.read_text(errors="replace")]
    if not mains:
        return [{"level": BLOCKER, "code": "no_main",
                 "message": "no .tex file contains \\documentclass"}]
    findings = []
    if len(mains) > 1:
        findings.append({
            "level": WARNING,
            "code": "multiple_mains",
            "message": f"{len(mains)} .tex files declare \\documentclass; KDP upload expects one manuscript",
            "files": [p.name for p in mains],
        })
    return findings


def check_geometry(root: Path) -> list[dict]:
    findings = []
    # allow one level of nested braces, e.g. papersize={8.5in,11in}
    pattern = re.compile(r"\\geometry\s*\{((?:[^{}]|\{[^{}]*\})*)\}")
    for p in _tex_files(root):
        for m in pattern.finditer(p.read_text(errors="replace")):
            opts = m.group(1)
            if "papersize" in opts and "letterpaper" in opts:
                findings.append({
                    "level": WARNING,
                    "code": "letterpaper",
                    "message": "letterpaper geometry found; KDP print trim is typically 6x9in or similar",
                    "file": p.name,
                })
    return findings


def check_links(root: Path) -> list[dict]:
    findings = []
    for p in _tex_files(root):
        text = p.read_text(errors="replace")
        if "\\href" in text and "hidelinks" not in text and not re.search(
                r"\\usepackage(?:\[[^\]]*\])?\{hyperref\}", text):
            findings.append({
                "level": WARNING,
                "code": "href_without_hidelinks",
                "message": "\\href used without hidelinks; printed links may show as coloured boxes",
                "file": p.name,
            })
    return findings


def check_bibliography(root: Path) -> list[dict]:
    findings = []
    tex = "".join(p.read_text(errors="replace") for p in _tex_files(root))
    if "\\bibliography" in tex or "addbibresource" in tex:
        if not list(root.rglob("*.bib")):
            findings.append({
                "level": BLOCKER,
                "code": "missing_bib",
                "message": "bibliography referenced but no .bib file found",
            })
    return findings


def check_images(root: Path) -> list[dict]:
    findings = []
    for p in root.rglob("*"):
        if p.suffix.lower() in {".png", ".jpg", ".jpeg"} and p.stat().st_size == 0:
            findings.append({
                "level": BLOCKER,
                "code": "empty_image",
                "message": "image file is empty",
                "file": str(p.relative_to(root)),
            })
    return findings


CHECKS = (check_cls, check_main, check_geometry, check_links, check_bibliography, check_images)


def run(root: Path) -> list[dict]:
    findings = []
    for check in CHECKS:
        findings.extend(check(root))
    return findings


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", type=Path)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args(argv)
    root = args.root.resolve()
    if not root.is_dir():
        print(f"not a directory: {root}", file=sys.stderr)
        return 2
    findings = run(root)
    if args.json:
        print(json.dumps(findings, indent=2, ensure_ascii=False))
    else:
        if not findings:
            print("OK: no KDP print-readiness issues found")
        for f in findings:
            loc = f" [{f.get('file', '.')}]" if f.get("file") else ""
            print(f"{f['level'].upper()}{loc}: {f['code']} - {f['message']}")
    return 1 if any(f["level"] == BLOCKER for f in findings) else 0


if __name__ == "__main__":
    raise SystemExit(main())
