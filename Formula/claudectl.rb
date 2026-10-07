class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.9/claudectl_v0.1.9_Darwin_arm64.tar.gz"
      sha256 "edf6c4c484c49fa8882e7ee081aac0c03f210e3910b3841510f967d673b995ce"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.9/claudectl_v0.1.9_Darwin_x86_64.tar.gz"
      sha256 "4797e6205a961b7f18a076d8bbaba55a37e3fce98c56cdca1bc94cb4d59b168d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.9/claudectl_v0.1.9_Linux_x86_64.tar.gz"
      sha256 "0b815f965bd1270ec9c74fe59d4b8c7b2475039a64b0e94c098c0e1646c2386e"
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
