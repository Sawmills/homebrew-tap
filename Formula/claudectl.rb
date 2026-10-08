class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.15/claudectl_v0.1.15_Darwin_arm64.tar.gz"
      sha256 "178150405c1b95ba22a16d2bd44781707a6af66f6d05f60db5f33a61cb8028f1"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.15/claudectl_v0.1.15_Darwin_x86_64.tar.gz"
      sha256 "7e2fd00650c5c6ce1bcfb7da2547b8a97a819f75c277a9122302f1797dc01d87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.15/claudectl_v0.1.15_Linux_x86_64.tar.gz"
      sha256 "d3797b57307a35c0ce39a5332517ef08c5f2b7db885e89502e469e32b7a777b8"
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
