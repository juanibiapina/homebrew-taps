class Sub < Formula
  desc 'Organize groups of scripts into documented CLIs with subcommands'
  homepage 'https://github.com/juanibiapina/sub'
  url 'https://github.com/juanibiapina/sub/releases/download/v0.2.0/sub-v0.2.0-x86_64-apple-darwin.tar.gz'
  version 'v0.2.0'
  sha256 '4e2e8f08081a25481bac3cbd080acf48d034107ddee86beb7c430de625f3333c'

  def install
    bin.install 'sub'
  end
end
