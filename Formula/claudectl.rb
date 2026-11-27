class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.56/claudectl_v0.1.56_Darwin_arm64.tar.gz"
      sha256 "a5ced033ea8ed7bc8b99917cede660a42c2c993eca8746c79587edab047e2b00"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.56/claudectl_v0.1.56_Darwin_x86_64.tar.gz"
      sha256 "9e0bd151745ef73c3e530b367f2b96ce001617612fbf008d79ed8c6f833c5556"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.56/claudectl_v0.1.56_Linux_arm64.tar.gz"
      sha256 "a6015f03f05391498c03c71dac20e31bec1b3869b0a8c91832ba2e91a9eb7b78"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.56/claudectl_v0.1.56_Linux_x86_64.tar.gz"
      sha256 "2ad26015420a5a40b5d70bcd19ab841c15b85434a461a4d3e6ba5847795432ce"
    end
  end

  def install
    bin.install "claudectl"
    generate_completions_from_executable(bin/"claudectl", "completions")
  end

  test do
    help = shell_output("#{bin}/claudectl --help")
    assert_match "Usage:", help
    assert_match "claudectl", help
    assert_path_exists bash_completion/"claudectl"
    assert_path_exists zsh_completion/"_claudectl"
    assert_path_exists fish_completion/"claudectl.fish"
  end
end
