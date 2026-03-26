class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.8"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.8/sm_v0.5.8_Darwin_arm64.tar.gz"
      sha256 "1a755c1a624cd0d8fbd7dbb90eb920b18bc91d63d3a11ae1c7dff6dc363587b7"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.8/sm_v0.5.8_Darwin_x86_64.tar.gz"
      sha256 "f14b926edbddc4dfe9209c95b5cd7f9e5abd7722c711a92e5c28dbc630d5e064"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.8/sm_v0.5.8_Linux_x86_64.tar.gz"
      sha256 "48d0dd47575a709aecfb1c86e852bdc0174bc0c346e49479fbd4e6ddc32058b8"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
