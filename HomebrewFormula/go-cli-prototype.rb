# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GoCliPrototype < Formula
  desc "This is a cli application with go and cobra."
  homepage "https://github.com/elliotxx/go-cli-prototype"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/go-cli-prototype/releases/download/v0.1.7/go-cli-prototype_0.1.7_Darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "7b410395d6d56e3c6aca234b1f9597681f224b022138c1a65c9820876622c809"

      def install
        bin.install "go-cli-prototype"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/go-cli-prototype/releases/download/v0.1.7/go-cli-prototype_0.1.7_Darwin_x86_64.tar.gz", :using => CurlDownloadStrategy
      sha256 "a191981e1edcf6ddee066afaa7b50852ff32c85aca6a253d3ba012e24f09c4da"

      def install
        bin.install "go-cli-prototype"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/go-cli-prototype/releases/download/v0.1.7/go-cli-prototype_0.1.7_Linux_x86_64.tar.gz", :using => CurlDownloadStrategy
      sha256 "f0d2d07bbf1d401a49244344ba50fad26f4c2e7ca8e0784ea67d05d094c18212"

      def install
        bin.install "go-cli-prototype"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/elliotxx/go-cli-prototype/releases/download/v0.1.7/go-cli-prototype_0.1.7_Linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "f0bacbad30f51d12881f26198bdb1381d2ecf8ed0807cd70462ed167066e5150"

      def install
        bin.install "go-cli-prototype"
      end
    end
  end

  test do
    system "#{bin}/go-cli-prototype -V"
  end
end
