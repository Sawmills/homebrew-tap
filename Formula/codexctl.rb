class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.56/codexctl_v0.1.56_Darwin_arm64.tar.gz"
      sha256 "6b334d1583f90d366565a7398ab189a7f04815c3f5daa918ceed8a05a320d843"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.56/codexctl_v0.1.56_Darwin_x86_64.tar.gz"
      sha256 "da469b82cfecd8bfd465ead6b3d4c58338ca8f0e0956cfdb5ac6a64946ddee54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.56/codexctl_v0.1.56_Linux_arm64.tar.gz"
      sha256 "4542ba73b71858e5033541c995d118b40dca328cb17bbe898edd7ad7b6a1fe2d"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.56/codexctl_v0.1.56_Linux_x86_64.tar.gz"
      sha256 "1acd89bc522ba4965d9072e7cb423682adbaa164d9ac5405ec61d1b4a3be5e0d"
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
