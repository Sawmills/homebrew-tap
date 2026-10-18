class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.58/codexctl_v0.1.58_Darwin_arm64.tar.gz"
      sha256 "9c7eb236a9d09b5cbef3ccccb0843ec8bf702e5a8900bf52c6120d0123e94054"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.58/codexctl_v0.1.58_Darwin_x86_64.tar.gz"
      sha256 "f75aa518a1380db6543d6ec71c1b10007ae62c57f4b8014b0fee5b4624f0db7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.58/codexctl_v0.1.58_Linux_arm64.tar.gz"
      sha256 "9b7dba3b40a4cf40a5604162900c0f518d5967a1fceba79e698f5f40be589104"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.58/codexctl_v0.1.58_Linux_x86_64.tar.gz"
      sha256 "5b9ecb3cfbe51a3477a74e9593345ea90eac5a6003d709deebb4fcc107fa356e"
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
