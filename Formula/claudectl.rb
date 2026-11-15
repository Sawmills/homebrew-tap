class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.51/claudectl_v0.1.51_Darwin_arm64.tar.gz"
      sha256 "3ec8f487f9edddf9753b096e4a919a7f313b3f09c0b21e5b70fa73322fac3c2d"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.51/claudectl_v0.1.51_Darwin_x86_64.tar.gz"
      sha256 "d3774456259988c85d1198f30351d7f79d79a1f55b905bccdbad8e6e31535cac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.51/claudectl_v0.1.51_Linux_arm64.tar.gz"
      sha256 "9c505663a29be7bee030bb5120dee1d8f637baa02e5bcfc699811a85acf691b4"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.51/claudectl_v0.1.51_Linux_x86_64.tar.gz"
      sha256 "281efe916b27d0584ce59fdbb31a3e5918ec4dc556827115964d906a06ba6e7b"
    end
  end

  def install
    bin.install "claudectl"
    generate_completions_from_executable(bin/"claudectl", "completions")
  end

  test do
    help = shell_output("#{bin}/claudectl --help")
    assert_match "Usage:", help
    assert_match "claudectl", help
    assert_path_exists bash_completion/"claudectl"
    assert_path_exists zsh_completion/"_claudectl"
    assert_path_exists fish_completion/"claudectl.fish"
  end
end
