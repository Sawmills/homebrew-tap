class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.25/claudectl_v0.1.25_Darwin_arm64.tar.gz"
      sha256 "7a29e9b5feaf5ba1934273b3d7bd31441a32e676687ec2063b72837b03f2c5bc"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.25/claudectl_v0.1.25_Darwin_x86_64.tar.gz"
      sha256 "554e9ee6ba69cdf307800cc2b9dbaab596041f0d452e99b66658c5c2d7fcc3f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.25/claudectl_v0.1.25_Linux_x86_64.tar.gz"
      sha256 "f28a9e98122c4586831627b452a9e4740659914d9904185d33f316444fa401aa"
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
