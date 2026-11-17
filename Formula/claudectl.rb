class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.52/claudectl_v0.1.52_Darwin_arm64.tar.gz"
      sha256 "1f2bb6f62e66cf237df0de4b96462b5553607f9816860b84ef34300d3e2b9076"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.52/claudectl_v0.1.52_Darwin_x86_64.tar.gz"
      sha256 "3e7a7573657ef5ef99e3f79357dfc57c89b52c3fe3f1b5e52ce04550c480c6f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.52/claudectl_v0.1.52_Linux_arm64.tar.gz"
      sha256 "a889dc1b617ddc41d5af1cfce34c556cd7f8c76acbbb932b190f17a0eedc2a20"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.52/claudectl_v0.1.52_Linux_x86_64.tar.gz"
      sha256 "d1b8d3e6c71b29c40bcfa1cf838f6691b1f57969c968dff25cc46dbee0055aff"
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
