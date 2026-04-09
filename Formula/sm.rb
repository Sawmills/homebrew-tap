class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.6.4"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.4/sm_v0.6.4_Darwin_arm64.tar.gz"
      sha256 "ac3cf1e4b3b4c9c966ee14825081c339687cf2a1832961a9376023bc6158be47"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.4/sm_v0.6.4_Darwin_x86_64.tar.gz"
      sha256 "c23127853366f8e460dc9a90c0fd70b64ef5f64f42d7e37b46918ff87b1251cf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.4/sm_v0.6.4_Linux_x86_64.tar.gz"
      sha256 "fa8bea2710e671d43f0940a5f894f792f6101d50bdd0e53cd424ebea42193bc2"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
