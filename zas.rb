class Zas < Formula
  desc "Local development made easy"
  homepage ""
  url "https://github.com/juanibiapina/zas/releases/download/v0.12.0/zas-v0.12.0.Darwin.tar.gz"
  version "0.12.0"
  sha256 "db9e0cbcce56fd4e1f1d266c0c26b71cfdf13bd84262acfabd8a864ccbc1dceb"

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
