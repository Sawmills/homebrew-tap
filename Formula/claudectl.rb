class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.5/claudectl_v0.1.5_Darwin_arm64.tar.gz"
      sha256 "1db603cb5ec67fa51e9ccbf262612a08902ae6000ba2e61f88e2d1abd3ee6a4f"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.5/claudectl_v0.1.5_Darwin_x86_64.tar.gz"
      sha256 "9341e37689ad56abe7467a22e1d4ef64cfd39e4a6b9a37413ae439aee6c60e73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.5/claudectl_v0.1.5_Linux_x86_64.tar.gz"
      sha256 "b445c121910ca31f1d7eb01226ec4ca09fbd9a8315ca605bcb03df9c30731d9e"
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
