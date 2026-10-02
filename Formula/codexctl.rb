class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.30/codexctl_v0.1.30_Darwin_arm64.tar.gz"
      sha256 "5a428f5b9dc20d13b43f35832cf0a32fbccf385752e5d9474b8a9704e146a358"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.30/codexctl_v0.1.30_Darwin_x86_64.tar.gz"
      sha256 "23c2e4570acf8fa940307a852458c753385e89e24cee293f88be9e69a716a729"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.30/codexctl_v0.1.30_Linux_arm64.tar.gz"
      sha256 "4eca93794cbeb1139f0c6d4f89e566e75bb0471c991da82151d9205e040dcd47"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.30/codexctl_v0.1.30_Linux_x86_64.tar.gz"
      sha256 "d4551eb898b8b0fc466bf8c485893f0e386c3deccc21833e92b40882bc0eb146"
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
