class HolyCors < Formula
  desc "Holy CORS! A fast CORS proxy for developers"
  homepage "https://github.com/bugdays-com/holy-cors"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.1.0/holy-cors-macos-arm64"
      sha256 "e7a3b68d5481f330522456ce60086a6548e9563d1be02468466eef8ab8a0d8c9"
    else
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.1.0/holy-cors-macos-x64"
      sha256 "e4475ce37498b1d5933796b0e52c27586c7bf571945d8d801c044ee498a71305"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "holy-cors-macos-arm64" : "holy-cors-macos-x64"
    bin.install binary_name => "holy-cors"
  end

  test do
    assert_match "holy-cors", shell_output("#{bin}/holy-cors --version")
  end
end
