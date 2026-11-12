class Ghtui < Formula
  desc "A rich terminal UI for GitHub that doesn't break your flow"
  homepage "https://juanm.dev/ghtui/"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/ghtui/releases/download/v0.2.0/ghtui-aarch64-apple-darwin.tar.gz"
      sha256 "b0db73c75e00450128baf12b6eb769fd3981d00b6fb82290ac314f2d15bda372"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/ghtui/releases/download/v0.2.0/ghtui-x86_64-apple-darwin.tar.gz"
      sha256 "2c0dbddab8cf0128b2478f9ff3c0fe224172924bf65cc73ae0d9b52fe51cf813"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/ghtui/releases/download/v0.2.0/ghtui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "341cebdf21bb85c2f9d9f3a23665a9982ea2719520bf0eb3d808919d1be00cb4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/ghtui/releases/download/v0.2.0/ghtui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "feab8d9b024c14b61e523965874dba0deb97ebd9703ca707cb239b9af558154b"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "ghtui"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "ghtui"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "ghtui"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "ghtui"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
