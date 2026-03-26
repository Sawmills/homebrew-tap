class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.10"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.10/sm_v0.5.10_Darwin_arm64.tar.gz"
      sha256 "305ed704ed1f1f6415c608b811cd4afb1d73008c3484f994236b0cfe4d6ff933"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.10/sm_v0.5.10_Darwin_x86_64.tar.gz"
      sha256 "4037ba33590856a8f20a9802e2d48a4e7e6c95c72db3d346f79a4190f51d84bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.10/sm_v0.5.10_Linux_x86_64.tar.gz"
      sha256 "df417f295b885d4f028c2f9e065ace4628ca5c7dee38bb8325f8dd2e447785b7"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
