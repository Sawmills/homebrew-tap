class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.46/codexctl_v0.1.46_Darwin_arm64.tar.gz"
      sha256 "40336b4774db8a4c07a796b7951db01a9be6b8298b0e7cd802392b44a1e91e00"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.46/codexctl_v0.1.46_Darwin_x86_64.tar.gz"
      sha256 "3d55c6140a3adfa0edfefddba79a7a7cd905c0731e973946c7ffbb9e13a3e145"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.46/codexctl_v0.1.46_Linux_arm64.tar.gz"
      sha256 "d790b9520c662747225dd0ea66adff031905b8740d6617faa173d1d5ddbe1bf1"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.46/codexctl_v0.1.46_Linux_x86_64.tar.gz"
      sha256 "9e12b55a6d04ee9d486789bf82162ad5271d308f096b609dea876bb0f4a1351f"
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
