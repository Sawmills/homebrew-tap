class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.10.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.10.0/sm_v0.10.0_Darwin_arm64.tar.gz"
      sha256 "f581fe1471062d8ac19269aee7f3efae7eca4c50cb90ed5cf309199b12fe0ea0"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.10.0/sm_v0.10.0_Darwin_x86_64.tar.gz"
      sha256 "1481c39db8735a8551e82c5e8e968935537cb2dae83eee4e978c8198fd7087f8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.10.0/sm_v0.10.0_Linux_x86_64.tar.gz"
      sha256 "50d1577f2a625d7c2e1fc49b93a23834dadc699a7beb320424571c3dd4b9e794"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
