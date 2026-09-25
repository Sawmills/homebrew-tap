class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.3/claudectl_v0.1.3_Darwin_arm64.tar.gz"
      sha256 "18918035d52547af3cdc38351a97c0bcf60dfac0393c0085c85bae16ccd37b04"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.3/claudectl_v0.1.3_Darwin_x86_64.tar.gz"
      sha256 "666af4dce49d224b850f725685ec0132237d6546a5ed95e09f9fdc5aa7f0aec1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.3/claudectl_v0.1.3_Linux_x86_64.tar.gz"
      sha256 "7e90990cb186a6659037955ace19eced9ad70dee07f7f7981936255d4a78c8aa"
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
