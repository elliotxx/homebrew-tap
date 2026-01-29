class ClaudeList < Formula
  desc "CLI tool for viewing installed plugins, skills, agents, and MCP servers in Claude Code"
  homepage "https://github.com/elliotxx/claude-list"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/0.1.0/claude-list-aarch64-apple-darwin.tar.xz"
      sha256 "5a9c0f2fc1c1f233f3e05835bcbfe4816c72ddd9b5e8e3e21372c8837ffd8599"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/0.1.0/claude-list-x86_64-apple-darwin.tar.xz"
      sha256 "62d59be4ff5557ee110f9d3d9d2ef2a2181b690a8d2c5a763f7930d3058264ff"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/0.1.0/claude-list-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fb3f5e40e861f49153d1a76063a07e3807a2b61a7974763195f4523e823cd5f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/0.1.0/claude-list-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ba04b350d262bf10fce26db3fd3004e4141b05f3356889597b58c2c0555964f8"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
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
    bin.install "claude-list" if OS.mac? && Hardware::CPU.arm?
    bin.install "claude-list" if OS.mac? && Hardware::CPU.intel?
    bin.install "claude-list" if OS.linux? && Hardware::CPU.arm?
    bin.install "claude-list" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
