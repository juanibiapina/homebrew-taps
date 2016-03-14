class Zas < Formula
  desc "Local development made easy"
  homepage "https://github.com/juanibiapina/zas"
  url "https://github.com/juanibiapina/zas/releases/download/v0.16.0/zas-v0.16.0-x86_64-apple-darwin.tar.gz"
  version "0.16.0"
  sha256 "7caf22e7fb407ac0473e06f00606abf40cc45ac6ea9833b1e0f093c7aee2451d"

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
