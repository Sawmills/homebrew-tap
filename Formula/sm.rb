class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.7.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.7.0/sm_v0.7.0_Darwin_arm64.tar.gz"
      sha256 "72c44bd78360c3751acb51a604115fa27d2ce659b076ee9d9f8d04d9e4c4284d"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.7.0/sm_v0.7.0_Darwin_x86_64.tar.gz"
      sha256 "dac9c18021ef05eb4e6fdee1df816f4862f6fe8ffa3f0e0e9995e0b9aee8ca8a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.7.0/sm_v0.7.0_Linux_x86_64.tar.gz"
      sha256 "2ae975817f1e14a8c1ea630526f718862c9f0f70f72a7e830e9b44826b9b9975"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
