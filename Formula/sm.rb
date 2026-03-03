class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.6"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.6/sm_v0.2.6_Darwin_arm64.tar.gz"
      sha256 "465ed3901183fdba58701c45356983d66f635c07fc1b4705a7273c1e616ddcea"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.6/sm_v0.2.6_Darwin_x86_64.tar.gz"
      sha256 "1adb1073f7f89b80730b6d402a76d64deb78cfc3c5a2a5f993c1ed355e510984"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.6/sm_v0.2.6_Linux_x86_64.tar.gz"
      sha256 "4832e4a511239f6a3b2739b3705d72b9636e800cef080fd4763c33b182159778"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
