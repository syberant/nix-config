{ pkgs, name, derivation, binPath ? name, defaultFlags ? [] }:

pkgs.lib.makeOverridable ({ flags }: pkgs.symlinkJoin {
	inherit name;
	buildInputs = [ pkgs.makeWrapper ];
	paths = [ derivation ];
	postBuild = "wrapProgram \"$out/bin/${binPath}\"" +
		(builtins.foldl' (acc: fl: acc + " --add-flags \"${fl}\"") "" flags);
}) { flags = defaultFlags; }
