class Modfetch < Formula
  desc "Fast, resilient downloads for AI models"
  homepage "https://github.com/jxwalker/modfetch"
  license "MIT"

  release = "v0.8.1"

  if OS.mac?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_darwin_universal",
        using: :nounzip
    sha256 "7edf759efc8c5982147d2213acc6b0139c9cc67b2f81f10eb3ad2e698a43e73f"
  elsif Hardware::CPU.arm?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_arm64",
        using: :nounzip
    sha256 "a8de023093967cc6b5c6c6ac61faddb687bc6d1eb6635bb1163f79fbd5cb83d7"
  else
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_amd64",
        using: :nounzip
    sha256 "09f8bede51811fa5e4e61a5437b2654058ef96f0ee6db231178d03186e8f9201"
  end

  def install
    bin.install cached_download => "modfetch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modfetch version")
  end
end
