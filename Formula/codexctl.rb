class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.54/codexctl_v0.1.54_Darwin_arm64.tar.gz"
      sha256 "24c8b97ade0fca3a7e639dae36358f9d57108be482806f59c581bb08166ea237"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.54/codexctl_v0.1.54_Darwin_x86_64.tar.gz"
      sha256 "394ac5170ddd5373e6aee1dab0fb52c9d5dee0319be7effae71cf81c88cebb6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.54/codexctl_v0.1.54_Linux_arm64.tar.gz"
      sha256 "c2a7f9c4c669ead5a2fc1fb5d782b324e97fc429268353219c4a312a305bdf7c"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.54/codexctl_v0.1.54_Linux_x86_64.tar.gz"
      sha256 "ff48e9aaf62088a0f53fa628d65d1d5e42c6ca3efe44242d75dfaf634ebbb48c"
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
