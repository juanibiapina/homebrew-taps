class Sub < Formula
  desc 'Organize groups of scripts into documented CLIs with subcommands'
  homepage 'https://github.com/juanibiapina/sub'
  url 'https://github.com/juanibiapina/sub/releases/download/v2.3.0/sub-v2.3.0-aarch64-apple-darwin.tar.gz'
  version 'v2.3.0'
  sha256 '37b488fa161b516a74e0499a31e1086266de0697719e0fe3525fe520e862a745'

  def install
    bin.install 'sub'
  end
end
