class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.43/claudectl_v0.1.43_Darwin_arm64.tar.gz"
      sha256 "140eca477f55a1e91a440ebfbb8afbf5871131ab598adf96de2e40c9543c06bb"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.43/claudectl_v0.1.43_Darwin_x86_64.tar.gz"
      sha256 "fcde774a54fab78c6cc32daabbc46d3e482c942c61685e39a7834ebee7f8bbb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.43/claudectl_v0.1.43_Linux_arm64.tar.gz"
      sha256 "1145ddd52e2acf4614b808d9fa8b28d41b5f5a74ab68b2aaaa40c2e8146c8b3b"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.43/claudectl_v0.1.43_Linux_x86_64.tar.gz"
      sha256 "6534da6ab1549ae9a4a1f845b5ed9957c4aef2c865c2d9fc3b14d0f0c10a1897"
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
