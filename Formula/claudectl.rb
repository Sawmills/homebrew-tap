class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.16/claudectl_v0.1.16_Darwin_arm64.tar.gz"
      sha256 "f3d05689390cd56ddb5171dddfe15f0771e82ee0b6871a48a0e80fa9ea674f9c"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.16/claudectl_v0.1.16_Darwin_x86_64.tar.gz"
      sha256 "6374c800ff99b4c529df39dd1b4664db6284fa4750d3d9afc6d38f3c1a328776"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.16/claudectl_v0.1.16_Linux_x86_64.tar.gz"
      sha256 "3deee1609095004ae3c05d0f5bbf42002b3929ecb86b6ff2292189d9a9ffd6d4"
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
