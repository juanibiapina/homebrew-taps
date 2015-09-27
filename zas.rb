class Zas < Formula
  desc "Local development made easy"
  homepage ""
  url "https://github.com/juanibiapina/zas/releases/download/v0.11.0/zas-v0.11.0.Darwin.tar.gz"
  version "0.11.0"
  sha256 "7d19f671d98e6e119fa09ac6aa2c57853b8db4d6a259e4becea17f6a9bae1d3d"

  def install
    libexec.install Dir["libexec/*"]
    bin.install "bin/zasd"
    bin.install "bin/zas"
  end
end
