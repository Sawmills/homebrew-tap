class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.12/claudectl_v0.1.12_Darwin_arm64.tar.gz"
      sha256 "499b24c89c15c855cdbb47934db5f83714d88456377a0756b775698c71ddf339"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.12/claudectl_v0.1.12_Darwin_x86_64.tar.gz"
      sha256 "add7f75609ea3d98b4575d43612fe44881c5b30cd195f9d764638c71280c1437"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.12/claudectl_v0.1.12_Linux_x86_64.tar.gz"
      sha256 "fffbb6b60b187130ff08e12caf6af7459f2536345fb5bd83515b658989a29b43"
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
