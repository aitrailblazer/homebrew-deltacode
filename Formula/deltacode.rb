class Deltacode < Formula
  desc "Go-first structural code context and guarded function editing"
  homepage "https://github.com/aitrailblazer/homebrew-deltacode"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.1.0/deltacode_darwin_arm64.tar.gz"
      sha256 "ccaba13de61fd5aabbadd6b5f089f1b4c8ff7547e3d187ebdfdc399a95884ead"
    else
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.1.0/deltacode_darwin_amd64.tar.gz"
      sha256 "29e7c5f55f3ed5b1c74b9339aa51a43f1dad0259335bb82b8de8736c72cfac08"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.1.0/deltacode_linux_arm64.tar.gz"
      sha256 "123a79bf9f67f72f58029d1a6f0d50173deac85dad5e04486ff85d176716a582"
    else
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.1.0/deltacode_linux_amd64.tar.gz"
      sha256 "f2694bd0abb9eea4df5143da7c6f4eb9928d17aa8cc76a4cdfc6694a23cf6e62"
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
