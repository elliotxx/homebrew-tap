class ClaudeList < Formula
  desc "CLI tool for viewing installed plugins, skills, agents, and MCP servers in Claude Code"
  homepage "https://github.com/elliotxx/claude-list"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.3/claude-list-aarch64-apple-darwin.tar.xz"
      sha256 "0e4936532ffc65565793532af3c9f6c02415101fc09da2173f503e8b0431323c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.3/claude-list-x86_64-apple-darwin.tar.xz"
      sha256 "16206e9770c1e2a4d38732c15e78a91bc770bd534628e76175f794333be25a47"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.3/claude-list-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6c0b002ff7a6fb9ddd6c5b89dbd481b7c847a222bd2d9efbf4d5848d2a55f408"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.3/claude-list-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "caded1a7c1f52990c8512c604584024e8df952e26dd6cfbcf45a4004a7494372"
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
