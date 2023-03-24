{ inputs, cell }:
let
  inherit (inputs) nixpkgs;
  l = nixpkgs.lib // builtins;
in
rec {
  rakeLeaves = dirPath:
    let
      seive = file: type:
        # Only rake `.nix` files or directories
        (type == "regular" && l.hasSuffix ".nix" file) || (type == "directory");

      collect = file: type: {
        name = l.removeSuffix ".nix" file;
        value =
          let path = dirPath + "/${file}";
          in
          if (type == "regular") || (type == "directory"
            && builtins.pathExists (path + "/default.nix")) then
            path
          # recurse on directories that don't contain a `default.nix`
          else
            rakeLeaves path;
      };

      files = l.filterAttrs seive (builtins.readDir dirPath);
    in
    l.filterAttrs (_n: v: v != { }) (l.mapAttrs' collect files);

  importRakeLeaves = path: args:
    l.mapAttrs
      (_: v:
        if (l.isFunction (import v))
        then import v args
        else import v)
      (cell.lib.rakeLeaves path);
}
