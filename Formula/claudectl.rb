class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.10/claudectl_v0.1.10_Darwin_arm64.tar.gz"
      sha256 "75cf572a885c9bf55d468e4f79fa5934d147681ff7aa80f5700a0c27daa4d0e9"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.10/claudectl_v0.1.10_Darwin_x86_64.tar.gz"
      sha256 "a0fefe531bae453789e7d5f5871b3dafd7474381b36bf25f53ecdb3615e826bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.10/claudectl_v0.1.10_Linux_x86_64.tar.gz"
      sha256 "3d1ccbc42b7c04d51f07bdaeef5e869e5d52715a8cc09b44623033f718baf95d"
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
