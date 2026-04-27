class Modfetch < Formula
  desc "Fast, resilient downloads for AI models"
  homepage "https://github.com/jxwalker/modfetch"
  license "MIT"

  release = "v0.6.3"

  if OS.mac?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_darwin_universal",
        using: :nounzip
    sha256 "ff4e35e1a7f548e7ccaef411c347f6398f31441a4bab5f0d4730c88d876fa2de"
  elsif Hardware::CPU.arm?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_arm64",
        using: :nounzip
    sha256 "b91fccb4eeaa268477a1c09330abeeece5672eda47ce3fe94ae2050f8da3677e"
  else
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_amd64",
        using: :nounzip
    sha256 "405ec8b53d0aeecc1117956300bc83e5f782fd37042b9f57822e03f9ae32f1e4"
  end

  def install
    bin.install cached_download => "modfetch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modfetch version")
  end
end
