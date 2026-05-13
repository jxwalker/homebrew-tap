class Modfetch < Formula
  desc "Fast, resilient downloads for AI models"
  homepage "https://github.com/jxwalker/modfetch"
  license "MIT"

  release = "v0.8.0"

  if OS.mac?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_darwin_universal",
        using: :nounzip
    sha256 "947f728f2c1708d67719673ec41364a212cf88a21eb7b980e3e3a11395141fde"
  elsif Hardware::CPU.arm?
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_arm64",
        using: :nounzip
    sha256 "063f70619266d9a89ebf9178f412a50ae757977f9615d1fb8c3faa2e6771e150"
  else
    url "https://github.com/jxwalker/modfetch/releases/download/#{release}/modfetch_linux_amd64",
        using: :nounzip
    sha256 "a7bbfb6ce482b91ab1a93eb3b3aa9618b1e61b943e078bf84befc0e3114c5e2a"
  end

  def install
    bin.install cached_download => "modfetch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modfetch version")
  end
end
