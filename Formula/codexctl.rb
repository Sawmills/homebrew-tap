class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.47/codexctl_v0.1.47_Darwin_arm64.tar.gz"
      sha256 "a31308cefb6f0490712fc1f7f849d75d159487075319c5757368381f1bf80f28"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.47/codexctl_v0.1.47_Darwin_x86_64.tar.gz"
      sha256 "e5e3b97abf5e221e1778e92d4a286dda8a972ec8f7e4499b38da3c60b493de25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.47/codexctl_v0.1.47_Linux_arm64.tar.gz"
      sha256 "8f65272de6df8ce5edbed068691c76a0b7fc27a3958d8f88694a0b881a6ed964"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.47/codexctl_v0.1.47_Linux_x86_64.tar.gz"
      sha256 "438127a44988213352149d24997e75c82629aedd1d504b17ef36106f7aa1d4ad"
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
