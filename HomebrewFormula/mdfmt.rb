# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Mdfmt < Formula
  desc "A Markdown formatter that follow the CommonMark. Like gofmt, but for Markdown."
  homepage "https://github.com/elliotxx/mdfmt"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/mdfmt/releases/download/v0.1.8/mdfmt_0.1.8_Darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "f02d30237f5772fc1e2b9e40eb7d7b51571cc1b8ac4f3b72ab474c864314ada2"

      def install
        bin.install "mdfmt"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/mdfmt/releases/download/v0.1.8/mdfmt_0.1.8_Darwin_x86_64.tar.gz", :using => CurlDownloadStrategy
      sha256 "f46e6b7c59a4f87494530b1334edef0a25bac389bb3ea507306dcd41c3758bac"

      def install
        bin.install "mdfmt"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/elliotxx/mdfmt/releases/download/v0.1.8/mdfmt_0.1.8_Linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "5f7245dde279623af145346911dfb279cf20695fbc1e4e03ff8ec26279a0695a"

      def install
        bin.install "mdfmt"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/mdfmt/releases/download/v0.1.8/mdfmt_0.1.8_Linux_x86_64.tar.gz", :using => CurlDownloadStrategy
      sha256 "e502261092fea996725cdc30c5d995c43a9859fad404ea72898639603537e318"

      def install
        bin.install "mdfmt"
      end
    end
  end

  test do
    system "#{bin}/mdfmt -V"
  end
end
