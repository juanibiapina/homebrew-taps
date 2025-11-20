class Gob < Formula
  desc 'Background job manager for HUMANs and AGENTs'
  homepage 'https://github.com/juanibiapina/gob'
  version 'v0.1.0'

  on_macos do
    on_arm do
      url 'https://github.com/juanibiapina/gob/releases/download/v0.1.0/gob_0.1.0_darwin_arm64.tar.gz'
      sha256 '05aae7f4aaab2cdd266ce34496b1f20d6e1c82ce226ae5e1b79d706ff9103a25'
    end

    on_intel do
      url 'https://github.com/juanibiapina/gob/releases/download/v0.1.0/gob_0.1.0_darwin_amd64.tar.gz'
      sha256 'e6dbcf25dd0bf331e227fef4759daf95e492485d69da172c499b43445aa06044'
    end
  end

  def install
    bin.install 'gob'
  end
end
