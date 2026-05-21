class Modfetch < Formula
  desc "Fast, resilient downloads for AI models"
  homepage "https://github.com/jxwalker/modfetch"
  license "MIT"

  release = "v0.9.0"

  if OS.mac?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_darwin_universal",
        using: :nounzip
    sha256 "61f8f180f41b1fdd2e5eee5edd3edda5a2b668f1312db9a9fa6b910e97c1a489"
  elsif Hardware::CPU.arm?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_arm64",
        using: :nounzip
    sha256 "5e6859b2eda89063304dccbf2ffeebaf8dd0d69c58cd7f65a03b4d4eb0aaac98"
  else
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_amd64",
        using: :nounzip
    sha256 "7e9854541455317e7db188a43b5df78f4b1f633cb3cd14c4b5ef39984d2ec27c"
  end

  def install
    bin.install cached_download => "modfetch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modfetch version")
  end
end
