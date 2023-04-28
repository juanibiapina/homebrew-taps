class Sub < Formula
  desc 'Organize groups of scripts into documented CLIs with subcommands'
  homepage 'https://github.com/juanibiapina/sub'
  url 'https://github.com/juanibiapina/sub/releases/download/v0.9.0/sub-v0.9.0-aarch64-apple-darwin.tar.gz'
  version 'v0.9.0'
  sha256 'bec2748a5c1ef07302bb6540a8f40425aa8f1baa32585a0e0c23978416a3f9e1'

  def install
    bin.install 'sub'
  end
end
