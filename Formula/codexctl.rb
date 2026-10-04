class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.39/codexctl_v0.1.39_Darwin_arm64.tar.gz"
      sha256 "11d0317d5cca9ad2e27d57196e87835048a3748624eb465cf284e0c3a7ed4e44"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.39/codexctl_v0.1.39_Darwin_x86_64.tar.gz"
      sha256 "198ffc0c0727fa4aa82121b7651726bcdc3311c80f3663a9d9e077579fe67a5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.39/codexctl_v0.1.39_Linux_arm64.tar.gz"
      sha256 "1f23d0dd42e50f3a89032ec8af1bb5ce82f83b19b82893c18fd6761e7a957207"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.39/codexctl_v0.1.39_Linux_x86_64.tar.gz"
      sha256 "b57c8e7d864395fdb3b8a362dd8d45148d99f6e97b409876aae2992c65a64baa"
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
