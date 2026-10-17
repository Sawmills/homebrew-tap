class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.31/claudectl_v0.1.31_Darwin_arm64.tar.gz"
      sha256 "a5e971df6ae2d880cf711ec167f1d8ffec204f22ea9d9c3e3d9c653108045f32"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.31/claudectl_v0.1.31_Darwin_x86_64.tar.gz"
      sha256 "e3bd39d43d1eeb9bc22af7de0dfb2ddc787f8455b2c7e8009ea17690d93453c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.31/claudectl_v0.1.31_Linux_x86_64.tar.gz"
      sha256 "05eb08ed17ccbf76a01edfa254afe6f2946164ff91e641b11d143e10b57a3bc8"
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
