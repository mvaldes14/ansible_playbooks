USERNAME = "mvaldes"
GIT_BASE_PATH = f"/home/{USERNAME}/git"
NEOVIM_VERSION = "0.11.4"
GIT_REPOS = [
    "terraform",
    "terraform.nvim",
    "dotfiles",
    "dotfiles-nix",
    "ansible_playbooks",
    "blog",
    "twitch-bot",
    "chef",
    "pulumi",
    "k8s-apps",
]

def test_ubuntu(host):
    assert host.ansible("setup")["ansible_facts"]["ansible_distribution"] == "Ubuntu"

def test_user_created(host):
    assert host.user(USERNAME).exists

def test_git_path_exists(host):
    assert host.file(f"/home/{USERNAME}/git").exists

def test_git_repos_cloned(host):
    for repo in GIT_REPOS:
        assert host.file(f"/home/mvaldes/git/{repo}").exists

def test_neovim_version(host):
    if neovim := host.run("nvim --version"):
        assert NEOVIM_VERSION in neovim.stdout

