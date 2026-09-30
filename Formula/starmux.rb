class Starmux < Formula
  desc "A fast and configurable tmux sidebar"
  homepage "https://github.com/juanibiapina/starmux"
  version "0.5.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.5.1/starmux-aarch64-apple-darwin.tar.gz"
      sha256 "fa072064fdd167168e4d280433a308c9cb53c3296273eeafba0c8cf12c96328d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.5.1/starmux-x86_64-apple-darwin.tar.gz"
      sha256 "618713b887ffafffb17dcb51cb86cca5ee7d5da4597095d2bd0cdf01b5016417"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.5.1/starmux-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d513dad55d23b4d30f8dc5d2893f7092408e2162a3516dda145bca72eada9e4d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.5.1/starmux-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f388b67da9a621ec73e88908b0f9441210289ba7cdcb7c1b6e671eb40378fa09"
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
      bin.install "starmux"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "starmux"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "starmux"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "starmux"
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
