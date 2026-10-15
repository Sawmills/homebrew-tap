class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.52/codexctl_v0.1.52_Darwin_arm64.tar.gz"
      sha256 "b31a2aedc012875d1e7229962e9be00c014aeca34507e7a0cb6bf0a23128f8a7"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.52/codexctl_v0.1.52_Darwin_x86_64.tar.gz"
      sha256 "6f51fe5cb455bb084b20d26c3917d1de7dc394de59d91a18cb318f4a2e12e88c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.52/codexctl_v0.1.52_Linux_arm64.tar.gz"
      sha256 "cad39cd969585744c8049193919d8fdd4f8079267143e88b35967fc707f54fb3"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.52/codexctl_v0.1.52_Linux_x86_64.tar.gz"
      sha256 "6684e09b68b535e4b09b0cf87222337e18690f0b80541b80b198f501b1ff66ee"
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
