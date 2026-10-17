class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.29/claudectl_v0.1.29_Darwin_arm64.tar.gz"
      sha256 "5847a1415281e1340220f2a2d9faeb0ea6e9bf38a22afc1b155a1c354a9f4ce6"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.29/claudectl_v0.1.29_Darwin_x86_64.tar.gz"
      sha256 "724108d901e0252a22f1c075c93704630ac5dd5b1f4409b85e7df07a6329397a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.29/claudectl_v0.1.29_Linux_x86_64.tar.gz"
      sha256 "a26c4697eba00a1e5f95da3143804a06793b16de428268c46ef4c0e0144ec57b"
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
