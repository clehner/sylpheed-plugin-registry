# Sylpheed Plug-in Registry

This is a place where developers can share and publish their Sylpheed plug-ins,
and users can find new and updated plug-ins.

## Using the registry

To access the plug-in registry from Sylpheed, install the plugin called [Sylpheed Plug-in Registry Plug-in][sprp].

## Adding a plug-in to the registry

Edit the `plugins.ini` file in this repository to include your plug-in. The
format is a GLib key file, with one group per plug-in.

```ini
[plugin_id] # typically the base name of the library file
name=Plug-in Name # corresponds to the name field of the plugin struct
description=One or two lines describing the plugin
author=Your Name
license=SPDX ID of the license of the plug-in
version=0.0.0 # latest available plug-in version
url=web site for the plug-in, where the source can be obtained
OS-ARCH_url=url for library on platform OS and architecture ARCH
OS-ARCH_sha1sum=hash of the content at the corresponding URL
```

The file format can include a URL and SHA1 sum pair for each combination of
operating systems and architectures that you can produce a binary for. When
the Registry Plug-in is run, plug-ins that have a binary listed for the current
operating system and architecture will have an Install button that downloads
and installs them locally.

To keep the `plugin_version.txt` file up to date (which is used for Sylpheed's
built-in plugin version checking), run `make` after modifying `plugins.ini` and
before commiting your change.

[sprp]: https://github.com/clehner/sylpheed-plugin-registry-plugin
