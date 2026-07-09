class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.12.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.0/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8c72d40bddbac25204dc68ec17b7bd632e32439cd63027dfdfa68864dcdda617"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.0/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "0758cce6cfe2ad8320dd03382019bd2a2272948ddf88e9a62014a038f898a905"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.0/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16a6b5893f1cbabe877854a45e63f0fa3df599915c6339c9a10dbc42e2846859"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.0/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c8b7931b3113eb1506d5d528e9d9817a7b44f1f8ad615496b3f15eb26e97828"
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
