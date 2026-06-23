class Deltoids < Formula
  desc "Tools for reviewing code in the agentic era"
  homepage "https://github.com/juanibiapina/deltoids"
  version "0.9.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.9.0/deltoids-cli-aarch64-apple-darwin.tar.gz"
      sha256 "dacaf229303be705d8d749e2b5eda2dcacf6395f20e9209d25b69fd39cb7462e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.9.0/deltoids-cli-x86_64-apple-darwin.tar.gz"
      sha256 "c5c33aa1b2fe63f74ff7ee7ac27ae67dcc49d7f30b62994951a77e423009f3c0"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.9.0/deltoids-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26e3f34043d5e1b686eef1a02a4a6fbf7a12f13f5885abe17b3d71ee8466f825"
    end
    if Hardware::CPU.intel?
      url "https://github.com/juanibiapina/deltoids/releases/download/v0.9.0/deltoids-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f5a5f6dd0ad1fc0ebbe142c77169731ae3e0f7ba75be78b9c7f522a411e6374"
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
