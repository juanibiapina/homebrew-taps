class Starmux < Formula
  desc "A fast and configurable tmux sidebar"
  homepage "https://github.com/juanibiapina/starmux"
  version "0.7.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.7.0/starmux-aarch64-apple-darwin.tar.gz"
      sha256 "bd1f35b8069d40f4e70852c2137089f9793710c6f2db46730efe71d35592327d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.7.0/starmux-x86_64-apple-darwin.tar.gz"
      sha256 "81ac51c1515292711362445022c56a010db60cefbf0ef3dbb72e7a49494fc5d0"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.7.0/starmux-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32bf44ddd95dcb87fb9882b87e7d1d3ff622fd7a34e477aca12af329b92fb291"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.7.0/starmux-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd0798027b1cb3c67b979709e40e5fa732c974550cbc1a6a7afdc7e61864edd4"
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
