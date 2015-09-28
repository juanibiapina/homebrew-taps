class Zas < Formula
  desc "Local development made easy"
  homepage ""
  url "https://github.com/juanibiapina/zas/releases/download/v0.13.0/zas-v0.13.0.Darwin.tar.gz"
  version "0.13.0"
  sha256 "be85556f5d95be374993c000a017c13cb85de472aaad2e83393b2c949fb2cc38"

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
