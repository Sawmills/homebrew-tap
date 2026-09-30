class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.7/claudectl_v0.1.7_Darwin_arm64.tar.gz"
      sha256 "91c195d6b41b822d778cf3439951f816f9f67cfae715ed967e22cbc58f035d7a"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.7/claudectl_v0.1.7_Darwin_x86_64.tar.gz"
      sha256 "090900cb41c3c4ca27be0adcaf478877d7488a07a4c14ff882dc015e707b139d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.7/claudectl_v0.1.7_Linux_x86_64.tar.gz"
      sha256 "ee2c4f3432570471068672a49ec7a0dd940c7420f949866050465d01ef18044a"
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
