class HolyCors < Formula
  desc "Local HTTP and native gRPC bridge for Bug Days"
  homepage "https://github.com/bugdays-com/holy-cors"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.2.1/holy-cors-macos-arm64"
      sha256 "95df5e4c4e1eacaaed4199ebcef2f98015469ab46021d00ea24984a19b8eb073"
    else
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.2.1/holy-cors-macos-x64"
      sha256 "4819897bd137219a012f82a7f82b7b641f99e5c361f30c44574352f6de0ff0da"
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
