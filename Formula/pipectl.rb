# typed: false
# frozen_string_literal: true

class Pipectl < Formula
    desc "pipectl: A Command Line Tool for PipeCD."
    homepage "https://github.com/pipe-cd/pipecd"
    version "0.47.0"
    license "Apache License 2.0"

    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/pipe-cd/pipecd/releases/download/v0.47.0/pipectl_v0.47.0_darwin_amd64"

        def install
          bin.install "pipectl"
        end
      end
      if Hardware::CPU.arm?
        url "https://github.com/pipe-cd/pipecd/releases/download/v0.47.0/pipectl_v0.47.0_darwin_arm64"

        def install
          bin.install "pipectl"
        end
      end
    end

    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/pipe-cd/pipecd/releases/download/v0.47.0/pipectl_v0.47.0_linux_arm64"

        def install
          bin.install "pipectl"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/pipe-cd/pipecd/releases/download/v0.47.0/pipectl_v0.47.0_linux_amd64"

        def install
          bin.install "pipectl"
        end
      end
    end

    test do
      system "#{bin}/pipectl --help"
    end
  end
