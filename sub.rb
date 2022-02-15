class Sub < Formula
  desc 'Organize groups of scripts into documented CLIs with subcommands'
  homepage 'https://github.com/juanibiapina/sub'
  url 'https://github.com/juanibiapina/sub/releases/download/v0.7.0/sub-v0.7.0-x86_64-apple-darwin.tar.gz'
  version 'v0.7.0'
  sha256 'ef96faec1a9722d065b45f86e82922d2ee476ab1e15b501154a11e7f0c7810f6'
  def install
    bin.install 'sub'
  end
end
