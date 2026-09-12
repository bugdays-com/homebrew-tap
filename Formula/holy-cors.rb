class HolyCors < Formula
  desc "Local HTTP and native gRPC bridge for Bug Days"
  homepage "https://github.com/bugdays-com/holy-cors"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.2.0/holy-cors-macos-arm64"
      sha256 "f4c3c9414b21ddb26e43a64e368b44b4004d3e1261633b803cc89ae9c7bc6fe5"
    else
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.2.0/holy-cors-macos-x64"
      sha256 "2d866db77858ea5ccebdccfb7430792b40432717d2113584a579ff6d7b85365d"
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
