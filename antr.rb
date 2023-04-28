class Antr < Formula
  desc 'A simple to use file system event watcher that runs arbitrary commands'
  homepage 'https://github.com/juanibiapina/antr'
  url 'https://github.com/juanibiapina/antr/releases/download/v1.0.2/antr-v1.0.2-aarch64-apple-darwin.tar.gz'
  version 'v1.0.2'
  sha256 '6f84e382fa28cb476fb330f6fa08ce94493dddf2e1158a7af3d5a6c8c8190dd5'

  def install
    bin.install 'antr'
  end
end
