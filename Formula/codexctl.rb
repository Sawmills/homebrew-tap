class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.49/codexctl_v0.1.49_Darwin_arm64.tar.gz"
      sha256 "caf567f8dc1a0aefac3ea2702c23d71aa54d80feb51e42340854df7612bd9e03"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.49/codexctl_v0.1.49_Darwin_x86_64.tar.gz"
      sha256 "60a0bdd7fdc8fa377361d0dc39e30d9e73fba3f30458c23966b4c5b118287d1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.49/codexctl_v0.1.49_Linux_arm64.tar.gz"
      sha256 "88ec6b48970a40fd1e5ab38059dd754950930ea03f1b9977670693723a3d9689"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.49/codexctl_v0.1.49_Linux_x86_64.tar.gz"
      sha256 "2ba3a53056630e40baa977166e526391f2295688368075af28738685adcdae17"
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
