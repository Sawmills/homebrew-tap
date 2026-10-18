class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.57/codexctl_v0.1.57_Darwin_arm64.tar.gz"
      sha256 "5a2f04160893da280dee65d9102c70ad0fd6a5b6144fe3afb52f75e7fb3bcc2e"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.57/codexctl_v0.1.57_Darwin_x86_64.tar.gz"
      sha256 "fc654d8630657df5594f351dda2bbaae216013870f1bc8cb2e60c3ab1375b050"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.57/codexctl_v0.1.57_Linux_arm64.tar.gz"
      sha256 "30463ccc7071c2e83b6fe37512f61a9282711432ccf21057b8183d0e8f51b4f5"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.57/codexctl_v0.1.57_Linux_x86_64.tar.gz"
      sha256 "ce11ecf674c8f5dbd875ed05f971d4c160dcf1b72866c6a36d2a5c5beb01d123"
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
