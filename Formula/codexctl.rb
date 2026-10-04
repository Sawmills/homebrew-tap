class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.40/codexctl_v0.1.40_Darwin_arm64.tar.gz"
      sha256 "e706048ffb344db1a9d2d7a87dc631afc5045899490268c6cc7973813dcf09c6"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.40/codexctl_v0.1.40_Darwin_x86_64.tar.gz"
      sha256 "ffa3d4e0a82516c56e829167dd5fe59d0da8e648fce53b4e1941873800c12436"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.40/codexctl_v0.1.40_Linux_arm64.tar.gz"
      sha256 "77026fd28a81f585c55a02774e411b4c7da76bf217632ae22d765ae70fd08dbf"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.40/codexctl_v0.1.40_Linux_x86_64.tar.gz"
      sha256 "274708e5828e7e7e144fff9e48c9c36ebf7b69bcdd2220e6c17943a0a94120eb"
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
