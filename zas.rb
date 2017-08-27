class Zas < Formula
  desc "Simple router for local web development"
  homepage "https://github.com/juanibiapina/zas"
  url "https://github.com/juanibiapina/zas/releases/download/v0.19.0/zas-v0.19.0-x86_64-apple-darwin.tar.gz"
  version "0.19.0"
  sha256 "faa5acb757c4e43b431d0e3884b973d4907103e393a5cc9771b0c20f600f08e8"

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
