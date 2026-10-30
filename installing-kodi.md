# Installing Kodi

By the end of this chapter Kodi is
installed and you have run the one
command that proves which version you
actually got — because with Kodi, the
honest first question is never "is it
installed?" but "which Kodi is it?".

## The version landscape, stated plainly

Kodi development moves in named major
versions. As this guide was written
(October 2026):

- The current stable release is
  **21.3 "Omega"**.
- **22 "Piers"** is in pre-release —
  its first release candidate appeared
  in October 2026 — and is for testers,
  not living rooms.
- The lab ran **20.5 "Nexus"**, the
  build Ubuntu 24.04's repositories
  ship: two major versions behind the
  stable release.

That gap is normal for Kodi, and it is
the single most useful fact in this
chapter. **Where you get Kodi decides
which Kodi you get:**

- A Linux distribution's own packages
  are convenient and can lag by one or
  two major versions, as Ubuntu's do.
- Kodi's own downloads (kodi.tv), the
  Flatpak on Flathub, and the app stores
  carry Team Kodi's current stable
  build.
- An older Kodi is not a broken Kodi —
  the lab's 20.5 did everything this
  guide demonstrates — but add-ons are
  built per major version, and advice
  written for one version's menus may
  not match another's. When something in
  this guide looks different on your
  screen, a version gap is the first
  suspect.

## Linux — the route the lab ran

On Debian and Ubuntu, the distribution
build is one command:

```console
$ sudo apt install kodi
$ kodi --version
Kodi from Debian Media Center 20.5 Debian package version: 2:20.5+dfsg-1ubuntu1
Copyright (C) 2005-2021 Team Kodi from Debian - http://kodi.tv
```

That version output is real: it is the
first line of transcript
`kodi-lab/transcripts/t00`. The lab
itself took one deliberate detour — it
downloaded the same Ubuntu packages and
unpacked them into a folder instead of
installing them system-wide, because the
lab machine is shared and the guide's
rule is to leave no trace outside its
own workspace. The binary that ran was
the distribution's own, unmodified;
`criteria.md` records the detail. On
your own machine, the plain `apt
install` above is the right way.

For a newer Kodi on Linux, the Flathub
Flatpak (`tv.kodi.Kodi`) carries Team
Kodi's stable build. The trade is the
usual Flatpak one: a bigger download
and a sandboxed view of your folders,
which you widen with Flatpak's
permissions when you add sources outside
your home directory.

## The other platforms — documented only

The lab had no Windows, macOS or Android
machine, so these routes are described
from Team Kodi's download pages, not
demonstrated:

- **Windows**: the installer from
  kodi.tv, or the Microsoft Store. The
  Store build can lag the direct
  download, as Kodi's own release notes
  warn.
- **macOS**: the disk image from
  kodi.tv, dragged to Applications like
  any other app.
- **Android and Android TV**: Google
  Play carries Kodi for most devices.
  Amazon's Fire TV devices need
  sideloading, and the newest Fire TV
  Sticks — the third-generation 4K model
  released in September 2026 — run a new
  system (Vega OS) that **cannot install
  Kodi at all**. If you are buying a
  stick for Kodi, that one fact is worth
  the price of this chapter.
- **Dedicated boxes**: LibreELEC and
  OSMC are small Linux systems whose
  whole job is running Kodi on a
  Raspberry Pi or similar board — worth
  knowing they exist if a television is
  the only screen involved.

## The check

Whatever route you took:

```console
$ kodi --version
```

On a machine installed from a store or
an installer, the same information is
on Kodi's System Information screen —
and the version it reports is the
version every later chapter of this
guide should be read against.
