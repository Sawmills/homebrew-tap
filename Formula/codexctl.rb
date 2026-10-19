class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.60/codexctl_v0.1.60_Darwin_arm64.tar.gz"
      sha256 "b91440ea40c24837906900b7b4b9be52b28536972d2b11db544e46d38e0a60a6"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.60/codexctl_v0.1.60_Darwin_x86_64.tar.gz"
      sha256 "03f4fcf33f7523eec0d334b905d250196cb17e960df6648be4ba3c8a5b4ec753"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.60/codexctl_v0.1.60_Linux_arm64.tar.gz"
      sha256 "0a8f9531014779abd17bd444ff3dd5ef1f2a5c9d08015ce01180e7d712269d71"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.60/codexctl_v0.1.60_Linux_x86_64.tar.gz"
      sha256 "393fa37acf091fe2a9ed063268d1cec9b1905773b151c364876da014169be0e2"
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
