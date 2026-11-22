class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.54/claudectl_v0.1.54_Darwin_arm64.tar.gz"
      sha256 "d9991d3a737039d365d0ddec3068a842fed55d3f7988ecdb0bce5bdcd545e011"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.54/claudectl_v0.1.54_Darwin_x86_64.tar.gz"
      sha256 "466992953bae2365720d807e46d83577bd492ddc63308c0aaa8aa0e55b396d87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.54/claudectl_v0.1.54_Linux_arm64.tar.gz"
      sha256 "ee3030bd800bc6ae0a5a7577de73b81061a52950a6ad6bd6171c6807e55032db"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.54/claudectl_v0.1.54_Linux_x86_64.tar.gz"
      sha256 "a60f76d562bfd8a6ff0dccfc1a4b937ef81956172c575e1764aa8c0880a36225"
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
