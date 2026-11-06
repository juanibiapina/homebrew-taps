class Ghtui < Formula
  desc "A rich terminal UI for GitHub that doesn't break your flow"
  homepage "https://github.com/juanibiapina/ghtui"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/ghtui/releases/download/v0.1.0/ghtui-aarch64-apple-darwin.tar.gz"
      sha256 "41e691ab52348b35736c53228d0237765c66f5d3d0536532596ec38ced2213d2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/ghtui/releases/download/v0.1.0/ghtui-x86_64-apple-darwin.tar.gz"
      sha256 "613e652adc561686d9e2832de248b7ad8339d77d2cfa39cc8192f86990ca834f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/ghtui/releases/download/v0.1.0/ghtui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aae19a7a6872276af2b41267227db61f855684f8a60dd43b34069bc330e2d5cb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/ghtui/releases/download/v0.1.0/ghtui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39459745f8edc8c43ae14625eb825f1d6f2c0a127a577f47a82ddd954db59c42"
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
