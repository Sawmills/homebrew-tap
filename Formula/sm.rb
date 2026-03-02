class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.4/sm_v0.2.4_Darwin_arm64.tar.gz"
      sha256 "5499d492d23b55163ebc80521fce5d66abe2ebd2eaee93d29aa8fd3e60d00317"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.4/sm_v0.2.4_Darwin_x86_64.tar.gz"
      sha256 "c9b151c8f256ac9df644df5f6ec3863d75f2118f9593fd885b2a20ead527df7d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.4/sm_v0.2.4_Linux_x86_64.tar.gz"
      sha256 "8b3e7f8b6e1361c95a10c411572ffdb6030e1d7363a1c7ca40a2f63d93dae44e"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
