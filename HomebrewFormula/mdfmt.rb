# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Mdfmt < Formula
  desc "A Markdown formatter that follow the CommonMark. Like gofmt, but for Markdown."
  homepage "https://github.com/elliotxx/mdfmt"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/mdfmt/releases/download/v0.2.3/mdfmt_0.2.3_Darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "85b4e720591709a57b83232bfbcee6c0d2a7cff8750e24f2c0980b582fefe960"

      def install
        bin.install "mdfmt"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/mdfmt/releases/download/v0.2.3/mdfmt_0.2.3_Darwin_x86_64.tar.gz", :using => CurlDownloadStrategy
      sha256 "ae0e37d41b41d442bd1aa3a1308678f9012b4d9ef9a67a64c5259ad3aeb0bbfb"

      def install
        bin.install "mdfmt"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/mdfmt/releases/download/v0.2.3/mdfmt_0.2.3_Linux_x86_64.tar.gz", :using => CurlDownloadStrategy
      sha256 "990c6cb62ccea01e4d74abedb444b14f8080f82b949626fa2f89e772220cfd76"

      def install
        bin.install "mdfmt"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/elliotxx/mdfmt/releases/download/v0.2.3/mdfmt_0.2.3_Linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "c8a238ae80e775f72d862fc8b0893c4b82c402f16b297f410fe04443b3b433df"

      def install
        bin.install "mdfmt"
      end
    end
  end

  test do
    system "#{bin}/mdfmt -V"
  end
end
