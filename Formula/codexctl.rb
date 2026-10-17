class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.55/codexctl_v0.1.55_Darwin_arm64.tar.gz"
      sha256 "462cb7072b6d2ffdd1abe2d4b6e4b8923b1f85bb7b5a00fa682e7ea8926ee346"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.55/codexctl_v0.1.55_Darwin_x86_64.tar.gz"
      sha256 "7608902baab52e5cf5687ff2412ec998e3f52763f7ca13550f8350fc4906edfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.55/codexctl_v0.1.55_Linux_arm64.tar.gz"
      sha256 "3eb5763580f66d61c45007dbcf6e02fd6e2ac9bee60a921ef0b69b80c9b2e3b0"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.55/codexctl_v0.1.55_Linux_x86_64.tar.gz"
      sha256 "2fc7000c968b1a73c503ecc484739d5f1e3a5b8a6724257a795672e4e209d025"
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
