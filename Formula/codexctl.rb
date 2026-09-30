class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.26/codexctl_v0.1.26_Darwin_arm64.tar.gz"
      sha256 "9be9856373f5c7cd044838800cf4fed02c3a368e03c74046a8a3fbbd15aaeff0"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.26/codexctl_v0.1.26_Darwin_x86_64.tar.gz"
      sha256 "924b517309b4a0543ff9ea733fb3307f1ca1ab02e46afd2b3f56be8b5b1b832e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.26/codexctl_v0.1.26_Linux_x86_64.tar.gz"
      sha256 "7f05ad34908cdc7549af6752b92e06672b84c4b9e40aadaea3d4e2fc68fada3c"
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
