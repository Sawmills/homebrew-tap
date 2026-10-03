class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.36/codexctl_v0.1.36_Darwin_arm64.tar.gz"
      sha256 "b5e9ebeae3757e3186102b67d5d3c6dccee170ec9c9707fd9f8322fc8aed1e60"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.36/codexctl_v0.1.36_Darwin_x86_64.tar.gz"
      sha256 "13abb38097bd0ef097e3be7f11333c82acf3beb8dfe100b25a9f0c9b03352560"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.36/codexctl_v0.1.36_Linux_arm64.tar.gz"
      sha256 "d457dc22e92fa9b415a7c9a18e6e82cf0c545506b71eaff7eb500f84c7f47865"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.36/codexctl_v0.1.36_Linux_x86_64.tar.gz"
      sha256 "075cc5acd20ba74dd678e3c2848122d11ce3f3fb465d30e39963fa09ea2e6b39"
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
