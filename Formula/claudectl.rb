class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.40/claudectl_v0.1.40_Darwin_arm64.tar.gz"
      sha256 "a1ca0c29858fa7d99b70c83709316edd881f74352e7a61bf756cbf9c9ab5be6d"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.40/claudectl_v0.1.40_Darwin_x86_64.tar.gz"
      sha256 "d75bc16369a088bee9006c8c5cdd1e11cc4b6dfe2ce747af87b13447a71ad6bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.40/claudectl_v0.1.40_Linux_arm64.tar.gz"
      sha256 "5dc2d4f3a15d240c80afbb0d030cc5dd0f86da45055f08de36c4903832852936"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.40/claudectl_v0.1.40_Linux_x86_64.tar.gz"
      sha256 "98a22bfa896ea4e065ee00d5dff693c0211823a60ead3eda3b59234113fa11ae"
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
