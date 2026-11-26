class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.55/claudectl_v0.1.55_Darwin_arm64.tar.gz"
      sha256 "a6c9e788d0369628d55db7982789e355b102a2eabb619b9a902b7cc63481ff31"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.55/claudectl_v0.1.55_Darwin_x86_64.tar.gz"
      sha256 "1ae3441ace8b9161468fa17e2923311db9356f9b25bc68a4965733c02a87efe1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.55/claudectl_v0.1.55_Linux_arm64.tar.gz"
      sha256 "f494a5a06d5d8229ed37bad27a698dbea03d4afeee3271a0b107eedfd07e92af"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.55/claudectl_v0.1.55_Linux_x86_64.tar.gz"
      sha256 "ee4ab44c246d2e3d4ea2214234ee8337d3c79aa885c965e991307b4d6df31c64"
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
