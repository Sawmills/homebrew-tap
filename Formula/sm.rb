class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/sawmills-cli/releases/download/v0.2.1/sm_v0.2.1_Darwin_arm64.tar.gz"
      sha256 "6cd21542f559b739567be900e50543d2dbf58fd828984daec76818ad2ad67cb8"
    else
      url "https://github.com/Sawmills/sawmills-cli/releases/download/v0.2.1/sm_v0.2.1_Darwin_x86_64.tar.gz"
      sha256 "d755bd0534bae32e3e6cb691f3c2d9b8c4f1162de39946b34e36d5865886371f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Sawmills/sawmills-cli/releases/download/v0.2.1/sm_v0.2.1_Linux_x86_64.tar.gz"
      sha256 "f0c23494c68767f20e348515237380e64b3c97fad47f1272d6044d35508e5ac8"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
