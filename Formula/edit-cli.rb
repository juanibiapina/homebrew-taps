class EditCli < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.2.0/edit-cli-aarch64-apple-darwin.tar.gz"
      sha256 "51143f8473e55f224392828020ba0f6f404504b8526498e38976ab61e330ae25"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.2.0/edit-cli-x86_64-apple-darwin.tar.gz"
      sha256 "dd1fade5bc28adea7f5c16d089fe8822e58c94744f0c8cce7cbe15f05ed50767"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.2.0/edit-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "795c9448c055f9f68ab7ad8ddb92632b74c15c788f10fdc2fa149cd338915c77"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.2.0/edit-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1c127bdc8620f4874fbaa41f58324f1dfa81072d9b4d216d1639e56bb61b43d"
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
