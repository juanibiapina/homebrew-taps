class Zas < Formula
  desc "Local development made easy"
  homepage ""
  url "https://github.com/juanibiapina/zas/releases/download/v0.14.0/zas-v0.14.0.Darwin.tar.gz"
  version "0.14.0"
  sha256 "d65cfde4e50a7530ee45bc2e4649321bc7e2ab3f22f3bc3603bce84581e3957f"

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
