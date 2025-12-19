# fh — personal flake dev project scaffolder

Small, opinionated scaffolder that creates flake-based dev shells (default / rust / wasm).

This repo exports a Home Manager module:

```nix
imports = [
  inputs.fh.homeManagerModules.fh
];

programs.fh = {
  enable = true;
  # optional: override PS1 shown in generated dev shells
  PS1 = "\\[\\e[38;5;187m\\]┌─[\\u] [\\w] \\[\\e[38;5;181m\\][dev]\\[\\e[38;5;187m\\]\\n\\[\\e[38;5;187m\\]└─λ \\[\\e[0m\\]";
};
