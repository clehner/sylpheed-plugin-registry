function entry() {
	if (name) {
		print name "=" version "," url
	}
}

/^\[/ {
	entry()
	name = ""
	version = ""
	url = ""

	next
}

/^name=/ { name = substr($0, 6) }
/^version=/ { version = substr($0, 9) }
/^url=/ { url = substr($0, 5) }

END {
	entry()
}
