class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.36/claudectl_v0.1.36_Darwin_arm64.tar.gz"
      sha256 "2126b1a6ec2c590220f9cdd54428992a5b1dc51e5a56c9c209b5919e64c580ba"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.36/claudectl_v0.1.36_Darwin_x86_64.tar.gz"
      sha256 "7a63723d32eddf97a4576b5672b57bbb15483688a352a95dd7b2608207ef7dcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.36/claudectl_v0.1.36_Linux_arm64.tar.gz"
      sha256 "a7f9316a34747a1c565a13ec276a17e6eccaad164fb4f58c355c0c62f7318065"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.36/claudectl_v0.1.36_Linux_x86_64.tar.gz"
      sha256 "7ba5cfbd6aea660bf880375d0260f4d8161e396653294cd5138423c8066abd1a"
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
