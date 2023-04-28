class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.20.0.tar.gz"
  sha256 "cd496259a37f1b9868eddcc3d3f83b63b82eb94b7ab4830ad3f490fed51a5918"
  head "https://github.com/sachaos/todoist.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"todoist"
    
    zsh_completion.install "todoist_functions.sh" => "_todoist_peco"
    zsh_completion.install "todoist_functions_fzf.sh" => "_todoist_fzf"
  end
end
