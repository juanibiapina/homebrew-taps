class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.12.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.2/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d61aa3371fe83d49f71d1c649fcc0c8ae93da121a4f436bbd7001ec415956830"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.2/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "9c7e9d01c6fe3973dbb570022453ba73f9db9f41b858ee600213bd663598c218"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.2/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e3cb670ae0bcffcdf71e2737e56641a1e72b123fdd42127367ed195601c56d03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.12.2/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "965460361cecf3cfb549241a9b56aac45298687e4e7d1cf9b901b3be328ff5b1"
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
