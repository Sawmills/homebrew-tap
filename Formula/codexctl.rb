class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.38/codexctl_v0.1.38_Darwin_arm64.tar.gz"
      sha256 "71b7f2c8b2f690cf1941257ad8b719bd37af3e59d1a2ae979443332aefb67efb"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.38/codexctl_v0.1.38_Darwin_x86_64.tar.gz"
      sha256 "50c4ef0cc8debab4d4a0fc011ed503d7ec731a5aa21f98be79068ea98e273e16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.38/codexctl_v0.1.38_Linux_arm64.tar.gz"
      sha256 "cb979b9e9f8428a70d38440c29f0fb5de6e8fbfb18878912fdf85296a271c329"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.38/codexctl_v0.1.38_Linux_x86_64.tar.gz"
      sha256 "9951b4dfa46b822eed8e009d7de4352363d68c1e4a73c21d661fe020ae09b51f"
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
