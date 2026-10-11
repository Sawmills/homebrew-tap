class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.26/claudectl_v0.1.26_Darwin_arm64.tar.gz"
      sha256 "66ea9eb140ea939acc04394effa05a26a03315af7f32d7cf7fa383615c99332d"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.26/claudectl_v0.1.26_Darwin_x86_64.tar.gz"
      sha256 "536e4f02af948168546864ba291965db572cca68727f53df1d64980106094674"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.26/claudectl_v0.1.26_Linux_x86_64.tar.gz"
      sha256 "ca3c02f9e497076e1c74b7344818cb62948e30237a5d36fcf1e3a3842bbca400"
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
