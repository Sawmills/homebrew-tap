class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/sawmills-cli/releases/download/v0.2.3/sm_v0.2.3_Darwin_arm64.tar.gz"
      sha256 "193044e639cd8be529ffedbd576591902e9dbd27f22cf0357042e45c8779f98f"
    else
      url "https://github.com/Sawmills/sawmills-cli/releases/download/v0.2.3/sm_v0.2.3_Darwin_x86_64.tar.gz"
      sha256 "3cf760d160d3551cff0ee3adabf9ce6b9c324b247d284ec074788300000ea0cf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Sawmills/sawmills-cli/releases/download/v0.2.3/sm_v0.2.3_Linux_x86_64.tar.gz"
      sha256 "b59941467c67b1c0b886a76ee59374dfa4ae39e345df2081998a85827aff9782"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
