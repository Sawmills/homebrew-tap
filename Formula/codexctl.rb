class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.43/codexctl_v0.1.43_Darwin_arm64.tar.gz"
      sha256 "9f2e30a6639003660722783388e3b5c5e4e840faa568f8bbff8febcd54a8d364"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.43/codexctl_v0.1.43_Darwin_x86_64.tar.gz"
      sha256 "96de45bc364bdf909bbacb9f5ff01cbf7921de3d5f62d52496206edc056b283f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.43/codexctl_v0.1.43_Linux_arm64.tar.gz"
      sha256 "a42f7732d095234b8f63cce4c29b911bfaa5d1c912bcba331b244a5d8dafe2f2"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.43/codexctl_v0.1.43_Linux_x86_64.tar.gz"
      sha256 "de522be7e58bb7bd2c240ccacd27cac6f50ef916bf0f729c19519db467c4b561"
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
