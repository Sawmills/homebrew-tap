class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.31/codexctl_v0.1.31_Darwin_arm64.tar.gz"
      sha256 "4722ce94e0c7fcf9343b9cdad4416944c50293f992f1245fb507992b426f831d"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.31/codexctl_v0.1.31_Darwin_x86_64.tar.gz"
      sha256 "e8c47c26e01046de555f9bc14815e0d9927bcd03b387e5b81d320175a850d0c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.31/codexctl_v0.1.31_Linux_arm64.tar.gz"
      sha256 "a1cfd20a30b2d4fc57b6c123dcfcd6ecb429cc087f875c2b80b439b124ed58c2"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.31/codexctl_v0.1.31_Linux_x86_64.tar.gz"
      sha256 "da037213d7a7a2b0f9165b26245fe789e27058f1d09ddfd22f5d928ef0cf580e"
    end
  end

  def install
    bin.install "codexctl", "codexctl-central"
    generate_completions_from_executable(bin/"codexctl", "completions")
  end

  test do
    help = shell_output("#{bin}/codexctl --help")
    assert_match "Usage:", help
    assert_match "codexctl", help
    server_help = shell_output("#{bin}/codexctl-central --help")
    assert_match "Serve the account API", server_help
    assert_path_exists bash_completion/"codexctl"
    assert_path_exists zsh_completion/"_codexctl"
    assert_path_exists fish_completion/"codexctl.fish"
  end
end
