class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.4/claudectl_v0.1.4_Darwin_arm64.tar.gz"
      sha256 "10aa6444b908c4f41294cd00a4e4a5aaea611e674920cbd70e8b070d673579d8"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.4/claudectl_v0.1.4_Darwin_x86_64.tar.gz"
      sha256 "93544c7b762cfd176ff5b01e95386a7eaab0346ff7855dac332b893b0c9d3311"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.4/claudectl_v0.1.4_Linux_x86_64.tar.gz"
      sha256 "50850be89bdf7c261f2562dc926ae45fa4fb339be10e60bfe2eedbd8a4c53d80"
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
