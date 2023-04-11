class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.19.0.tar.gz"
  sha256 "acf91e168abe7d251a68ae87b1943a1f83ef3b7fd89e4f56bd82cb3db51b6ade"
  head "https://github.com/sachaos/todoist.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"todoist"
    
    zsh_completion.install "todoist_functions.sh" => "_todoist_peco"
    zsh_completion.install "todoist_functions_fzf.sh" => "_todoist_fzf"
  end
end
