class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.29/codexctl_v0.1.29_Darwin_arm64.tar.gz"
      sha256 "8e5dd8f52d054df6d823209b756e0c66d314db6f80442d8252841dbc7255c371"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.29/codexctl_v0.1.29_Darwin_x86_64.tar.gz"
      sha256 "13df347a9926d6702aa449dae00548a0bc4bfe69c529eb0b3c332fbd73508644"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.29/codexctl_v0.1.29_Linux_x86_64.tar.gz"
      sha256 "f210c4364fcbab4bfdbb80a8c089afa9ed69ffb0c127ba8249f0eedd767383fd"
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
