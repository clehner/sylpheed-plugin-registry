function entry() {
	if (name) {
		print name "=" version "," url
	}
	for (lang in names) {
		print names[lang] "=" version "," url
	}
}

/^\[/ {
	entry()
	name = ""
	version = ""
	url = ""
	delete names

	next
}

/^version=/ { version = substr($0, 9) }
/^url=/ { url = substr($0, 5) }
/^name=/ { name = substr($0, 6) }
/^name\[.*\]=/ && match($0, /]=/) {
	names[substr($0, RSTART - 2, 2)] = substr($0, RSTART + 2)
}

END {
	entry()
}
