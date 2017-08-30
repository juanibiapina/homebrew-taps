class Zas < Formula
  desc "Simple router for local web development"
  homepage "https://github.com/juanibiapina/zas"
  url "https://github.com/juanibiapina/zas/releases/download/v0.20.0/zas-v0.20.0-x86_64-apple-darwin.tar.gz"
  version "0.20.0"
  sha256 "f4e72458d227a384355290cbfd5a91a6a20cbbf98384356c01969407eee8d734"

  def install
    bin.install "zas"
  end

  def caveats
    <<-EOS.undent
      To complete installation and setup system hooks, run:
        zas install

      This will setup the dns server and port forwarding.

      Before uninstalling, run:
        zas uninstall

      sudo is required for both operations.
    EOS
  end
end
