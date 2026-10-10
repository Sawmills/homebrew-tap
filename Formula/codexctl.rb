class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.50/codexctl_v0.1.50_Darwin_arm64.tar.gz"
      sha256 "470a9dc2a542d54abe2126d32bc5cbe2d0279a31f09d0bf0cd341965bda21b7f"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.50/codexctl_v0.1.50_Darwin_x86_64.tar.gz"
      sha256 "f4e74d436baa33c1dd2526fcc0fe60fe2f38108db97e65fea414a7795558ef88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.50/codexctl_v0.1.50_Linux_arm64.tar.gz"
      sha256 "cf50e2135adae3f448f307c4deefa50e88fcd50235caf8b3acb2188f96ce972b"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.50/codexctl_v0.1.50_Linux_x86_64.tar.gz"
      sha256 "23967c101ef8815d0a97a30d7aa223e882ddeccd868bcae3c28f59dd4cc836b9"
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
