class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.13.0.tar.gz"
  sha256 "7a90b1234a3eb54d859f53712addb9fdf9a14010c703a621feed5fa5fc80b857"
  head "https://github.com/sachaos/todoist.git"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/sachaos/todoist").install buildpath.children
    cd "src/github.com/sachaos/todoist" do
      system "dep", "ensure"
      system "go", "get", "golang.org/x/tools/cmd/goyacc"
      system "#{buildpath}/bin/goyacc", "-o", "filter_parser.go", "filter_parser.y"
      system "go", "build", "-o", bin/"todoist"
    end
  end
end
