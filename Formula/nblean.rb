class Nblean < Formula
  desc "Token-lean Jupyter notebook access for coding agents"
  homepage "https://github.com/kaanrkaraman/nblean"
  url "https://github.com/kaanrkaraman/nblean/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "98eb0bad6a8a091ad9747cbb1f45c826ea9c143dda57d72692337c788b51514f"
  license "MIT"
  head "https://github.com/kaanrkaraman/nblean.git", branch: "main"

  bottle do
    root_url "https://github.com/kaanrkaraman/homebrew-tap/releases/download/nblean-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7211a3639af30a96e19b6d0f12efed44840fce2c32288d34dfcfba7eeb5fab4f"
    sha256 cellar: :any,                 x86_64_linux: "726f8e17b65b33d946a73b6cadfcbdf315281fb3d6bec7a59bb01a75ffbc6f29"
  end

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
