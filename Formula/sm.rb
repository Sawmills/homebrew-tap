class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.6.7"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.7/sm_v0.6.7_Darwin_arm64.tar.gz"
      sha256 "f8f368195ad1bed6fa1d5303e5448d538afd310cd85db999c392d4b43c6b64ba"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.7/sm_v0.6.7_Darwin_x86_64.tar.gz"
      sha256 "c1ccc2a89daa09e891910b021f26a14453c5877ba1a4efd09f1530aaf1f9ff00"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.7/sm_v0.6.7_Linux_x86_64.tar.gz"
      sha256 "72446a4b1e732b0448aaef5d5be69c8e15ddc8f662158188fb722094718ec983"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
