{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    ocaml
    opam
    dune_3
    exercism
    ocamlPackages.ocaml-lsp
    ocamlPackages.utop
    ocamlPackages.ounit2
    ocamlPackages.base
    ocamlformat
  ];

  shellHook = ''
    echo "OCaml dev environment ready!"
    echo "  ocaml:   $(ocaml --version 2>/dev/null || echo 'not found')"
    echo "  opam:    $(opam --version 2>/dev/null || echo 'not found')"
    echo "  dune:    $(dune --version 2>/dev/null || echo 'not found')"
    echo "  utop:    $(utop -version 2>/dev/null || echo 'not found')"
  '';
}
