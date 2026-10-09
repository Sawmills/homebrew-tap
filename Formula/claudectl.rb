class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.24/claudectl_v0.1.24_Darwin_arm64.tar.gz"
      sha256 "37e61a59a9b0d14d3254f1d76554ac7b7a2bf9f7ad407f48196fb28ae08cf1d2"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.24/claudectl_v0.1.24_Darwin_x86_64.tar.gz"
      sha256 "a3c737ebf3d3a3b32beef9c094261c883166d53a83ef6c789d902080f61985f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.24/claudectl_v0.1.24_Linux_x86_64.tar.gz"
      sha256 "b43861e1aec89b9047ea64b090867486f9fd933b807975178cebc3c913eae719"
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
