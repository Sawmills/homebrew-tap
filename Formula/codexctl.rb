class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.61/codexctl_v0.1.61_Darwin_arm64.tar.gz"
      sha256 "857daa4a96f69f385c9053084aeb7e6b77d4ea309c59aa07868934e2c45f5853"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.61/codexctl_v0.1.61_Darwin_x86_64.tar.gz"
      sha256 "91c41799fdaf9d72af59a02a4112577a45e066d500c44ca953a5e35e6142c66f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.61/codexctl_v0.1.61_Linux_arm64.tar.gz"
      sha256 "f5a1a6ac3fd6fb22c88829743337576f08a0bfd514f0ce84ec6c328f680fd8c7"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.61/codexctl_v0.1.61_Linux_x86_64.tar.gz"
      sha256 "847a804c41cec4e853be260d2472d688cd38a3bba25916a488a64e1b2d68ca09"
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
