class SawmillsCsvcheck < Formula
  desc "Validate CSV files against Sawmills CSV enrichment processor rules"
  homepage "https://github.com/Sawmills/sawmills-collector/tree/main/processor/csvenrichmentprocessor"
  version "1.795.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v1.795.0/sawmills-csvcheck_v1.795.0_Darwin_arm64.tar.gz"
      sha256 "dc5512b6080ebb1131a4156e6479423beb73e5300bc961d16f33b1eb14ed9c1e"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v1.795.0/sawmills-csvcheck_v1.795.0_Darwin_x86_64.tar.gz"
      sha256 "d972184b58cc674d510f81c8b7681d4a0730aa6e0ec92ad31445e4ec957885a6"
    end
  end

  on_linux do
    on_intel do
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v1.795.0/sawmills-csvcheck_v1.795.0_Linux_x86_64.tar.gz"
      sha256 "e6022a08b84712a599db87dc9178d61f90dc96896b1239cca88c7aa081c2c062"
    end
  end

  def install
    bin.install "sawmills-csvcheck"
  end

  test do
    (testpath/"valid.csv").write <<~CSV
      service_name,team
      checkout,commerce
    CSV

    output = shell_output(
      "#{bin}/sawmills-csvcheck -file #{testpath}/valid.csv -lookup-key service_name",
    )
    assert_match "VALID: CSV matches csvenrichmentprocessor parsing rules", output
    assert_match version.to_s, shell_output("#{bin}/sawmills-csvcheck -version")
  end
end
