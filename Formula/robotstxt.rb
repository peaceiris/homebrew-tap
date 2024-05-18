# typed: false
# frozen_string_literal: true

class Robotstxt < Formula
  desc "Google's robots.txt parser and matcher as a C++ library (compliant to C++11)."
  homepage "https://github.com/google/robotstxt"
  url "https://github.com/google/robotstxt/archive/455b1583103d13ad88fe526bc058d6b9f3309215.tar.gz"
  version "0.1.0"
  sha256 "618cdd42d4662dcfc6ff2da25854cc0039e664df1a5caff7026acb4074c8e269"
  license "Apache-2.0"

  depends_on "cmake" => :build

  def install
    mkdir "c-build" do
      system "cmake", "..", "-DROBOTS_BUILD_TESTS=ON", *std_cmake_args
      system "make"

      bin.install "robots"

      if OS.mac?
        lib.install "librobots.dylib"
        system "install_name_tool", "-add_rpath", "#{lib}", "#{bin}/robots"
      elsif OS.linux?
        system "mv", "librobots.so", "/usr/lib/librobots.so"
      end
    end
  end
end
