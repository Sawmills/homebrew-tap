class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.39/claudectl_v0.1.39_Darwin_arm64.tar.gz"
      sha256 "aaddcacfc4b9a73235db5dd6b836775cba8c9963456c128bf25f9a4525e37c83"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.39/claudectl_v0.1.39_Darwin_x86_64.tar.gz"
      sha256 "04bafa4bd4a1d86c7a510fb7d3f38dfd96ae8a3b3330fca92e9ce6c4546a06c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.39/claudectl_v0.1.39_Linux_arm64.tar.gz"
      sha256 "15a511db69c5c7e1dc832c26b84eb0359db5f684f8f9918b5b475dd479347550"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.39/claudectl_v0.1.39_Linux_x86_64.tar.gz"
      sha256 "792a4761c05be51d433e389c7d29864a216b9a039fd04a5ad28679b13789a4ad"
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
