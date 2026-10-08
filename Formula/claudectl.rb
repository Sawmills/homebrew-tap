class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.14/claudectl_v0.1.14_Darwin_arm64.tar.gz"
      sha256 "fbee1957f5341ea230edca9462d6a05649a6bb1a7f8c8a36850ca756262eaa4c"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.14/claudectl_v0.1.14_Darwin_x86_64.tar.gz"
      sha256 "8a31e3bc6d81466628ba79f10ad3149b521938b92c369062f957c2b52a49efe0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.14/claudectl_v0.1.14_Linux_x86_64.tar.gz"
      sha256 "57ae83aa5300768db604459e5995fc7315699e39ebfbcb7d131573385690732f"
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
