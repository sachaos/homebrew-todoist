class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.15.0.tar.gz"
  sha256 "b7ffa14574bd241ab9e21a28f3d40c17b1a12250e89cfbc8ad708cfbfcdd84b3"
  head "https://github.com/sachaos/todoist.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"todoist"
  end
end
