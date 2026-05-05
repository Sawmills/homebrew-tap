class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.13.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.13.0/sm_v0.13.0_Darwin_arm64.tar.gz"
      sha256 "d5eb75ebac3a0efc9dda9f0b1bcc6b0d85766da0180a82871db97b03d21e2e4c"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.13.0/sm_v0.13.0_Darwin_x86_64.tar.gz"
      sha256 "433fdabe0e3cc1e3f8493726ee39e9528b4c6c20058bdca263b43ae6a14899e5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.13.0/sm_v0.13.0_Linux_x86_64.tar.gz"
      sha256 "de947d9dc5d56b76203d32d5ac3c026bc8c2d3803e30327787cc1046f0649694"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
