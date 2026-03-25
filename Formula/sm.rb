class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.6"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.6/sm_v0.5.6_Darwin_arm64.tar.gz"
      sha256 "aff68ef16c7c06a1ab9671f15403e3da9cf6bffdf83aee40f96325027d3524b0"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.6/sm_v0.5.6_Darwin_x86_64.tar.gz"
      sha256 "a563d511be631d86777f5280f4a8a302a24835e56c5aeeb9e7fefa007504eb8d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.6/sm_v0.5.6_Linux_x86_64.tar.gz"
      sha256 "e3285f18867e71c7f5fccbf3ab470aadd8541bd671d39e5432257d160608f6e8"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
