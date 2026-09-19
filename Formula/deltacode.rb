class Deltacode < Formula
  desc "Go-first structural code context and guarded function editing"
  homepage "https://github.com/aitrailblazer/homebrew-deltacode"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.0.2/deltacode_darwin_arm64.tar.gz"
      sha256 "143f9b5241d1c5132cf8a70bcc9e0a7dbafe4d403d9aa00e1c2ec92a92a5a605"
    else
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.0.2/deltacode_darwin_amd64.tar.gz"
      sha256 "2e8ab9732f9b39de8f078a1f981ba25912b5923cccae7d2d6a1d666b0f98f069"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.0.2/deltacode_linux_arm64.tar.gz"
      sha256 "5897bf933f6a777a8fffb34b4adae4ad30263ea4e20f464fde9ec50d5a6e8ce8"
    else
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.0.2/deltacode_linux_amd64.tar.gz"
      sha256 "eb55897894e6ed77a2956e807c6b810b4790d832edab9dd8bad5d76052cf2aef"
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
