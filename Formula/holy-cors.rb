class HolyCors < Formula
  desc "Local HTTP, gRPC, DNS, and TLS diagnostics bridge for Bug Days"
  homepage "https://github.com/bugdays-com/holy-cors"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.3.0/holy-cors-macos-arm64"
      sha256 "02e571d3a088390613f8731e030434cbc5944bb98edbcea1bfe86f9bd4262392"
    else
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.3.0/holy-cors-macos-x64"
      sha256 "0544abc0b356900c04db537d010cf6b93d0b206f9ade938735d81ce682360988"
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
