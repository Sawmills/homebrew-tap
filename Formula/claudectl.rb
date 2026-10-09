class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.20/claudectl_v0.1.20_Darwin_arm64.tar.gz"
      sha256 "f3d2a7ddd6bd103edc159a2fab369367d6b6ee385d33cabd97ea1f9be2f2cbcc"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.20/claudectl_v0.1.20_Darwin_x86_64.tar.gz"
      sha256 "f70de68f83eefaf7a9572663f9135f02b175809c63cc59dc82c35d0e4415733f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.20/claudectl_v0.1.20_Linux_x86_64.tar.gz"
      sha256 "1b43d635960d274623e090940b5421f69d76e8d57fd167d6c2d5e14e7c2daeb0"
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
