class Starmux < Formula
  desc "A fast and configurable tmux sidebar"
  homepage "https://github.com/juanibiapina/starmux"
  version "0.8.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.8.0/starmux-aarch64-apple-darwin.tar.gz"
      sha256 "c2900cebebd572be121fbc6c0b16ae6b762191d7078f58fe8ad2a3c8a9b88290"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.8.0/starmux-x86_64-apple-darwin.tar.gz"
      sha256 "af43be0f08e6670f3ef0897a96208d7c874af06394019c43a6289b9c9c18ca5a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.8.0/starmux-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1926ae75d334ce569531da68aa5f86483f2feeeec6ef56c5e3f284bd6c6572fe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/starmux/releases/download/v0.8.0/starmux-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcbb4de51b1958e68af7bfc3c0a96ec5e9680022a150466ea4e87e8614f693e9"
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
