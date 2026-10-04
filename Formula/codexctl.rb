class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.41/codexctl_v0.1.41_Darwin_arm64.tar.gz"
      sha256 "ba6dbc4ee483e8fcff50c690320e34b10f00deb2c752a1fe2fa21d46ca5e31c8"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.41/codexctl_v0.1.41_Darwin_x86_64.tar.gz"
      sha256 "f5c88530fb088d93f5d7a3826736f387baf5a97c8ea47bb4f630c3f7b33e8eea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.41/codexctl_v0.1.41_Linux_arm64.tar.gz"
      sha256 "9b0a2cdeddd94ce098e5bec42790cfd6edb9cfb99670d0ca705d1c4c609a3792"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.41/codexctl_v0.1.41_Linux_x86_64.tar.gz"
      sha256 "3e57e1b2b9fae195120d538b225afedbf5ee3ffe5f4b686a1c14cc43cb043ab6"
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
