class Todo < Formula
  desc "A simple per-directory todo list"
  homepage "https://github.com/juanibiapina/todo"
  version "4.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/todo/releases/download/v4.1.0/todo-aarch64-apple-darwin.tar.gz"
      sha256 "3bfff7f09b9f8adfed47dccf4b8f734783527311cc6c1ad5dfc288ab4b0a3c1c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/todo/releases/download/v4.1.0/todo-x86_64-apple-darwin.tar.gz"
      sha256 "38ca08306fce23184a97dcef23a7b4e460ea49faf455768056c749709b16a661"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/todo/releases/download/v4.1.0/todo-aarch64-unknown-linux-musl.tar.gz"
      sha256 "339976f01d1000cd49f92c4079244efa6ccdf564e59e9122e9367b899bf625b7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/todo/releases/download/v4.1.0/todo-x86_64-unknown-linux-musl.tar.gz"
      sha256 "62f82684cc1ecb278c85f065b8a2d9add5f00a978a47cfdde42c19ce9759802e"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
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
      bin.install "todo"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "todo"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "todo"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "todo"
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
