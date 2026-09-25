class HolyCors < Formula
  desc "Local HTTP, gRPC, Kafka, DNS, and TLS bridge for Bug Days"
  homepage "https://github.com/bugdays-com/holy-cors"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.4.4/holy-cors-macos-arm64"
      sha256 "8931a960d8a2ce9df12c726382c5376fd10e4b32b8ec84e63c5e1a1c72e96877"
    else
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.4.4/holy-cors-macos-x64"
      sha256 "a43dd135fc2fbd30de4159abe10054f8926376943e80861eef33006024fc9aa5"
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
