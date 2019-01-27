class Roadrunner < Formula
  desc 'A fast and configurable prompt for shells'
  homepage 'https://github.com/juanibiapina/roadrunner'
  url 'https://github.com/juanibiapina/roadrunner/releases/download/v2.1.0/roadrunner-v2.1.0-x86_64-apple-darwin.tar.gz'
  version 'v2.1.0'
  sha256 '1ec45eb77dd3113aa12200ae0732678d072f4c78dd86067886811a376a8a4239'

  def install
    bin.install 'roadrunner'
  end
end
