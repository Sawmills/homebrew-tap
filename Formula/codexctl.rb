class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.42/codexctl_v0.1.42_Darwin_arm64.tar.gz"
      sha256 "5b1a093a8b58ee8a182634ff6e049e79322562d8672ded274c45e49b97e468ab"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.42/codexctl_v0.1.42_Darwin_x86_64.tar.gz"
      sha256 "22b40243013a982d9a6739068d8fa6d1c2763fcef4bcccb023fd42752e62ea8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.42/codexctl_v0.1.42_Linux_arm64.tar.gz"
      sha256 "538cee97106de837a90ddcd0de777c261e4adce5c6c8b87ef78ecda705ebc663"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.42/codexctl_v0.1.42_Linux_x86_64.tar.gz"
      sha256 "bbd90be78671245e424cc02c60c21703aa14adcd5b05ae7314195b88520ed1b1"
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
