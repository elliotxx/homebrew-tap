class ClaudeList < Formula
  desc "CLI tool for viewing installed plugins, skills, agents, and MCP servers in Claude Code"
  homepage "https://github.com/elliotxx/claude-list"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.3/claude-list-aarch64-apple-darwin.tar.xz"
      sha256 "2f7326089845fd7dcd636f8864a2da80e9086f8717d0bab7d61ce5d4c511cd7e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.3/claude-list-x86_64-apple-darwin.tar.xz"
      sha256 "7f1875f0943218f61af51fb6559934178e273eb155a6242c6d7ab7cbeaa425b2"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.3/claude-list-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "14cf606c1bf7542673e0c511122e1410d2a461a32a489ab5acddece38eb37a85"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.3/claude-list-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a783cb3b40df0da91e4ac5dc11e9014b385d351242532097adad8f311d8a20e9"
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
