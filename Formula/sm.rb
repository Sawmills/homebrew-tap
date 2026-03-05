class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.11"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.11/sm_v0.2.11_Darwin_arm64.tar.gz"
      sha256 "3715b04d0ef020681dfa2a0758389d306de36d8c67a1966ff963b4caf3a2f4c6"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.11/sm_v0.2.11_Darwin_x86_64.tar.gz"
      sha256 "825bd17e39626b67921d26cc9bde8d1eab60c4b8b9c776e09b550b227b3476e9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.11/sm_v0.2.11_Linux_x86_64.tar.gz"
      sha256 "b93589fc9b0191fe551af01f7d56fcbeab7fbb493d1fc48752f1681abf540eb3"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
