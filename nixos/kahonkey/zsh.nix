{ config, lib, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autosuggestion.strategy = [ "completion" ];
    fastSyntaxHighlighting.enable = true;
    history.share = false;

    antidote = {
      enable = true;
      plugins = [
        "getantidote/use-omz"
        "ohmyzsh/ohmyzsh path:lib"
        "ohmyzsh/ohmyzsh path:plugins/gitignore"
        "ohmyzsh/ohmyzsh path:plugins/gradle"
        "ohmyzsh/ohmyzsh path:plugins/pip"
        "ohmyzsh/ohmyzsh path:plugins/qrcode"
        # "ohmyzsh/gradle"
        # "ohmyzsh/pip"
        # "ohmyzsh/qrcode"
        ""
      ];
    };

    dirHashes = {
      docs = "${config.home.homeDirectory}/Documents";
      prjs = "${config.home.homeDirectory}/Documents";
      pics = "${config.home.homeDirectory}/Pictures";
      dl = "${config.home.homeDirectory}/Downloads";
      conf = "${config.home.homeDirectory}/dotfiles";
    };

    # initContent = lib.mkMerge [ lib.mkOrder 500 "do something"; lib.mkOrder 1000 "do something"; ];
    initContent = ''
      							quotes=("To the end, just like I started." "Praise the Fool" "The Fool that doesn't belong to this Era" "I am free." "Life before death." "I am a count, not a saint." "I am the best programmer in the world. Two worlds even." "Let's make a bet. You and me." "You are an amazing guy Natsuki Subaru" "Let's make a bet. You and me. And the chips will be our wishes." "Despite everything it's still you" "Life before death" "I accept that there will be those I cannot protect")
      							random_quote=''\${quotes[RANDOM % ''\${#quotes[@]}]}
      							echo "$random_quote"
      							eval "$(starship init zsh)"

      							bindkey -v
      							export KEYTIMEOUT=1

      							# Change cursor shape for different vi modes.
      							function zle-keymap-select {
      								if [[ ''\${KEYMAP} == vicmd ]] ||
      									 [[ $1 = 'block' ]]; then
      									echo -ne '\e[1 q'
      								elif [[ ''\${KEYMAP} == main ]] ||
      										 [[ ''\${KEYMAP} == viins ]] ||
      										 [[ ''\${KEYMAP} = ''' ]] ||
      										 [[ $1 = 'beam' ]]; then
      									echo -ne '\e[6 q'
      								fi
      							}
      							zle -N zle-keymap-select
      							zle-line-init() {
      									echo -ne "\e[6 q"
      							}
      							zle -N zle-line-init
      							echo -ne '\e[6 q' # Use beam shape cursor on startup.
      							preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.
    '';
    # initContent = ''
    #               quotes=("To the end, just like I started." "Praise the Fool" "The Fool that doesn't belong to this Era" "I am free." "Life before death." "I am a count, not a saint." "I am the best programmer in the world. Two worlds even." "Let's make a bet. You and me." "You are an amazing guy Natsuki Subaru" "Let's make a bet. You and me. And the chips will be our wishes." "Despite everything it's still you" "Life before death" "I accept that there will be those I cannot protect")
    #               random_quote=''\${quotes[RANDOM % ''\${#quotes[@]}]}
    #               echo "$random_quote''\n''\n"
    #               eval "$(starship init zsh)"
    #
    #   						bindkey -v
    #         			export KEYTIMEOUT=1
    #
    #         			# Change cursor shape for different vi modes.
    #         			function zle-keymap-select {
    #         				if [[ ''\${KEYMAP} == vicmd ]] ||
    #         					 [[ $1 = 'block' ]]; then
    #         					echo -ne '\e[1 q'
    #         				elif [[ ''\${KEYMAP} == main ]] ||
    #         						 [[ ''\${KEYMAP} == viins ]] ||
    #         						 [[ ''\${KEYMAP} = ''' ]] ||
    #         						 [[ $1 = 'beam' ]]; then
    #         					echo -ne '\e[6 q'
    #         				fi
    #         			}
    #         			zle -N zle-keymap-select
    #         			zle-line-init() {
    #         					echo -ne "\e[6 q"
    #         			}
    #         			zle -N zle-line-init
    #         			echo -ne '\e[6 q' # Use beam shape cursor on startup.
    #         			preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.
    # '';
  };
}
