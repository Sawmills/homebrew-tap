class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.42/claudectl_v0.1.42_Darwin_arm64.tar.gz"
      sha256 "00e614cdef1e0c5598bf11eefdbe26e417809e4e1ade5c68d37a714515d06056"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.42/claudectl_v0.1.42_Darwin_x86_64.tar.gz"
      sha256 "93e3f6f38bd7e69b41e069143890c207df360ce8ced584c9adac4f07a2dc5827"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.42/claudectl_v0.1.42_Linux_arm64.tar.gz"
      sha256 "8ce0bf27b49fa9af57f1ccb07478b806f273d4953071884f10f42bb6a8bd7344"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.42/claudectl_v0.1.42_Linux_x86_64.tar.gz"
      sha256 "9ccc0123675a4c9621515581de51ba415dc9ccf8674dec7fe4f2db1754ad838a"
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
