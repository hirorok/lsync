----
-- User configuration file for lsyncd.
--
-- Simple example for default rsync.
--
settings {
	statusFile = "/tmp/lsyncd.stat",
	statusInterval = 1,
	logfile = "/var/log/lsyncd.log",
	maxProcesses = 2,
	insist = 1,
}

servers ={
	"10.0.2.5",
	"10.0.2.6"
}
for _, server in ipairs(servers) do
sync{
	default.rsync,
	source	= "/media/storage",
	target	= server .."::storage",
	rsync = {
		verbose = true,
		chmod=666,
		owner = true,
		group = true,
		compress = true,
		perms = true,
		_extra ={"-a"},
	}
}
end
