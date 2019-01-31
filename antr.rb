class Antr < Formula
  desc 'A simple to use file system event watcher that runs arbitrary commands'
  homepage 'https://github.com/juanibiapina/antr'
  url 'https://github.com/juanibiapina/antr/releases/download/v0.3.0/antr-v0.3.0-x86_64-apple-darwin.tar.gz'
  version 'v0.3.0'
  sha256 '938b811980b44b42c4f5ccd6fb955d7b3559781d2dc02c9b6783b19b52e3277a'

  def install
    bin.install 'antr'
  end
end
