class Zas < Formula
  desc "Local development made easy"
  homepage ""
  url "https://github.com/juanibiapina/zas/releases/download/v0.10.0/zas-v0.10.0.Darwin.tar.gz"
  version "0.10.0"
  sha256 "d772eaf081eb53657af3cfe7cce0ba1fd0d6d6aa59481fb8ca82da7aeae809db"

  def install
    bin.install "bin/zasd"
  end
end
