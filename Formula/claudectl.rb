class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.35/claudectl_v0.1.35_Darwin_arm64.tar.gz"
      sha256 "3d864039ee0153f4bd46b81239dfdb32266865ed072634c974c7dfc8823d31b2"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.35/claudectl_v0.1.35_Darwin_x86_64.tar.gz"
      sha256 "8eadc4f3d768e3e0667c65a4c74317af3c207e9102aa0bad0005a9a88f89979b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.35/claudectl_v0.1.35_Linux_arm64.tar.gz"
      sha256 "f6bd84beca5f29a38a5a5e9828b534d5d7e461199d37b2d331a639d1480f1e8c"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.35/claudectl_v0.1.35_Linux_x86_64.tar.gz"
      sha256 "4aa280658b36fb8697f75f14e22141e6c133b7e43e495f0105cf3c71107cbf6f"
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
