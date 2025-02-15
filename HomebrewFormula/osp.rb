# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Osp < Formula
  desc "Open Source Software Pilot"
  homepage "https://github.com/elliotxx/osp"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/elliotxx/osp/releases/download/v0.2.0/osp_0.2.0_darwin_amd64.tar.gz"
      sha256 "4cb7f7e206d43fc2666833e60a1e73a41413a0c12018c5fe44e0760053e326dd"

      def install
        bin.install "osp"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/elliotxx/osp/releases/download/v0.2.0/osp_0.2.0_darwin_arm64.tar.gz"
      sha256 "75b67bcff23ad3b3bdf82c1f0b4a1030e136201c7e07895874fe3a12e00f0421"

      def install
        bin.install "osp"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/elliotxx/osp/releases/download/v0.2.0/osp_0.2.0_linux_amd64.tar.gz"
        sha256 "8eeb61a66b821561489cf61b5fd39bce3cf691b7a3a0003de7c176a06cf48bd7"

        def install
          bin.install "osp"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/elliotxx/osp/releases/download/v0.2.0/osp_0.2.0_linux_arm64.tar.gz"
        sha256 "c59f78ba5dad4508f2e1bbb9b6a57990065c44deeba6999f8c7636a7b8d5da2b"

        def install
          bin.install "osp"
        end
      end
    end
  end

  test do
    system "#{bin}/osp --version"
  end
end
