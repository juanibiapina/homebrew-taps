class Antr < Formula
  desc 'A simple to use file system event watcher that runs arbitrary commands'
  homepage 'https://github.com/juanibiapina/antr'
  url 'https://github.com/juanibiapina/antr/releases/download/v1.0.1/antr-v1.0.1-x86_64-apple-darwin.tar.gz'
  version 'v1.0.1'
  sha256 '72f506c3db62e60a93acbd4e9babf6e53b975eec98a93a239297aaa7d1b1b26d'

  def install
    bin.install 'antr'
  end
end
