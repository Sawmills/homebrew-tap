class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.49/claudectl_v0.1.49_Darwin_arm64.tar.gz"
      sha256 "76d4b80e8df3ffb7881ed990576c6da14eebbc776ae32f08863ae754f5afd98f"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.49/claudectl_v0.1.49_Darwin_x86_64.tar.gz"
      sha256 "a41acb71b8f440d68d45306b1fb76a63ac6cbde58cf3f968abc35c9d95606244"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.49/claudectl_v0.1.49_Linux_arm64.tar.gz"
      sha256 "32aa3144d60b5bf465ab80c73ece3714509d195d3dfcbe663c440a763c897829"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.49/claudectl_v0.1.49_Linux_x86_64.tar.gz"
      sha256 "c34dca8f230384c65086ec7bc47829d521f080a6ccc1ede89c082244c4e0b37c"
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
