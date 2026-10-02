class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.32/codexctl_v0.1.32_Darwin_arm64.tar.gz"
      sha256 "2ce623247bb471f86a38aa5522bd330ff8bd83ad0f19f6a76de67081f3f187d0"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.32/codexctl_v0.1.32_Darwin_x86_64.tar.gz"
      sha256 "1bbcc13cc7b4204bd1237200f18e9161dcbcc5d6abf7036ab4e1d37e22138e25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.32/codexctl_v0.1.32_Linux_arm64.tar.gz"
      sha256 "6d340b2a503431860d374327926d22456c872bebb90d8871b522b22c57b522e0"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.32/codexctl_v0.1.32_Linux_x86_64.tar.gz"
      sha256 "7c48cc570697d8e0bc0253585f2a9af65b4f2b71c63eacd75ba00150c4702d65"
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
