class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.18.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.18.0/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "a3dddc266fa703b23c43d1321d542ed117e5093076d2c062e87b24c6e6bd80b6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.18.0/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "f3fb227ed4489e4403460e2a825e9f02e9817dd3c6cee61268074857a9c24f6d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.18.0/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72dac84642dcdb3a10be5d0bd82f4723d6091923fd4bb26831589049137723cf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.18.0/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1490bfe7846ab2afa830a0f13e7765a13e13dbccc931b6f26e322bdefd16ef15"
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
