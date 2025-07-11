let
	# Only use this on my macbook air!
	diskId = "ata-APPLE_SSD_SD0128F_1452LQ400394";
in {
disko.devices = {
disk.main = {
	type = "disk";
	device = "/dev/disk/by-id/${diskId}";
	content = {
		type = "gpt";
		partitions.ESP = {
			size = "1G";
			type = "EF00";
			content = {
				type = "filesystem"; format = "vfat"; mountpoint = "/boot"; mountOptions = [ "umask=0077" ];
			};
		};
		partitions.zfs = {
			size = "100%";
			content = { type = "zfs"; pool = "zroot"; };
		};
	};
};
zpool.zroot = {
	type = "zpool";
	options.ashift = "12";
	rootFsOptions = {
		acltype = "posixacl";
		atime = "off";
		compression = "zstd";
		mountpoint = "none";
		xattr = "sa";
	};

	datasets = {
		"local" = { type = "zfs_fs"; options.mountpoint = "none"; };
		"local/var" = {
			type = "zfs_fs";
			options.mountpoint = "none";
			options."com.sun:auto-snapshot" = "false";
		};
		"local/nix" = {
			type = "zfs_fs";
			mountpoint = "/nix";
			options."com.sun:auto-snapshot" = "false";
		};

		"local/persist" = {
			type = "zfs_fs";
			mountpoint = "/persist";
			options."com.sun:auto-snapshot" = "true";
		};
		"local/home" = {
			type = "zfs_fs";
			mountpoint = "/home";
			options."com.sun:auto-snapshot" = "true";
		};

	};
};
};
}
