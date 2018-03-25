class Zas < Formula
  desc "Simple router for local web development"
  homepage "https://github.com/juanibiapina/zas"
  url "https://github.com/juanibiapina/zas/releases/download/v0.21.0/zas-v0.21.0-x86_64-apple-darwin.tar.gz"
  version "0.21.0"
  sha256 "d624b2de23c924eedfa3aea8a9d934d650a7c6fe628f8c53e4f55fb8074d38fe"

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
