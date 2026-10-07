class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.11/claudectl_v0.1.11_Darwin_arm64.tar.gz"
      sha256 "23e41dd92135cc5266ace30713413a1a75debb08d3f51acc313e3ead75858d48"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.11/claudectl_v0.1.11_Darwin_x86_64.tar.gz"
      sha256 "c123eb31b94ceaa62da68217e4f158b0bdc68fd66073ac79b0be5786303eee1b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.11/claudectl_v0.1.11_Linux_x86_64.tar.gz"
      sha256 "b39cf96eac8c453b2f0e2e3fdd2524c4c78191ca492b63e955d574ecd40f8e5e"
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
