class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.34/claudectl_v0.1.34_Darwin_arm64.tar.gz"
      sha256 "a040a08ad866af0fe62928198aeef43cb6c49c3e80eabb3ae538f2eb57604b3a"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.34/claudectl_v0.1.34_Darwin_x86_64.tar.gz"
      sha256 "a878a2d84302920d37b351d019e9e18cf95975e6b310e3287a6ea79c4c34a199"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.34/claudectl_v0.1.34_Linux_arm64.tar.gz"
      sha256 "ae21cc48cbf30bc2de4c5e7c9fd05da70caf618a7cec5038db5b0afb3c432e83"
    end
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.34/claudectl_v0.1.34_Linux_x86_64.tar.gz"
      sha256 "838ac46607d978f4bbb5232896834adce4da526b188233675cc345769f859deb"
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
