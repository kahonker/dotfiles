{
  autoCmd = [
    {
      event = "FileType";
      pattern = [
        "nix"
      ];
      command = "setlocal shiftwidth=2 tabstop=2 noexpandtab";
    }
    {
      event = "FileType";
      pattern = [
        "python"
      ];
      command = "setlocal shiftwidth=4 tabstop=4 noexpandtab";
    }
    {
      event = "FileType";
      pattern = [
        "java"
      ];
      command = "setlocal shiftwidth=8 tabstop=8 noexpandtab";
    }
  ];
}
