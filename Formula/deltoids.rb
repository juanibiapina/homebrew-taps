class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.12.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.1/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "e6ba6c0cebcc2a32452b2503e94f653c992f6520a44052e005b9728e14ceca49"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.1/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "12d4c500564f5ba00ccb09e0fe5ee5970e76fff9a243cbddef49af5d1d3f30aa"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.1/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f28c178c7623e090b30a1ffc24e6a8a77e6f8cb48d656a720d13d9bcf52191dc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.1/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "203025c67e6e9ef6ce2f76b83195dc5fa7a67af9194408a0a20210ca30d8fb59"
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
    bin.install "deltoids" if OS.mac? && Hardware::CPU.arm?
    bin.install "deltoids" if OS.mac? && Hardware::CPU.intel?
    bin.install "deltoids" if OS.linux? && Hardware::CPU.arm?
    bin.install "deltoids" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
