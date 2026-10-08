class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.17/claudectl_v0.1.17_Darwin_arm64.tar.gz"
      sha256 "4e013e8d9976e795d80e51d7922da0a67b54d342743efc86ad7d3c2c28a7fee7"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.17/claudectl_v0.1.17_Darwin_x86_64.tar.gz"
      sha256 "f4aebf781e927113d99406eae99ee605152038e0fc9e882bf37221600b9247b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.17/claudectl_v0.1.17_Linux_x86_64.tar.gz"
      sha256 "b4a42e2fb1193fd0b9c3f32aa12115873db0e1902ad49ff3db2fde8a4a8539f4"
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
