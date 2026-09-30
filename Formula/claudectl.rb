class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.6/claudectl_v0.1.6_Darwin_arm64.tar.gz"
      sha256 "5fe5abec84b6692aa35150f134045efc87ba80ff206b3e2b2f80354224fc7099"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.6/claudectl_v0.1.6_Darwin_x86_64.tar.gz"
      sha256 "419c494013180accd21f0bef95a43e992063330fa9a6c0db5fc77e3d9023ff68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.6/claudectl_v0.1.6_Linux_x86_64.tar.gz"
      sha256 "46f06c5e6a11c59200970aa4f2ef55c77f27232e8983ff8efbb269077ff16087"
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
