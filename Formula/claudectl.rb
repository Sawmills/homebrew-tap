class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.22/claudectl_v0.1.22_Darwin_arm64.tar.gz"
      sha256 "22d876b2e354865f1891a9893026c5fce30470e147124e80e88eece94bcce768"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.22/claudectl_v0.1.22_Darwin_x86_64.tar.gz"
      sha256 "6f422705ddf739726ac4b2c6ff33d32f4252ff8825c625a1722f4305ef2db489"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.22/claudectl_v0.1.22_Linux_x86_64.tar.gz"
      sha256 "ae16b1cc6b18a2377b34e00cb8fd75ce4c007f184ce2b6fc8a1b714acc79541f"
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
