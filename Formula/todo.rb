class Todo < Formula
  desc "A simple per-directory todo list"
  homepage "https://github.com/juanibiapina/todo"
  version "4.0.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/todo/releases/download/v4.0.0/todo-aarch64-apple-darwin.tar.gz"
      sha256 "0997aa5f51708ea0f8814bd4ec6b8ef83597d19aad8af9401f643f65d30f4535"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/todo/releases/download/v4.0.0/todo-x86_64-apple-darwin.tar.gz"
      sha256 "98d0499db0d5796c59e2f749d44a20fb19024bd98fd74fabca4472849d09be36"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/todo/releases/download/v4.0.0/todo-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b8a7ff1162ad438eac65bb628f9ef46a8fbc5b4cf6d74bf1069a28875ce6cb3c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/todo/releases/download/v4.0.0/todo-x86_64-unknown-linux-musl.tar.gz"
      sha256 "81cc1dc75534324268acaeb092b0420751c0f734e58bb3364e364278d0e579c3"
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
