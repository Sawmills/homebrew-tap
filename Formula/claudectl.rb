class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.38/claudectl_v0.1.38_Darwin_arm64.tar.gz"
      sha256 "5f24125f24feac8a31fc21bdb11ab121b93aaa8fe958a7df4b490f799643fbcf"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.38/claudectl_v0.1.38_Darwin_x86_64.tar.gz"
      sha256 "f0737cd6e4a632ea89b8b7f94156df1ba16cdadaa6625f5f7a89812176c47d11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.38/claudectl_v0.1.38_Linux_arm64.tar.gz"
      sha256 "c5f6f33ab1de94d83f58f2a4cf9ecea2216376c88f810aea94be0e62faab8b08"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.38/claudectl_v0.1.38_Linux_x86_64.tar.gz"
      sha256 "7f31a762772364e9cd4c11a64f8221856af5d66cf55292add1297ba948d3314d"
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
