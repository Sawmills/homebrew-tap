class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.6.2"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.2/sm_v0.6.2_Darwin_arm64.tar.gz"
      sha256 "cf3fec761908afe6df1e0959d168307729a2c53ac6e01cbbaec8d46b1027cfb7"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.2/sm_v0.6.2_Darwin_x86_64.tar.gz"
      sha256 "720aabf26ee4ee3a60bf98574c7a871df449a558c8a89b34ac74d3ba7ff444fd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.2/sm_v0.6.2_Linux_x86_64.tar.gz"
      sha256 "05ce84f0257c4a89f840a88dde2ffb6b7eeeb382c34128b3204614432db37533"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
