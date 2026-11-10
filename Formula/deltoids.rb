class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.20.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.20.0/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "73c73ac7f752486f63829217939ce1ebd242eef5fedde41bf5e44176b40c25ee"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.20.0/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "4645ab835a7acb17e6381beddc8d0ab5b2f41289b2b61571a7a9fb4993b46fa3"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.20.0/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "219065a627de3e001b5a63d72ffaec3bbf9eaeebc3a945d903c666513db3d226"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.20.0/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "544cdfe8fb75071748da0ab92aa0bd9bf278243dcf2e0b01a72ff6940cb8f148"
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
