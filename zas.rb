class Zas < Formula
  desc "Local development made easy"
  homepage "https://github.com/juanibiapina/zas"
  url "https://github.com/juanibiapina/zas/releases/download/v0.17.0/zas-v0.17.0-x86_64-apple-darwin.tar.gz"
  version "0.17.0"
  sha256 "0740e4d5e16bdf2f8131a6591e8ee73827ec0dc65423404e7a761cbb0b455783"

  def install
    prefix.install Dir["resources"]
    libexec.install Dir["libexec/*"]
    bin.install "bin/zasd"
    bin.install "bin/zas"
  end

  def caveats
    <<-EOS.undent
      To complete installation, run:
        zas install

      Before uninstalling, run:
        zas uninstall
    EOS
  end
end
