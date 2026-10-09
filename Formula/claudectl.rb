class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.21/claudectl_v0.1.21_Darwin_arm64.tar.gz"
      sha256 "1367836afb3eca361d6166170198cc3e7e611c197fba82d3753533a35f3552d5"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.21/claudectl_v0.1.21_Darwin_x86_64.tar.gz"
      sha256 "8422433b765ae4574167b3cdfef5d80c0216a204e5bf563f6f5db7d9484c640a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.21/claudectl_v0.1.21_Linux_x86_64.tar.gz"
      sha256 "ff6202e93d88f796c9cc225f19dfd0b9a6cd7748733d431fbd6c8885ef63d7ee"
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
