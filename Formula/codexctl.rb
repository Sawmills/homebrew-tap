class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.33/codexctl_v0.1.33_Darwin_arm64.tar.gz"
      sha256 "bd6b1e74b17381c30952e35a880b8260138b2de677463f9c1f545236c7847b88"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.33/codexctl_v0.1.33_Darwin_x86_64.tar.gz"
      sha256 "c6409f158ddc768f85da56fd1ab395fb6db4f44d257d938ee7f08da48998d71b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.33/codexctl_v0.1.33_Linux_arm64.tar.gz"
      sha256 "76127d2f8a10c0bce79d0aaee1674c8a688514af7d89fa092da70b3029464833"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.33/codexctl_v0.1.33_Linux_x86_64.tar.gz"
      sha256 "828d8af491bac055d6fd52f1a5656ae1ecc07300e38fe192ffad0947b9cd0bea"
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
