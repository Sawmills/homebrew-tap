class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.9.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.9.1/sm_v0.9.1_Darwin_arm64.tar.gz"
      sha256 "894e07abd49d4944e586f0cb89e5892cd1a62a57cdff4354d2eb3bdb222ca09d"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.9.1/sm_v0.9.1_Darwin_x86_64.tar.gz"
      sha256 "090731ad4a428c370a577505f082f8aaf94be5c48b73931b1932638a66e07df3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.9.1/sm_v0.9.1_Linux_x86_64.tar.gz"
      sha256 "ef7774a6c0396159feb50378d3218e69662152bd2f89188926e94a67bf332986"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
