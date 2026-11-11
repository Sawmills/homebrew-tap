class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.46/claudectl_v0.1.46_Darwin_arm64.tar.gz"
      sha256 "1b61fee841db79fc3ed4022a9d3ac78362a891916c07ea98fc240933b946fdd3"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.46/claudectl_v0.1.46_Darwin_x86_64.tar.gz"
      sha256 "752f53095d2c229a5c9e58922c1708d7a8c1ce47504a48d521172e02e1793a72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.46/claudectl_v0.1.46_Linux_arm64.tar.gz"
      sha256 "694a64bb85b5d4e97fdfb4d41c0f348aab1d113fc9928dddf9bfb2269ae43c49"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.46/claudectl_v0.1.46_Linux_x86_64.tar.gz"
      sha256 "f7fdf07f9039396db4d36e72db95cd57718a7cdadbf7a66ae330e57926599699"
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
