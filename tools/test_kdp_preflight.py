"""Tests for tools/kdp_preflight.py (stdlib unittest, no fixtures on disk)."""
import unittest
import tempfile
from pathlib import Path
from importlib.util import spec_from_file_location, module_from_spec

TOOL = Path(__file__).resolve().parent.parent / "tools" / "kdp_preflight.py"
spec = spec_from_file_location("kdp_preflight", TOOL)
mod = module_from_spec(spec)
spec.loader.exec_module(mod)


class PreflightTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)

    def tearDown(self):
        self.tmp.cleanup()

    def codes(self):
        return {f["code"] for f in mod.run(self.root)}

    def test_clean_project_passes(self):
        (self.root / "beautybook.cls").write_text("% cls\n")
        (self.root / "book.tex").write_text("\\documentclass{beautybook}\n")
        self.assertEqual(self.codes(), set())

    def test_missing_cls(self):
        (self.root / "book.tex").write_text("\\documentclass{beautybook}\n")
        self.assertIn("missing_cls", self.codes())

    def test_no_tex(self):
        self.assertIn("no_tex", self.codes())

    def test_no_main(self):
        (self.root / "beautybook.cls").write_text("")
        (self.root / "chapter.tex").write_text("text only\n")
        self.assertIn("no_main", self.codes())

    def test_letterpaper_warning(self):
        (self.root / "beautybook.cls").write_text("")
        (self.root / "book.tex").write_text(
            "\\documentclass{beautybook}\n\\geometry{papersize={8.5in,11in},letterpaper}\n")
        self.assertIn("letterpaper", self.codes())

    def test_href_without_hidelinks(self):
        (self.root / "beautybook.cls").write_text("")
        (self.root / "book.tex").write_text(
            "\\documentclass{beautybook}\n\\href{https://x}{link}\n")
        self.assertIn("href_without_hidelinks", self.codes())

    def test_href_with_hidelinks(self):
        (self.root / "beautybook.cls").write_text("")
        (self.root / "book.tex").write_text(
            "\\documentclass{beautybook}\n\\usepackage[hidelinks]{hyperref}\n"
            "\\href{https://x}{link}\n")
        self.assertNotIn("href_without_hidelinks", self.codes())

    def test_missing_bib(self):
        (self.root / "beautybook.cls").write_text("")
        (self.root / "book.tex").write_text(
            "\\documentclass{beautybook}\n\\bibliography{refs}\n")
        self.assertIn("missing_bib", self.codes())

    def test_present_bib(self):
        (self.root / "beautybook.cls").write_text("")
        (self.root / "book.tex").write_text(
            "\\documentclass{beautybook}\n\\bibliography{refs}\n")
        (self.root / "refs.bib").write_text("@article{x,year={2020}}\n")
        self.assertNotIn("missing_bib", self.codes())

    def test_empty_image(self):
        (self.root / "beautybook.cls").write_text("")
        (self.root / "book.tex").write_text("\\documentclass{beautybook}\n")
        (self.root / "cover.png").write_bytes(b"")
        self.assertIn("empty_image", self.codes())

    def test_build_dir_ignored(self):
        (self.root / "beautybook.cls").write_text("")
        (self.root / "book.tex").write_text("\\documentclass{beautybook}\n")
        b = self.root / "build"
        b.mkdir()
        (b / "old.tex").write_text("\\documentclass{beautybook}\n\\geometry{letterpaper}\n")
        self.assertNotIn("letterpaper", self.codes())
        self.assertNotIn("multiple_mains", self.codes())


if __name__ == "__main__":
    unittest.main(verbosity=2)
