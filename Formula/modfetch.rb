class Modfetch < Formula
  desc "Fast, resilient downloads for AI models"
  homepage "https://github.com/jxwalker/modfetch"
  license "MIT"

  release = "v0.7.1"

  if OS.mac?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_darwin_universal",
        using: :nounzip
    sha256 "a73944d38cb17ded5b78fa9de11ac3ba3922e934ebcc809c160c6cb82428449e"
  elsif Hardware::CPU.arm?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_arm64",
        using: :nounzip
    sha256 "893e51802932381bc14d472d94002813c491c5170f14e50573e0b30cf873c868"
  else
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_amd64",
        using: :nounzip
    sha256 "c7db15650986c32cf4b1550699e624a929e21b926194a2523896fbacec95276c"
  end

  def install
    bin.install cached_download => "modfetch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modfetch version")
  end
end
