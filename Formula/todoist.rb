class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.10.1.tar.gz"
  sha256 "5e851d9df1b84a1be237f7715d1d8e582c8292b2a34448c29f1525400d052f93"
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
