class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.34/codexctl_v0.1.34_Darwin_arm64.tar.gz"
      sha256 "addff0895b744202387f2096bc9906260453eac53baec0073f2e00899360a484"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.34/codexctl_v0.1.34_Darwin_x86_64.tar.gz"
      sha256 "0b2d72d9af1e76ff2d54c329c7da4fc0e9dd94a75c6d08ea233bef7147167562"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.34/codexctl_v0.1.34_Linux_arm64.tar.gz"
      sha256 "8f43a461c44e3b37d6d917e9a8bc268a3fa22c9f8134e4a9b7e55f3fe388673a"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.34/codexctl_v0.1.34_Linux_x86_64.tar.gz"
      sha256 "68d5b53a6482b46ab36559e36013e7ed854d848ffe65005c3c71e6b39cc9e915"
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
