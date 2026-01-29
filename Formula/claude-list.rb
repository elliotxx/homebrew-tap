class ClaudeList < Formula
  desc "CLI tool for viewing installed plugins, skills, agents, and MCP servers in Claude Code"
  homepage "https://github.com/elliotxx/claude-list"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/0.1.1/claude-list-aarch64-apple-darwin.tar.xz"
      sha256 "904a9fdaa2efb81e4f655f8bb6a4da3b36d7344322593918d85010ba8f0ea5f2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/0.1.1/claude-list-x86_64-apple-darwin.tar.xz"
      sha256 "b53351c594d23c71cbb20dc3609c0dbe771f961592d4de523ec0ae7279bc9f3b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/0.1.1/claude-list-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "23d93eb6e4d2454bd340bb71cc4bf31311596e1238aa0c5a0cef45fd414a4154"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/0.1.1/claude-list-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2fd7961e855cf9c6f88bc415399148aa4edb76ee26bc324600fddcf5b83d7e04"
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
