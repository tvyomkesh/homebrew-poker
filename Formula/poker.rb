class Poker < Formula
  desc "Terminal-based Texas Hold'em Poker game with AI opponents"
  homepage "https://github.com/tvyomkesh/poker"
  url "https://github.com/tvyomkesh/poker/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1b85e99cc1f180e98a5ec3fd9484ce6af308a8202e7bf28fbefad6cae5f8a6b2"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Install all Python files to libexec
    libexec.install Dir["*"]

    # Create executable wrapper
    (bin/"fairpoker").write <<~EOS
      #!/bin/bash
      cd "#{libexec}"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -c "from main import main; main()" "$@"
    EOS

    (bin/"poker").write <<~EOS
      #!/bin/bash
      cd "#{libexec}"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -c "from main import main; main()" "$@"
    EOS
  end

  test do
    system "true"
  end
end
