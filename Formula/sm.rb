class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.8.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.8.1/sm_v0.8.1_Darwin_arm64.tar.gz"
      sha256 "128d2d8e43ff9b5985094c20d6b3a7203ef07821ccd4843ef723abf0050dcfa9"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.8.1/sm_v0.8.1_Darwin_x86_64.tar.gz"
      sha256 "2cc53779f7d31e343f304df457364cf0e46896bdb734f05719a14caca459638e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.8.1/sm_v0.8.1_Linux_x86_64.tar.gz"
      sha256 "00924e344554393075a8692882ede0d0f990e2f4842137f09522f08d2781de68"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
