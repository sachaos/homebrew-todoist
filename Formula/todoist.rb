class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.13.0-homebrew.tar.gz"
  sha256 "a3d1f48ae04e3f80a44d4c4db282f2cdf7288b05f74d5f902e1f752aa7264645"
  head "https://github.com/sachaos/todoist.git"

  depends_on "go" => :build

  def install
    (buildpath/"src/github.com/sachaos/todoist").install buildpath.children
    cd "src/github.com/sachaos/todoist" do
      system "go", "build", "-o", bin/"todoist"
    end
  end
end
