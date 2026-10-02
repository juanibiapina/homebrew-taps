class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.13.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.13.0/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "7357f0bca2597b392cd2678157671e17f3b7d5841613786ebe3ca88c2431b4c2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.13.0/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "ae3e5d32df32ed01e92fb4737077825f49142306606183fd602d2403f2d6962a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.13.0/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "573a931fa834c43816a2ed9b21bb86812bdb2696722df2fd8d62d96c55adf0ef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.13.0/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da06e2a12a527ee5426336745ce4bd10b7c471f0f2ca7fe495857f89f6f94e9e"
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
      bin.install "deltoids"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "deltoids"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "deltoids"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "deltoids"
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
