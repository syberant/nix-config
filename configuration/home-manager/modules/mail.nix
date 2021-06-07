{ lib, pkgs, config, ... }:

let
  emailBase = address: {
    inherit address;
    realName = "Sybrand Aarnoutse";
    passwordCommand = "pass show mail/${address}";

    notmuch.enable = true;
    mbsync.enable = true;
    msmtp.enable = true;

    neomutt.enable = true;
    astroid.enable = true;
  };
  # TODO: use lieer for gmail accounts
  # This uses a better supported and more future proof authentication method
  gmailBase = address: emailBase address // { flavor = "gmail.com"; };
in {
  accounts.email.accounts = {
    neuralcoding = emailBase "sybrand@neuralcoding.com" // {
      primary = true;

      userName = "sybrand@neuralcoding.com";
      smtp = { host = "mail3.sohosted.com"; };
      imap = { host = "mail3.sohosted.com"; };
    };

    gmail = gmailBase "sybrandaarnoutse@gmail.com";
    spam = gmailBase "sybrand.s.y.b@gmail.com" // { realName = "Sybrand"; };

    # https://wiki.icis-intra.cs.ru.nl/Email#Local_Email_client_using_IMAP.2FSMTP
    # radboud = emailBase "sybrand.aarnoutse@student.ru.nl" // {
      # # userName = "ru\\u1064134";
      # userName = "s1064134";
      # passwordCommand = "pass show mail.ru.nl";

      # imap.host = "mail.ru.nl";
      # smtp = {
        # host = "smtp-auth.ru.nl";
        # port = 587;
        # tls.useStartTls = true;
      # };
    # };

    science = emailBase "sybrandaarnoutse@science.ru.nl" // {
      userName = "sybrandaarnoutse";
      passwordCommand = "pass show radboud/science-account";

      smtp = {
        host = "smtp.science.ru.nl";
        port = 25;
        tls.useStartTls = true;
      };
      imap = { host = "post.science.ru.nl"; };
    };
  };

  # TUI viewer
  programs.neomutt = {
    enable = true;
    vimKeys = true;

    sidebar = {
      enable = true;
      format = "%B%?F? [%F]?%* %?N?%N/?%S";
    };

    extraConfig = let
      gruvbox = pkgs.fetchFromGitHub {
        owner = "shuber2";
        repo = "mutt-gruvbox";
        rev = "347272ca9362fe62c9ff199c61e415692a96774e";
        sha256 = "sha256-8q54liulKP0okiS9YED4tw9EYQcyrqgiIHtHSgK1mO4=";
      };
    in ''
      set mail_check_stats

      # Gruvbox
      source ${gruvbox}/colors-gruvbox-shuber.muttrc
      source ${gruvbox}/colors-gruvbox-shuber-extended.muttrc
    '';
  };

  # GUI viewer
  programs.astroid = {
    enable = true;

    pollScript = ''
      export NOTMUCH_CONFIG=/home/sybrand/.config/notmuch/notmuchrc

      mbsync -a
      notmuch new
    '';

    # https://github.com/astroidmail/astroid/wiki/Configuration-Reference
    extraConfig = {
      astroid.notmuch_config = "/home/sybrand/.config/notmuch/notmuchrc";
      astroid.hints.level = -1;

      # TODO: setup vim to write mails
      # - use mail filetype
      editor = {
        external_editor = true;
        cmd = "st -e nvim %1";
        # TODO: Use embedded editor
        # external_editor = false;
        # cmd = "st -w %3 -e nvim %1";
      };

      thread_view.preferred_type = "html";
      # TODO: markdown
      # editor.markdown_processor = "pandoc --something";
      mail.close_on_success = true;

      startup.queries = {
        # ALL = "";
        UNREAD = "tag:unread and not tag:deleted and not tag:muted";
        TODO = "tag:TODO";
        " neuralcoding" = "path:neuralcoding/**";
        " gmail" = "path:gmail/**";
        " spam" = "path:spam/**";
        # " radboud" = "path:radboud/**";
        " science" = "path:science/**";
      };
    };
  };

  # For tagging mail
  programs.notmuch = {
    enable = true;
    new.tags = [ "unread" "inbox" "new" ];
    hooks.postNew = ''
      notmuch tag --batch <<EOF
        +github tag:new and from:github

        # Processed these emails, clear 'new' tag
        -new tag:new
      EOF
    '';
  };
  home.sessionVariables."NOTMUCH_CONFIG" =
    "/home/sybrand/.config/notmuch/notmuchrc";

  # For downloading mail
  # TODO: fix errors
  # - https://github.com/nix-community/home-manager/pull/1360
  programs.mbsync.enable = true;

  # For sending mail
  programs.msmtp.enable = true;

  # Stateful setup:
  # - download all mail: mbsync -a
  # - init notmuch: notmuch new
}
