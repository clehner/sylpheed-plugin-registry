plugin_version.txt: plugins.ini
	awk -f versions.awk <$< >$@
