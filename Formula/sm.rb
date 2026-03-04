class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.8"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.8/sm_v0.2.8_Darwin_arm64.tar.gz"
      sha256 "b999e67b399903cbdc7d4884a4493994699740636745e240409e92f4d2dc206a"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.8/sm_v0.2.8_Darwin_x86_64.tar.gz"
      sha256 "444bbdd9fa1d8b44121d9b5045fd63fc84eb77fa51de35167cc156d8e171c705"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.8/sm_v0.2.8_Linux_x86_64.tar.gz"
      sha256 "6f24c9818efebf9917e8028fb560b633e118b65200de1c4a6df58a05e98cff5b"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
