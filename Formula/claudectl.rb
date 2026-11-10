class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.45/claudectl_v0.1.45_Darwin_arm64.tar.gz"
      sha256 "8c32a811efde94c599d71d51158463a8ba601bebbb4d467c9fabddaa19fe0f33"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.45/claudectl_v0.1.45_Darwin_x86_64.tar.gz"
      sha256 "5fff3003f0fd3cc6900fc90e49859c521e20ae3f7ef2223658e2c8291ebb1815"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.45/claudectl_v0.1.45_Linux_arm64.tar.gz"
      sha256 "8a5bcf454c35c0b47e8a8596557d440f48a8c76f2b0b2975d4a2ca24df57b62c"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.45/claudectl_v0.1.45_Linux_x86_64.tar.gz"
      sha256 "43170d37de4e12090b96edb6ff339e2a15ba97291a2d8be29e57f3a7166325db"
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
