class Starmux < Formula
  desc "A fast and configurable tmux sidebar"
  homepage "https://github.com/juanibiapina/starmux"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.3.0/starmux-aarch64-apple-darwin.tar.gz"
      sha256 "80bc5b50eda9dc04780bf912fd0902db9c75034a84d48648909d5f669f087845"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.3.0/starmux-x86_64-apple-darwin.tar.gz"
      sha256 "09160f3d3bbd8a28d63a99791643819e9d6b3bcfe65f4ebc3f5bc67fb6966361"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.3.0/starmux-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a68e7302bf16cdcce96c7f5bc13086835610ae4e5b2a0d3044b338d735181d5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.3.0/starmux-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3ef9e46d857e79b58b636c05b49fbb93d9e826c560ed1c0aa428a2b998d7b55"
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
