class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.33/claudectl_v0.1.33_Darwin_arm64.tar.gz"
      sha256 "0fbcc976022e6f5dd84b47ed729b8c8f27d39005016c8dc52d5814c3e9be0206"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.33/claudectl_v0.1.33_Darwin_x86_64.tar.gz"
      sha256 "1d9b688ceda93e41d58983bf6d9398ef7cc6aec87ef7ed853746979a0d91d3e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.33/claudectl_v0.1.33_Linux_x86_64.tar.gz"
      sha256 "6f3ef1a924505edfc85bb43879bba6cf8937f319e4a755724cf3cd849abde88d"
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
