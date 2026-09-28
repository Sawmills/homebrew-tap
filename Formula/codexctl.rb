class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.24/codexctl_v0.1.24_Darwin_arm64.tar.gz"
      sha256 "77f4ea4c44ecbd13dbec8bcac0a56b5758753a97349205133a8f48441b9bc834"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.24/codexctl_v0.1.24_Darwin_x86_64.tar.gz"
      sha256 "7e5ce0ca2de889aa21f4f98e7c3bfc3ef8c033e356cee3f0d80abb9c3057f8f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.24/codexctl_v0.1.24_Linux_x86_64.tar.gz"
      sha256 "184c7ecc94bd21d521291651257836ed0a9a2290f640b4ac8f1d26ebeadbfa25"
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
