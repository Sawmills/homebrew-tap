class Mills < Formula
  desc "CLI for Mills Issues, Cases, Monitors and Knowledge, built for agents"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.3.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/mills-v0.3.0/mills_mills-v0.3.0_Darwin_arm64.tar.gz"
      sha256 "f05361081c05b20b138c311a805f000fcc4f039596b37fd5aa8d41ed68b53e83"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/mills-v0.3.0/mills_mills-v0.3.0_Darwin_x86_64.tar.gz"
      sha256 "aef1af2ad927cb04829e983361c251406ac238e095781facbbb68fea91f8ef03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/mills-v0.3.0/mills_mills-v0.3.0_Linux_arm64.tar.gz"
      sha256 "2b79ec816970f9644432a89e5acb960b7db1f1901d19aa691f06ab247c8533f3"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/mills-v0.3.0/mills_mills-v0.3.0_Linux_x86_64.tar.gz"
      sha256 "268934ed82769a8e43fef6e26f83e38cf6934278ed75c4178d6a842c492ae2f5"
    end
  end

  def install
    bin.install "mills"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mills --version")
  end
end
