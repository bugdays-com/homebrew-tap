class HolyCors < Formula
  desc "Local HTTP, gRPC, Kafka, DNS, and TLS bridge for Bug Days"
  homepage "https://github.com/bugdays-com/holy-cors"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.4.5/holy-cors-macos-arm64"
      sha256 "cb3e75a8f8948ea7c1863631b897f242d44022b3814c7dd8235f9a39fd72239f"
    else
      url "https://github.com/bugdays-com/holy-cors/releases/download/v0.4.5/holy-cors-macos-x64"
      sha256 "b93809e0ae3843e28507aca3ea0e966e40e8e067b8b69f505aa2e6fc9c5d3437"
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
