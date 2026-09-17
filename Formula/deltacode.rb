class Deltacode < Formula
  desc "Sub-millisecond AST context slicing & token optimization engine for AI coding"
  homepage "https://platform.aitrailblazer.com"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.0.0/deltacode_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.0.0/deltacode_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.0.0/deltacode_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/aitrailblazer/homebrew-deltacode/releases/download/v1.0.0/deltacode_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "deltacode"
  end

  test do
    assert_match "deltacode", shell_output("#{bin}/deltacode --version")
  end
end
