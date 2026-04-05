class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.6.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.1/sm_v0.6.1_Darwin_arm64.tar.gz"
      sha256 "4e6ff4c260a83c4bb8e96297798f36d48caab97051a094c2c4d3269c567d3ff4"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.1/sm_v0.6.1_Darwin_x86_64.tar.gz"
      sha256 "4a36acef9c1be8d35d41d1fe9b7433da2b635d403e914f0593e2d4c4d2d070ab"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.1/sm_v0.6.1_Linux_x86_64.tar.gz"
      sha256 "1e8547d00d57e0f492d0588fe57b0a06a314c47e10f45fcab1b6e9624b521f54"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
