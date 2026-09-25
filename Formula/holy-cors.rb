class HolyCors < Formula
  desc "Local HTTP, gRPC, Kafka, DNS, and TLS bridge for Bug Days"
  homepage "https://github.com/bugdays-com/holy-cors"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.4.3/holy-cors-macos-arm64"
      sha256 "1cdbaa7e1cef5682f51f65ac0257f495ac86f04284e2c6c6557565813f96c3c1"
    else
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.4.3/holy-cors-macos-x64"
      sha256 "69308e6db6a6bdc7d21135dc885c5e1ea6644ba0093639b47c75a5cc195108e5"
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
