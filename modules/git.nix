_:

{
  # Allowed signers for git commit signing (referenced below).
  home.file.".ssh/allowed_signers".text = "walkah@walkah.net ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOxgkaPcUYkMjk7SEBFrYpJ2mGK+8iPgLYwV+XpNp5Nl";

  programs = {
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };

    git = {
      enable = true;
      userName = "James Walker";
      userEmail = "walkah@walkah.net";

      aliases = {
        ignore = "!gi() { curl -L -s https://www.gitignore.io/api/$@ ;}; gi";
        lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        smu = "submodule update --init --recursive";
        st = "status -s";
        undo = "reset HEAD~1 --mixed";
      };

      extraConfig = {
        commit.gpgsign = true;
        github.user = "walkah";
        gpg.format = "ssh";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        init.defaultBranch = "main";
        pull.rebase = true;
        rebase.autoStash = true;
        user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOxgkaPcUYkMjk7SEBFrYpJ2mGK+8iPgLYwV+XpNp5Nl";
      };
    };
  };
}
