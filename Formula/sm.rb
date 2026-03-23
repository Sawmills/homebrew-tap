class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.3.3"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.3/sm_v0.3.3_Darwin_arm64.tar.gz"
      sha256 "7098f50813e334e201cdacdc8158a42253670276b0faae3cc28be6fc9aec7e32"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.3/sm_v0.3.3_Darwin_x86_64.tar.gz"
      sha256 "8a93c6cea0e47fd339b2ccfb63f387847524fff8dc5c1658511255add9c5e7bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.3/sm_v0.3.3_Linux_x86_64.tar.gz"
      sha256 "90414d2c9b3cdd74a326f3a83b48e3b2bad5eb4d20e57a67ba2e191e457c1b98"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
