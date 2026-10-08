class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.18/claudectl_v0.1.18_Darwin_arm64.tar.gz"
      sha256 "6785e6942fb27047476ffd656bed78aae95dca8a1a17c9627b16c4233ac78369"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.18/claudectl_v0.1.18_Darwin_x86_64.tar.gz"
      sha256 "6ede34a92c8cb79ce3cee4abc87d1089274f8370940e73d2eccad2f8aa6cdc2e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.18/claudectl_v0.1.18_Linux_x86_64.tar.gz"
      sha256 "77a8f0a0063b609874dc6fb7a0d1c3bcdd502370e723d5c41413d3fc934f06db"
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
