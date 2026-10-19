class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.59/codexctl_v0.1.59_Darwin_arm64.tar.gz"
      sha256 "7cd1650aabe0d4797b09bf13afd1827bf0555921c5a47515de28045bcf9f27be"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.59/codexctl_v0.1.59_Darwin_x86_64.tar.gz"
      sha256 "83d83c912d7a17cfdba7da86bfba0818b2e85a40f60d496e40dbc6e36dcd75a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.59/codexctl_v0.1.59_Linux_arm64.tar.gz"
      sha256 "3746836737c64a2b0518413172e01d73ae190e7c109fdb96dab4f2bea164edc3"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.59/codexctl_v0.1.59_Linux_x86_64.tar.gz"
      sha256 "7614d1fb943a23dbedc7fabad50d805df8644449828083df5a1c8408c5fb71ef"
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
