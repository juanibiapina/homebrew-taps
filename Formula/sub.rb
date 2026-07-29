class Sub < Formula
  desc 'Organize groups of scripts into documented CLIs with subcommands'
  homepage 'https://github.com/juanibiapina/sub'
  url 'https://github.com/juanibiapina/sub/releases/download/v2.3.1/sub-v2.3.1-aarch64-apple-darwin.tar.gz'
  version 'v2.3.1'
  sha256 '82018689979d35134eb34fcf771a69d557a3dc8cb42a025d263e6d3db6db4442'

  def install
    bin.install 'sub'
  end
end
