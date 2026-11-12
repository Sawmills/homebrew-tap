class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.48-rc1/claudectl_v0.1.48-rc1_Darwin_arm64.tar.gz"
      sha256 "e68523c520bdbccdf7da4b7e170e095a1a5d7c9121a77c9a0751ed7082fa7623"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.48-rc1/claudectl_v0.1.48-rc1_Darwin_x86_64.tar.gz"
      sha256 "93a2f47687c1842478184051b4632d862f2fdb9f2e7373783a32c2a5881dc2d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.48-rc1/claudectl_v0.1.48-rc1_Linux_arm64.tar.gz"
      sha256 "3ef96a56557b456292b21b2b9ded495aa2775698723066877027e74fb59ea866"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.48-rc1/claudectl_v0.1.48-rc1_Linux_x86_64.tar.gz"
      sha256 "3adc2e0e8ae792b54e9d13af10caa729f90cda15c2571e8dfc0a80d77decfff4"
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
