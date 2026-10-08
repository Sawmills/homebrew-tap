class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.13/claudectl_v0.1.13_Darwin_arm64.tar.gz"
      sha256 "656b3e6b61a0632bf0a1313da015b424d5ba1774ec3e7e57b26ce70b34bf7921"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.13/claudectl_v0.1.13_Darwin_x86_64.tar.gz"
      sha256 "ebf30f12b14bfbcdce805ab2918d7f909b3daaa3561ee6e445f72827be19b077"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.13/claudectl_v0.1.13_Linux_x86_64.tar.gz"
      sha256 "21e71f42944a5756801b73f366bb4956ce13efda5fac1086ca12a830a300f3b1"
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
