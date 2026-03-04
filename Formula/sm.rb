class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.9"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.9/sm_v0.2.9_Darwin_arm64.tar.gz"
      sha256 "05ad63eb1c3c162e2940ac9e54899c3331823c411460bd33c5e0adc5ef2622f4"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.9/sm_v0.2.9_Darwin_x86_64.tar.gz"
      sha256 "5445145288ec8778e42124cd0bf69a736cd52aca169184da96ee7b143d28b791"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.9/sm_v0.2.9_Linux_x86_64.tar.gz"
      sha256 "6fc2220d3f7a9092e12b03cf8633ea74f767a29d3a9a5d1770d2a1616fc60ad2"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
