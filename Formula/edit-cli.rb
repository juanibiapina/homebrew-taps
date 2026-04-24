class EditCli < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.1.0/edit-cli-aarch64-apple-darwin.tar.gz"
      sha256 "f9749f0b625214004347a17ead5ded9c202d5dcfd9bc02f9b17a089f4bfe2223"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.1.0/edit-cli-x86_64-apple-darwin.tar.gz"
      sha256 "30a29542cd9e5cf5c122e80d109878a2c174d08c3c4369217790a0d1c6d9c192"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.1.0/edit-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7df71d0aabfa618ca10cf3d1955378da593c5c538c16e99446d02774c4290617"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.1.0/edit-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17e1d7f26f268af9fe11a16520ed7371c8973434b7fe0c50730b208a479ae8be"
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
    bin.install "edit", "edit-tui", "write" if OS.mac? && Hardware::CPU.arm?
    bin.install "edit", "edit-tui", "write" if OS.mac? && Hardware::CPU.intel?
    bin.install "edit", "edit-tui", "write" if OS.linux? && Hardware::CPU.arm?
    bin.install "edit", "edit-tui", "write" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
