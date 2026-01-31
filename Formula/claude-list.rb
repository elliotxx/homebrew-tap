class ClaudeList < Formula
  desc "CLI tool for viewing installed plugins, skills, agents, and MCP servers in Claude Code"
  homepage "https://github.com/elliotxx/claude-list"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.4/claude-list-aarch64-apple-darwin.tar.xz"
      sha256 "697d3259c8100ff171e461b22fa4a0aab4a6a82fbc9e2c5021f9c06a0d4a2f97"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.4/claude-list-x86_64-apple-darwin.tar.xz"
      sha256 "e1c463008b98552a5a7cbc5f8b67f2767af4b8807a249c9b502d074ab7de4466"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.4/claude-list-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bb90a5cefea69bc2776d42ba7ab350a05ab2ce9fd49a2fd1fdeea9e5c7479f93"
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/claude-list/releases/download/v0.1.4/claude-list-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4e3126c7f81b1eaf303526719f026bcb9ba8d170edd981d2145f0cbd25d36830"
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
