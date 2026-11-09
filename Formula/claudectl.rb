class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.44/claudectl_v0.1.44_Darwin_arm64.tar.gz"
      sha256 "24b477acb41848f1fc09e001d7768614ffcb4082c57b70723cf3b26dbccf28af"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.44/claudectl_v0.1.44_Darwin_x86_64.tar.gz"
      sha256 "6fea30f5e5e0282718c0afdee6198e2dd50ca9ac71a24535cafb8cd4fc876983"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.44/claudectl_v0.1.44_Linux_arm64.tar.gz"
      sha256 "17f0a3fb988dfbb2ac8688c66c282c784b6f2bd79babb75debc47cb81b08f17b"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.44/claudectl_v0.1.44_Linux_x86_64.tar.gz"
      sha256 "fb4029bdcd949145ef52d433fecfc23980401aad9d81557d4ce05cc9601e5913"
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
