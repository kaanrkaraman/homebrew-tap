class Nblean < Formula
  desc "Token-lean Jupyter notebook access for coding agents"
  homepage "https://github.com/kaanrkaraman/nblean"
  url "https://github.com/kaanrkaraman/nblean/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "12d56ec032679248040e1e9d918346270deb56b6d29d2b9831d2a99818def551"
  license "MIT"
  head "https://github.com/kaanrkaraman/nblean.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"demo.ipynb").write <<~JSON
      {"cells": [{"cell_type": "markdown", "id": "a1", "metadata": {}, "source": "# Hello"}],
       "metadata": {}, "nbformat": 4, "nbformat_minor": 5}
    JSON
    assert_match "0 md    # Hello", shell_output("#{bin}/nblean outline #{testpath}/demo.ipynb")
    assert_match "wrote", shell_output("#{bin}/nblean init --project --agent codex")
    assert_path_exists testpath/".agents/skills/nblean/SKILL.md"
  end
end
