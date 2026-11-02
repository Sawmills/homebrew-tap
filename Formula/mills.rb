class Mills < Formula
  desc "CLI for Mills Issues, Cases, Monitors and Knowledge, built for agents"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/mills-v0.2.0/mills_mills-v0.2.0_Darwin_arm64.tar.gz"
      sha256 "7ece749831b5c68692334b24aab67532f98d66fdaf8b4010ac1f429687c124ca"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/mills-v0.2.0/mills_mills-v0.2.0_Darwin_x86_64.tar.gz"
      sha256 "f1097956d23ff1ec3afe79974108468f2250f5c25571327b8503c1b36007d451"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/mills-v0.2.0/mills_mills-v0.2.0_Linux_arm64.tar.gz"
      sha256 "70439d04c338241c45c869b5cea984597a2deb4cdffb639f9e9cfbfd26ec6b03"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/mills-v0.2.0/mills_mills-v0.2.0_Linux_x86_64.tar.gz"
      sha256 "1fd2e9d9491a583c481fd2c4d77e8cbd3ab318283ff27e7801726ecc0c3b9d99"
    end
  end

  def install
    bin.install "mills"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mills --version")
  end
end
