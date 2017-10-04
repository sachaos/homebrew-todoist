class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.10.0.tar.gz"
  sha256 "5b3aace8893934b0636b9a237bcdb62ff56fa66cc6bea4b8f6c7a4128d7de905"
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
