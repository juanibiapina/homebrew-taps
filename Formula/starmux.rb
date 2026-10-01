class Starmux < Formula
  desc "A fast and configurable tmux sidebar"
  homepage "https://github.com/juanibiapina/starmux"
  version "0.6.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.6.0/starmux-aarch64-apple-darwin.tar.gz"
      sha256 "7b8dd3214a55b29706be234429e12226cb92aff67a448b2ee4fd29ca26a92bcf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.6.0/starmux-x86_64-apple-darwin.tar.gz"
      sha256 "c3cefa75666374ed6758fb74b9934b4f89a6c4d5368555ba8c025b10b2176541"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.6.0/starmux-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28d80fa56cafcc2f40a137b46839bf53b5a6cd21d4f5a34311b0a16f6d92d1d6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.6.0/starmux-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "762aced59bf49b487c10398fef5e8f90239a80e401ffdf5be975c8d4c1a1150c"
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
