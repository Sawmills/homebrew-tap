class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.23/claudectl_v0.1.23_Darwin_arm64.tar.gz"
      sha256 "2c58e95a9b3ffd1f0b3f361ef1b1eadf4f0bad2b1225522df5d1906d086f436a"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.23/claudectl_v0.1.23_Darwin_x86_64.tar.gz"
      sha256 "d4922f825376c22ee1094ba3367a2f10d87736e4d2c971ea399e41b1b2e1b693"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.23/claudectl_v0.1.23_Linux_x86_64.tar.gz"
      sha256 "4139daa86bf20c96a62459a35a53233697e7db7bcd612c14afde79126e684b6f"
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
