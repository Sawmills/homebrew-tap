class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.8/claudectl_v0.1.8_Darwin_arm64.tar.gz"
      sha256 "a57969e96f5c6f6db8e0e9fb3bfbd2739b4a5072a7f84e0c562627bf6ba8629c"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.8/claudectl_v0.1.8_Darwin_x86_64.tar.gz"
      sha256 "a344a6b3b9c112eeb4ae24b6947dd4c4f377e4176455d8916958eb2f8e5ed797"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.8/claudectl_v0.1.8_Linux_x86_64.tar.gz"
      sha256 "54506d88f277866be7e0f9a4877b3317468e198eccf95b39b7f343120a7b64ea"
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
