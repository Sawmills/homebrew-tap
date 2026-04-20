class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.9.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.9.0/sm_v0.9.0_Darwin_arm64.tar.gz"
      sha256 "235fdc5070265c73916000ac94a2ef3beca969e34e9bebc2b657efc604236acd"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.9.0/sm_v0.9.0_Darwin_x86_64.tar.gz"
      sha256 "7fdde7e66edf6abd0d5fa77cee6203f31099976ef5092806789fcb20cbf40cf4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.9.0/sm_v0.9.0_Linux_x86_64.tar.gz"
      sha256 "c342206ba7a8c9530a349d8d5fe4c432485d095b74b5a96cefe827077851dd97"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
