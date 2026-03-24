class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.1/sm_v0.5.1_Darwin_arm64.tar.gz"
      sha256 "54e3cfac93b31f1a38a204bc543d128878b8b6bfacb28cb52f82a48f36d26de4"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.1/sm_v0.5.1_Darwin_x86_64.tar.gz"
      sha256 "285f80eacf1561b3bcffa9382382730b256b605dccc7adf2a86ba9868af05daa"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.1/sm_v0.5.1_Linux_x86_64.tar.gz"
      sha256 "0a36085b219fe1cd42d20c73860e73b65d647ada97446e7b74f21ef3ccb55789"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
