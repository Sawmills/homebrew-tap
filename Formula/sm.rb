class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.6.6"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.6/sm_v0.6.6_Darwin_arm64.tar.gz"
      sha256 "43c9357be3d6cfb979af53e752a7eff15756ecc969970bf6d77d4f928354ece6"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.6/sm_v0.6.6_Darwin_x86_64.tar.gz"
      sha256 "d72dd293cbb3358b2c459b8915b01fa07eb3fe3e4e03940858362e362093b646"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.6/sm_v0.6.6_Linux_x86_64.tar.gz"
      sha256 "18e1707f974b5f549ae0ca366c700b4de60f78110b52c5afb00e7935ad0018b6"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
