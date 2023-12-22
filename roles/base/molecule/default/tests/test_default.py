PACKAGE_LIST = [
  "xclip",
  "tldr",
  "progress",
  "tree",
  "rsync",
  "rclone",
  "prettyping",
  "bat",
  "ncdu",
  "neovim",
  "zsh",
  "jq",
  "fzf",
  "neofetch",
  "tmux",
  "fd-find",
  "ripgrep",
  "stow",
  "python3-venv",
  "python3-pip",
  "unzip",
  "youtube-dl",
  "age"
]

def test_ubuntu(host):
    assert host.ansible("setup")["ansible_facts"]["ansible_distribution"] == "Ubuntu"

def test_user_created(host):
    assert host.user("mvaldes").exists

def test_package_installed(host):
    for package in PACKAGE_LIST:
        assert host.package(package).is_installed
