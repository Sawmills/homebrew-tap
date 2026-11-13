class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.48/claudectl_v0.1.48_Darwin_arm64.tar.gz"
      sha256 "14f03ef56400eac253057d3b3d98d070fe3af1e5cfb7cb2436280ebe22b21a96"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.48/claudectl_v0.1.48_Darwin_x86_64.tar.gz"
      sha256 "9b9a8bdabc960e52d70ee15f274a2c99e1ce4a8c23a117d6bd55b4db66bccae6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.48/claudectl_v0.1.48_Linux_arm64.tar.gz"
      sha256 "96a8194b7ba8f42cdb60a29fc48024eb94e2ac0066899af42ffb7701d1a93a2b"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.48/claudectl_v0.1.48_Linux_x86_64.tar.gz"
      sha256 "4807220479888edbadc5a6e04dd0a250c2de2ab7f51ac9faee58ad4a94c8ed5d"
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
