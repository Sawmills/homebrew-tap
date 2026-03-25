class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.4"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.4/sm_v0.5.4_Darwin_arm64.tar.gz"
      sha256 "4b1052ccb977f221dd0e6c41a4b5adfd28c333cbb9b847a1cf2eb7e017f5f4f6"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.4/sm_v0.5.4_Darwin_x86_64.tar.gz"
      sha256 "08868470b0392964a6345d46d6b3fee1da42e48c3127251baf07ec9315a90393"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.4/sm_v0.5.4_Linux_x86_64.tar.gz"
      sha256 "7d25f43a11054b0fe1c7b06c711e256c49a217ca377e5fe6d4e591551179e45f"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
