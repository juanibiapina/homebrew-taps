class Zas < Formula
  desc "Simple router for local web development"
  homepage "https://github.com/juanibiapina/zas"
  url "https://github.com/juanibiapina/zas/releases/download/v0.18.0/zas-v0.18.0-x86_64-apple-darwin.tar.gz"
  version "0.18.0"
  sha256 "4cbe062b3db4cf2607a14250012b60526ba6ed1640972c95de59dc8bb296e85b"

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
