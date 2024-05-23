class Sub < Formula
  desc 'Organize groups of scripts into documented CLIs with subcommands'
  homepage 'https://github.com/juanibiapina/sub'
  url 'https://github.com/juanibiapina/sub/releases/download/v2.0.0/sub-v2.0.0-aarch64-apple-darwin.tar.gz'
  version 'v2.0.0'
  sha256 'a9c2200663cb42054af67c283c36acfea4f94a01b26bae10c7ad9f191a949ca3'

  def install
    bin.install 'sub'
  end
end
