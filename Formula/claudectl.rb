class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.28/claudectl_v0.1.28_Darwin_arm64.tar.gz"
      sha256 "f12ac81f970e15135374c2e844c832b4d3d9027880ee81acd33ee6ff9aca86d9"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.28/claudectl_v0.1.28_Darwin_x86_64.tar.gz"
      sha256 "e6bafffe170625f0ba03394b02770a27312c7af1b19da3136fd44915bbf8e092"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.28/claudectl_v0.1.28_Linux_x86_64.tar.gz"
      sha256 "29eb0d2baef13b0dba30ff498e92d8dd85664490905cc64e04ce84c5f6828d98"
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
