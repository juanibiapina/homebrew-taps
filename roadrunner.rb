class Roadrunner < Formula
  desc 'A fast and configurable prompt for shells'
  homepage 'https://github.com/juanibiapina/roadrunner'
  url 'https://github.com/juanibiapina/roadrunner/releases/download/v2.0.0/roadrunner-v2.0.0-x86_64-apple-darwin.tar.gz'
  version 'v2.0.0'
  sha256 '8fc0b9c2981d6c32e5835d7cfb2e0d82b7492ff5f2e1ba9cb2fe8909af04ce20'

  def install
    bin.install 'roadrunner'
  end
end
