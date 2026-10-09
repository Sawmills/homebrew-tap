class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.19/claudectl_v0.1.19_Darwin_arm64.tar.gz"
      sha256 "d8d3461a8709d93753d6ee97097d92dbdb3e46a9e7a1e6b34f8c281cb8743316"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.19/claudectl_v0.1.19_Darwin_x86_64.tar.gz"
      sha256 "a243ad4125fa9e9d3263d60a4b42027144a06e8b7198d4bcb8371dd0c05d10b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.19/claudectl_v0.1.19_Linux_x86_64.tar.gz"
      sha256 "e5d81bd0ce0ef15ea0779f2036f328833a7622e779521f9f1126c391380d07a8"
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
