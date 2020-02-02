class Roadrunner < Formula
  desc 'A fast and configurable prompt for shells'
  homepage 'https://github.com/juanibiapina/roadrunner'
  url 'https://github.com/juanibiapina/roadrunner/releases/download/v2.2.0/roadrunner-v2.2.0-x86_64-apple-darwin.tar.gz'
  version 'v2.2.0'
  sha256 'bd2530e02ea25bc2f5889671f6b0356b15ad65fc66b7272a4366c806ed53d952'

  def install
    bin.install 'roadrunner'
  end
end
