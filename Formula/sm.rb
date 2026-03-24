class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.0/sm_v0.5.0_Darwin_arm64.tar.gz"
      sha256 "a7e239551b2fb7261dcf60a43d758d045b0f9960d52c54d0eb3e76464101fea4"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.0/sm_v0.5.0_Darwin_x86_64.tar.gz"
      sha256 "081e2223482c81ecfe9f569c2dba502a304b96b35d7c47f1f5bc682c9f0bad2b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.0/sm_v0.5.0_Linux_x86_64.tar.gz"
      sha256 "e6e11bcc8d4a20172faa0692af1d16bb1c010afeab4809ca56843f4f4d92a526"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
