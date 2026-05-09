class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.6.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.6.0/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "0a08fa416951d6e88ab1e07f9f26d49e71a7903aaac17e2089053c991702f925"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.6.0/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "12af764171782c3090a1324a3a703e36b6aafe09a3144a9e851b4d09e753c87d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.6.0/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e452aa2f7c988393a060ced340a49abf4f32871ce3a3e1f81cc2f6c3dcc79172"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.6.0/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27ac4d6d6f0cf303267c05d8782eebf1074513a6b2829555d745ad846d4ae00c"
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
