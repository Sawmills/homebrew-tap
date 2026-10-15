class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.53/codexctl_v0.1.53_Darwin_arm64.tar.gz"
      sha256 "dbc56b6af54f80fe05f51fab736936be376757fd8240ab0186281e7f14eedd36"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.53/codexctl_v0.1.53_Darwin_x86_64.tar.gz"
      sha256 "025c848216762c5af1e37e499d13551c81f0ca5d581150ce678d62cfb80613ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.53/codexctl_v0.1.53_Linux_arm64.tar.gz"
      sha256 "17bda164c23efcd37e178660738c041994c1e34838105b8392067eb36b462c69"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.53/codexctl_v0.1.53_Linux_x86_64.tar.gz"
      sha256 "e88faa881e26cf18952fbb4a9c86feb33ac9b312a2dd7190634a4fe6a8cc8cdd"
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
