class EditCli < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.3.0/edit-cli-aarch64-apple-darwin.tar.gz"
      sha256 "2d4956d038e46b85581c149c669e588d35ca84f9b17ca30ec41d4c5b2935fe0b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.3.0/edit-cli-x86_64-apple-darwin.tar.gz"
      sha256 "7b045a72186c41e5ed9305992d330516df35224d70bffedc2dbc9eec0155bcdd"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.3.0/edit-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "176845ab597033dffc08e746d340d6e311b92aa5cf3afb16fa834a8da9640401"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.3.0/edit-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e4e8d2c1d5b87fd77144fa3fc786e5d8e821502c305341132f0a0196a56ad6b"
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
