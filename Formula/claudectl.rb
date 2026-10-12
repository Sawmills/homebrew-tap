class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.27/claudectl_v0.1.27_Darwin_arm64.tar.gz"
      sha256 "bcb9e23229ffd03a204292715a4243e28d7a386328990db9f2d2ed6c185e3c90"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.27/claudectl_v0.1.27_Darwin_x86_64.tar.gz"
      sha256 "bf1e497a46eed1b154bb5d6cd2f6483e55b2813a0636f028e1c566d6d4fdaf4f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.27/claudectl_v0.1.27_Linux_x86_64.tar.gz"
      sha256 "e9ef7b1852d4e313bebe8c6ad77bab1ccab6c2f8253b650a2b4c323123f362f6"
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
