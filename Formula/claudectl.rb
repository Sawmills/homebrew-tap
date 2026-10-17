class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.32/claudectl_v0.1.32_Darwin_arm64.tar.gz"
      sha256 "8a01014bb26e376bdb476684c8c28f83f3e09d8a52ea61a94a7ea185fd7e371d"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.32/claudectl_v0.1.32_Darwin_x86_64.tar.gz"
      sha256 "36ab2330e42f20a3e4ff3b58ecd92c9fe114a20bec58b56007c0e2d2903716cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.32/claudectl_v0.1.32_Linux_x86_64.tar.gz"
      sha256 "9c9c11c8c663278471ee3e752896e4c05c7e022f2b4be25b5173ff3c946ddf16"
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
