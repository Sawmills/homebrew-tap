class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.63/codexctl_v0.1.63_Darwin_arm64.tar.gz"
      sha256 "ce1509eab5095ea76efcaadd761cbfcc9a3a2aee556e3841d707237a4c8e7e4f"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.63/codexctl_v0.1.63_Darwin_x86_64.tar.gz"
      sha256 "e93076c53d73339f8ba0971dde53a06d356d56b450a56688bc2a7b927e72413f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.63/codexctl_v0.1.63_Linux_arm64.tar.gz"
      sha256 "c323ac62f93288acd98b2f87f44df54c85335739f84c9424217f9b1926cc6de9"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.63/codexctl_v0.1.63_Linux_x86_64.tar.gz"
      sha256 "85297cd9d3fa818e013aa9c191285dc470ecfbf4ddb4b5da0b7c16e372e780e5"
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
