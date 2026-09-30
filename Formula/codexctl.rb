class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.27/codexctl_v0.1.27_Darwin_arm64.tar.gz"
      sha256 "8e4e85f7a80cd9e483c3f478de875206a700fc4e587028798329f2a38cbbce0f"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.27/codexctl_v0.1.27_Darwin_x86_64.tar.gz"
      sha256 "1f85ce26f648a0b9bcb376b5ab0b1b6203616f74acb017fb308ab06e4db66213"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.27/codexctl_v0.1.27_Linux_x86_64.tar.gz"
      sha256 "8b450a79193ab24e0cff73fc8e7ff944cc03884c4e70e62178ef804dee96cf7e"
    end
  end

  def install
    bin.install "codexctl"
    generate_completions_from_executable(bin/"codexctl", "completions")
  end

  test do
    help = shell_output("#{bin}/codexctl --help")
    assert_match "Usage:", help
    assert_match "codexctl", help
    assert_path_exists bash_completion/"codexctl"
    assert_path_exists zsh_completion/"_codexctl"
    assert_path_exists fish_completion/"codexctl.fish"
  end
end
