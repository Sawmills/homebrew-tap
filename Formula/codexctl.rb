class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.28/codexctl_v0.1.28_Darwin_arm64.tar.gz"
      sha256 "1a91838b4ce0897ecc315e4e20ff0cab1c1584d1b501ed87d64c7dde20fbb1df"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.28/codexctl_v0.1.28_Darwin_x86_64.tar.gz"
      sha256 "87d4e3bc9b3be360bbd531878213736f9f032c0f802a4a5914668d93050c39b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.28/codexctl_v0.1.28_Linux_x86_64.tar.gz"
      sha256 "28198b917ca9b21d993f5aabeff9cb6a821ec37eb1c1acd35bfa16c6d86e9923"
    end
  end

  def install
    bin.install "codexctl", "codexctl-central"
    generate_completions_from_executable(bin/"codexctl", "completions")
  end

  test do
    help = shell_output("#{bin}/codexctl --help")
    assert_match "Usage:", help
    assert_match "codexctl", help
    server_help = shell_output("#{bin}/codexctl-central --help")
    assert_match "Serve the account API", server_help
    assert_path_exists bash_completion/"codexctl"
    assert_path_exists zsh_completion/"_codexctl"
    assert_path_exists fish_completion/"codexctl.fish"
  end
end
