_:

{
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
        lg =
          "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        st = "status -s";
        undo = "reset HEAD~1 --mixed";
      };

      extraConfig = {
        github.user = "walkah";
        init.defaultBranch = "main";
        pull.rebase = true;
        rebase.autoStash = true;
      };

      signing = {
        key = "8896FEC44D47A81C";
        signByDefault = true;
      };
    };
  };
}
