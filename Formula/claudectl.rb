class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.37/claudectl_v0.1.37_Darwin_arm64.tar.gz"
      sha256 "872d6b1c493226ea02dad451d2dcf7159515c78913465f238dfb93a8c813a5b9"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.37/claudectl_v0.1.37_Darwin_x86_64.tar.gz"
      sha256 "3705afed8ef8aa5255143b46d25d7741a39ba848e25ffec0a1961afbfcb76f7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.37/claudectl_v0.1.37_Linux_arm64.tar.gz"
      sha256 "2b5838f4763fc96b68b104dadcb1690b900e4dc34fc16c683094c46c775d25e1"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.37/claudectl_v0.1.37_Linux_x86_64.tar.gz"
      sha256 "dafa76c0e0c78ed4873fe7e5c32eba1efb0b6116276144513e47ca1890a7bfb6"
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
