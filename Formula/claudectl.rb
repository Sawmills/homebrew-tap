class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.41/claudectl_v0.1.41_Darwin_arm64.tar.gz"
      sha256 "348bc2243a8836344cbb8896df2ec1f4079b0de90fa5cf1716a504aea2b33a8e"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.41/claudectl_v0.1.41_Darwin_x86_64.tar.gz"
      sha256 "773a5914ab709a3da4f79e0991b436aacc2ee4dc5e119c9457662f4803ace31a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.41/claudectl_v0.1.41_Linux_arm64.tar.gz"
      sha256 "2f78845aadcaf3a5637cd4980e7b5fa998d0f475d63087d3981151094c41b5b1"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.41/claudectl_v0.1.41_Linux_x86_64.tar.gz"
      sha256 "0fb24559b7744468fcf2316ba4fd9840b51cafa92f4fcbef5570c8b270d0cc8d"
    end
  end

  def install
    bin.install "claudectl"
    generate_completions_from_executable(bin/"claudectl", "completions")
  end

  test do
    help = shell_output("#{bin}/claudectl --help")
    assert_match "Usage:", help
    assert_match "claudectl", help
    assert_path_exists bash_completion/"claudectl"
    assert_path_exists zsh_completion/"_claudectl"
    assert_path_exists fish_completion/"claudectl.fish"
  end
end
