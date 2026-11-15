class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.50/claudectl_v0.1.50_Darwin_arm64.tar.gz"
      sha256 "df543a1a091769c7c23b89123e577d6ded778c2d7a3f4ec998f235d821dacfbd"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.50/claudectl_v0.1.50_Darwin_x86_64.tar.gz"
      sha256 "a4cdde3ef729f48854911b7bbb779d619905680d298c07a3993578eb63535cb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.50/claudectl_v0.1.50_Linux_arm64.tar.gz"
      sha256 "c2315036a387e80d8d88c6e00a8016ad01fad3a43735bcfa2764fe4f698d1799"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.50/claudectl_v0.1.50_Linux_x86_64.tar.gz"
      sha256 "c6d9721c4036ce3e5fcea7863d74398b42598d2a7337d53dac5842907b4eb333"
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
