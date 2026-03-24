class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.2"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.2/sm_v0.5.2_Darwin_arm64.tar.gz"
      sha256 "f09c6d9d9c8ac5d298c5bc1a578ec6f88addf09fbd4cc461662e1a982fb8e58c"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.2/sm_v0.5.2_Darwin_x86_64.tar.gz"
      sha256 "a805092118503cfeeef980b6244077b0afde6fa2cf2c0077ef8cefa729d29990"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.2/sm_v0.5.2_Linux_x86_64.tar.gz"
      sha256 "7ca0d3b9980f10d0fde29c4d4ed118b9b234226680b0a0f9a44d9518098d8db7"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
