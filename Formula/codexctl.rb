class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.51/codexctl_v0.1.51_Darwin_arm64.tar.gz"
      sha256 "59f715484d22173d44ec3a7d31674af3c6fe39b56ced0e0473fa647d6974b405"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.51/codexctl_v0.1.51_Darwin_x86_64.tar.gz"
      sha256 "91950219d2304c510bd040f7fd1f2457fcf62e11e072cfc5810d8b62c4cae6a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.51/codexctl_v0.1.51_Linux_arm64.tar.gz"
      sha256 "688111200113874ddd632a81a98be218683a454604473a99ef745bc61e19f289"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.51/codexctl_v0.1.51_Linux_x86_64.tar.gz"
      sha256 "6def57f4fd7b4561b59b72ad376a23344c2059d7bcc97883e91dbb75ac871b6c"
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
