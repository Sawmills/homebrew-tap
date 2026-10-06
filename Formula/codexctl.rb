class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.45/codexctl_v0.1.45_Darwin_arm64.tar.gz"
      sha256 "f13cb87b7e41d6b2471d2558b0e82380ccabffd8e502f6c10e0376c4dcc08a4e"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.45/codexctl_v0.1.45_Darwin_x86_64.tar.gz"
      sha256 "60b503921e507f0305624a17813c40104d670427109165ab040ec6a9fd56d624"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.45/codexctl_v0.1.45_Linux_arm64.tar.gz"
      sha256 "1084c9f64a1945deb8e1c897b75993d85969244d49ca825af6f43324abb62c36"
    end
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.45/codexctl_v0.1.45_Linux_x86_64.tar.gz"
      sha256 "06b6f8caf1862dfaffe67eada4fbf6215057ed9736025119062dd88d1e8a5f45"
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
