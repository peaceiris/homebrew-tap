# typed: false
# frozen_string_literal: true

class Pipectl < Formula
    desc "pipectl: A Command Line Tool for PipeCD."
    homepage "#{homepage}"
    version "0.47.0"
    license "Apache License 2.0"

    if OS.mac? && Hardware::CPU.intel?
        os "darwin"
        arch "amd64"
        url "#{homepage}/releases/download/v#{version}/pipectl_v#{version}_#{os}_#{arch}"
        sha256 "922a7e4cd4e3c79e4ce9c16bfbe7849493691cf0b8a4be6874c3c3bb341efabc"
    elsif OS.mac? && Hardware::CPU.arm?
        os "darwin"
        arch "arm64"
        url "#{homepage}/releases/download/v#{version}/pipectl_v#{version}_#{os}_#{arch}"
        sha256 "b3c3efcd4b4b1a611e320ebd7613705f919ae793167f8f40a22826431b9d6c5f"
    elsif OS.linux? && Hardware::CPU.intel?
        os "linux"
        arch "amd64"
        url "#{homepage}/releases/download/v#{version}/pipectl_v#{version}_#{os}_#{arch}"
        sha256 "58bd709010df521f378d8290f3317424472bb6494d7748b1bb4740fea5db4d7f"
    elsif OS.linux? && Hardware::CPU.arm?
        os "linux"
        arch "arm64"
        url "#{homepage}/releases/download/v#{version}/pipectl_v#{version}_#{os}_#{arch}"
        sha256 "cca096cfff8ea95a908eb69f1bf6e7abbabb7cb0d3de4e5763f0b438c8a34a95"
    end

    def install
        bin.install "pipectl_v#{version}_#{os}_#{arch}" => "pipectl"
    end

    test do
        system "#{bin}/pipectl --help"
    end
end
