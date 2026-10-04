class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.37/codexctl_v0.1.37_Darwin_arm64.tar.gz"
      sha256 "7f968c1a9ba0aa0b5dd5999e859b9dfb018d159f79af0cafd223f05f3eced28f"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.37/codexctl_v0.1.37_Darwin_x86_64.tar.gz"
      sha256 "c4083ba29873a6ed14edab1a36fd7ba90f873ec57bebf4c56d77b71a567e0b23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.37/codexctl_v0.1.37_Linux_arm64.tar.gz"
      sha256 "f28da89f6e3035c48cb46652d0ad4837a1440604140b95c941dee303c248c8d3"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.37/codexctl_v0.1.37_Linux_x86_64.tar.gz"
      sha256 "006a13339feb5a6a9c706030f9defe3d49f52f745593e770f63078dffaedd371"
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
