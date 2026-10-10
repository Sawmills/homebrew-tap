class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.48/codexctl_v0.1.48_Darwin_arm64.tar.gz"
      sha256 "1ea2874c26f9ee4b3337c589cbb2713523eec741fdd8595efc971af193157f28"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.48/codexctl_v0.1.48_Darwin_x86_64.tar.gz"
      sha256 "6977820df84f174af49884e52fbf7eac1a390d644344ff799471c07b9bdd2915"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.48/codexctl_v0.1.48_Linux_arm64.tar.gz"
      sha256 "47c3b36be96f8aed2982abfd0ebfd6672de17a1e69bc03f9176fb78da7a4b396"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.48/codexctl_v0.1.48_Linux_x86_64.tar.gz"
      sha256 "156f7d4d8154aad594ea3c751b578a390294adb11fc64a7eb7ba805ae2f9ce6a"
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
