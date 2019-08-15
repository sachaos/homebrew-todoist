class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.14.0-homebrew.tar.gz"
  sha256 "c58dd771f7b1a2750f8805561aa1e8549a7c395fdeab16cac66c6d5735936e99"
  head "https://github.com/sachaos/todoist.git"

  depends_on "go" => :build

  def install
    (buildpath/"src/github.com/sachaos/todoist").install buildpath.children
    cd "src/github.com/sachaos/todoist" do
      system "go", "build", "-o", bin/"todoist"
    end
  end
end
