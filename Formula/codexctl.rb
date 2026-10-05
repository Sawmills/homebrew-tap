class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.44/codexctl_v0.1.44_Darwin_arm64.tar.gz"
      sha256 "b37f921299e1a826749619485a6640032e0a79de00db9628cec9e57b41268842"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.44/codexctl_v0.1.44_Darwin_x86_64.tar.gz"
      sha256 "1f512d6933c8e1e16631349eedff1955e7ff3d0d57ff2def4dfef92fdccea54f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.44/codexctl_v0.1.44_Linux_arm64.tar.gz"
      sha256 "477511232fbcf6f95ebe0e79d08637c31a81b4e7756b96681cfb3066b4cddb0f"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.44/codexctl_v0.1.44_Linux_x86_64.tar.gz"
      sha256 "891f8cb21df702496fe35f000a2199636844c27a97f5971b264dbe5b1d4e8518"
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
