class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.15.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.15.0/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "0d6ada3bc48fb933daa4845434363701dc314e92884ba8f45f9efb3aaf5b8db1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.15.0/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "66fade783cef0cce82c6934efc5d59c9a68e7aaf84907bbb8d1aaa3eabcb45a7"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.15.0/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63e31796ca85614887d91c87358a33db8c51ddaeebc21451cee336ccb55ad10c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.15.0/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ecb6d89e11c724a16215ec925eb912735169882507098c0ef122654dab62749"
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
