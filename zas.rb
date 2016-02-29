class Zas < Formula
  desc "Local development made easy"
  homepage ""
  url "https://github.com/juanibiapina/zas/releases/download/v0.15.0/zas-v0.15.0.Darwin.tar.gz"
  version "0.15.0"
  sha256 "ea06a85bbbf7cbf22b0c4a808f54ea7f0f2e1aaf9634dd3f6ba62072bf093dae"

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
