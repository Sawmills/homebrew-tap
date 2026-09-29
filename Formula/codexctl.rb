class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.25/codexctl_v0.1.25_Darwin_arm64.tar.gz"
      sha256 "b4e1eced39081f55e4d4a19bf5dba4cb03f1304cc11ee96a07c39635d2d1361d"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.25/codexctl_v0.1.25_Darwin_x86_64.tar.gz"
      sha256 "c72f24549bdc37ea64b3ac4de016ef1a865eef319815af28c90a103c75812d5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.25/codexctl_v0.1.25_Linux_x86_64.tar.gz"
      sha256 "3686e0f49ce9c457dfa60361288da7f4f42a0220bdf323ad921a046918745b6e"
    end
  end

  def install
    bin.install "codexctl"
    generate_completions_from_executable(bin/"codexctl", "completions")
  end

  test do
    help = shell_output("#{bin}/codexctl --help")
    assert_match "Usage:", help
    assert_match "codexctl", help
    assert_path_exists bash_completion/"codexctl"
    assert_path_exists zsh_completion/"_codexctl"
    assert_path_exists fish_completion/"codexctl.fish"
  end
end
