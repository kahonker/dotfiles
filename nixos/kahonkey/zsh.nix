{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    fastSyntaxHighlighting.enable = true;

    antidote = {
      enable = true;
    };

    defaultKeymap = "vicmd";
    dirHashes = {
      docs = "$\{config.home.homeDirectory}/Documents";
      prjs = "$\{config.home.homeDirectory}/Documents";
      pics = "$\{config.home.homeDirectory}/Pictures";
      dl = "$\{config.home.homeDirectory}/Downloads";
      conf = "$\{config.home.homeDirectory}/dotfiles";
    };

    initContent = ''
      			quotes=("To the end, just like I started." "Praise the Fool" "The Fool that doesn't belong to this Era" "I am free." "Life before death." "I am a count, not a saint." "I am the best programmer in the world. Two worlds even." "Let's make a bet. You and me." "You are an amazing guy Natsuki Subaru" "Let's make a bet. You and me. And the chips will be our wishes." "Despite everything it's still you" "Life before death" "I accept that there will be those I cannot protect")
      			random_quote=$\{list[RANDOM % $\{#list[@]}]}
      			echo "$random_quote\n\n"
      		'';
  };
}
