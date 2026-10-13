class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.14.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.14.0/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "4be8e6d72a08e1994ab0ec2a760b9961c9993b732137d2ec01f530e710ef15b5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.14.0/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "311cdc0fcaf7a0091ebfa922220e8be80562bf3a6fdc306ccd5cf09f27e9cc56"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.14.0/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b093c365ad78f3cca8e93b39cc74ea64dacf1e02267ee15071c06801740f7e8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.14.0/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29a3d71e188776ccca2460e6558a5765cfa2e1ec77a1c9fdb4d09bff280f3661"
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
