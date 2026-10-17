class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.30/claudectl_v0.1.30_Darwin_arm64.tar.gz"
      sha256 "122ea88a4dc0c4b5156eeb856999ac5b3b6389738d118ae3e078f32c62dd8f80"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.30/claudectl_v0.1.30_Darwin_x86_64.tar.gz"
      sha256 "a4ceab851b1624b29dba005a3ba8ff9bc589fc26a0a9096d6420d36ee8d7e100"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.30/claudectl_v0.1.30_Linux_x86_64.tar.gz"
      sha256 "00c34bcd0462aa58c572e3fb88b2d6dbc35e3e2112149c9ab29fdc27dcce6060"
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
