class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.18.0.tar.gz"
  sha256 "2cc89bdf44d5a9bda6f748069cf8841e10e3b0c14dd4ddb17d5b1f7a7bc7d759"
  head "https://github.com/sachaos/todoist.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"todoist"
    
    zsh_completion.install "todoist_functions.sh" => "_todoist_peco"
    zsh_completion.install "todoist_functions_fzf.sh" => "_todoist_fzf"
  end
end
