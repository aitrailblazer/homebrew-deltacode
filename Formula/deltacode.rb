class Deltacode < Formula
  desc "Go-first structural code context and guarded function editing"
  homepage "https://github.com/aitrailblazer/homebrew-deltacode"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.2.0/deltacode_darwin_arm64.tar.gz"
      sha256 "5c71390719735ff989792f51bee47b0e34ecb0f749ac8228a7bf0c18c1edeecc"
    else
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.2.0/deltacode_darwin_amd64.tar.gz"
      sha256 "c8aba76ecf86ca98abc0fa2c1d78c695857e52ba02ee14926ce7541f13d71a45"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.2.0/deltacode_linux_arm64.tar.gz"
      sha256 "67f3f3cd46b95df523fa8b4376ec4cc7c78cc3c5495be5038c2bef70eef172e8"
    else
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.2.0/deltacode_linux_amd64.tar.gz"
      sha256 "25af72c5ee0e549bf046a00d9487b7f5d2cd3a9ba8cb0ec93dc26d3c5955edb2"
    end
  end
  def install
    bin.install "deltacode"
  end
  test do
    assert_equal version.to_s, shell_output("#{bin}/deltacode --version").strip
    (testpath/"sample.go").write "package sample\nfunc Target() int { return 7 }\nfunc Other() int { return 8 }\n"
    output = shell_output("#{bin}/deltacode slice -root #{testpath} -path sample.go -target Target")
    assert_match "return 7", output
    refute_match "return 8", output
  end
end
