class Todoist < Formula
  desc "Todoist CLI client"
  homepage "https://github.com/sachaos/todoist"

  url "https://github.com/sachaos/todoist/archive/v0.17.0.tar.gz"
  sha256 "fb38315819aaa345fb808b6ac7e4943cd31b206efda2f655093c2b6af48edf74"
  head "https://github.com/sachaos/todoist.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"todoist"
    
    zsh_completion.install "todoist_functions.sh" => "_todoist_peco"
    zsh_completion.install "todoist_functions_fzf.sh" => "_todoist_fzf"
  end
end
