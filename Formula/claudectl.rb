class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.47/claudectl_v0.1.47_Darwin_arm64.tar.gz"
      sha256 "0aa7e881c745fbbffee222558567397233b642272a44e4c4de3567ee0a997a34"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.47/claudectl_v0.1.47_Darwin_x86_64.tar.gz"
      sha256 "4ec5f9f24fb6d5b92b463a8ccdd0ad59aa4e05a95ff640bc216eb4c96340c8a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.47/claudectl_v0.1.47_Linux_arm64.tar.gz"
      sha256 "16944e704551ac0e950bdc5bc0c74ba5178a84c51ed3efe9112204d84dfe9b26"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.47/claudectl_v0.1.47_Linux_x86_64.tar.gz"
      sha256 "bf840dc19a3cc895c7ae22e1a64db16fef4f1625f8a2d707b189415965a2e7e7"
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
