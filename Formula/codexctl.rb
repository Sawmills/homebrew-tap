class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.35/codexctl_v0.1.35_Darwin_arm64.tar.gz"
      sha256 "c3706e3443ab083123008f445fadc07fd2e738c1463bc31bd9323bc851a53b21"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.35/codexctl_v0.1.35_Darwin_x86_64.tar.gz"
      sha256 "a27e89407b731125209153a5111a5f2f974836a785dbb3d2baafacf627f86c77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.35/codexctl_v0.1.35_Linux_arm64.tar.gz"
      sha256 "617b7079341357ee23630a1887d6a31b8150c1b4d578859953caffbf777f3c08"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.35/codexctl_v0.1.35_Linux_x86_64.tar.gz"
      sha256 "12398f70603f34a35c1e626d075cfd468880c73c119eb160170c5ddb21e883d3"
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
