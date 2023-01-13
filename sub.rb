class Sub < Formula
  desc 'Organize groups of scripts into documented CLIs with subcommands'
  homepage 'https://github.com/juanibiapina/sub'
  url 'https://github.com/juanibiapina/sub/releases/download/v0.8.1/sub-v0.8.1-x86_64-apple-darwin.tar.gz'
  version 'v0.8.1'
  sha256 '1d7c8b7e08319492e319c93e638bc91ccbc8b58cd9ec78807eee1763a1f800f3'

  def install
    bin.install 'sub'
  end
end
