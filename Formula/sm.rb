class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.3.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.0/sm_v0.3.0_Darwin_arm64.tar.gz"
      sha256 "1d5f0c7fbcb6734afb410a7f94887386589c8dad2dbf2a18d6219cfcb5da22fb"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.0/sm_v0.3.0_Darwin_x86_64.tar.gz"
      sha256 "f37172c47e84abf4d9a79eaf12c21948166b686e965b6269f61e48df871654a5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.0/sm_v0.3.0_Linux_x86_64.tar.gz"
      sha256 "d8ca582c7437940d02260553574530d54b4824ee0bb3837108b822b31515d297"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
