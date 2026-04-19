class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.7.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.7.1/sm_v0.7.1_Darwin_arm64.tar.gz"
      sha256 "2acaf7c806c7318092921effb8dd0ab21cb597f8c1ed60b45f8a575a7fdfb4da"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.7.1/sm_v0.7.1_Darwin_x86_64.tar.gz"
      sha256 "55e6cd7d384505d619a3a22b4fc5d1a560428c4d54ef59dca22019a302f29c41"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.7.1/sm_v0.7.1_Linux_x86_64.tar.gz"
      sha256 "abad204ce74fa372e05ea6f5deb7fff8df835454f110cb5be977ff21227fd4a0"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
