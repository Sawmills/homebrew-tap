class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.53/claudectl_v0.1.53_Darwin_arm64.tar.gz"
      sha256 "9639212a089a4decb91a89fe1905b85b98add81215557dac1b1340df71086c58"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.53/claudectl_v0.1.53_Darwin_x86_64.tar.gz"
      sha256 "9f025826fb8ca351c543254ab9d78a0f537e962a724e99ab9c4508b1eba19d64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.53/claudectl_v0.1.53_Linux_arm64.tar.gz"
      sha256 "dd9aa963af306da915fc71259d10c03c72c3d42a20f0324c83c01d4617b48693"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.53/claudectl_v0.1.53_Linux_x86_64.tar.gz"
      sha256 "55c976c763518a178c681afed5d77377b63afe7011df79616fc311cc88e431d5"
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
