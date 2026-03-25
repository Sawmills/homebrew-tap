class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.5"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.5/sm_v0.5.5_Darwin_arm64.tar.gz"
      sha256 "1742e6155780b2596a9526c0e68155ccfc68f6020201febfe6b14a2a884ed40a"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.5/sm_v0.5.5_Darwin_x86_64.tar.gz"
      sha256 "9032c4dfac304018804155fbff6851acdc5c56dc48afccec888494c9c33c0924"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.5/sm_v0.5.5_Linux_x86_64.tar.gz"
      sha256 "069e0a11414cc1e520854c48e5ca0f9d2621e3fdc25c3fb1d61b188f0f597e9e"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
