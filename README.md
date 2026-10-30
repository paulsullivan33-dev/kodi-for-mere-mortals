# Kodi for Mere Mortals

Most media software wants to sell you a
subscription or show you a catalogue.
**Kodi** does the opposite job: it takes
the media files you already own — films
ripped from your discs, home videos, a
music collection, recordings gathering
dust in folders — and turns them into a
library with posters, plots and order,
on a screen built to be read from the
couch. It is free, open source, brings
no content of its own, and asks nothing
from the cloud unless you invite it.

This guide explains how Kodi's library
really works — sources, scrapers and
the database underneath — and then does
the thing most Kodi writing skips: it
**shows its working**. The lab that
wrote this guide had no television, no
remote and no speakers. So every claim
is checked some other way instead: the
library read straight out of its
database file, the player driven over
Kodi's own network interface with its
clock measured second by second, a
second profile loaded and counted, and
— once — the entire video database
deleted, to see what a rescan could
rebuild from the files alone. (Almost
everything. The answer is in chapter 7.)

The lab ran **Kodi 20.5**, the build
Ubuntu 24.04 ships — two major versions
behind the current stable release,
21.3 "Omega", a gap chapter 3 treats as
the useful fact it is. Against it the
lab built a library from five tiny
invented films and episodes: generated
test clips with fictional descriptions
written by hand in NFO files, filed by
the scraper that reads local files and
never touches the network. It enabled
the web interface and drove Kodi by
JSON-RPC — scanning, listing, playing,
switching profiles, and finally shutting
Kodi down with a command. It broke one
thing on purpose and one by accident: a
profile whose folder did not exist,
whose failure is chapter 10's lesson,
and a TV show dated 1970 by one wrong
XML element, whose fix is chapter 7's.

What the lab could not do, it did not
fake. It could not watch a film on a
television, hear a note of sound (its
machine had no audio device at all —
Kodi's log says so, and the guide quotes
it), test live TV, or try the phone
remote. Those parts are taught from
Kodi's documentation and labelled as
such wherever they appear. `criteria.md`
keeps the full ledger of what was run
and what was only read.

## What this guide covers

- [**What Kodi is**](what-kodi-is.md) —
  a player and librarian for your own
  files, not a streaming service, and
  the piracy elephant named plainly
- [**The moving parts**](the-moving-parts.md) —
  the userdata folder, the library
  databases, sources, content and
  scrapers, and the log
- [**Installing Kodi**](installing-kodi.md) —
  which Kodi you actually get from each
  place you can get it, and the version
  check that proves it
- [**First Run**](first-run.md) — the
  home Kodi builds, the Estuary home
  screen, hidden settings levels, and
  errors that are about your machine
- [**Adding Your Media**](adding-your-media.md) —
  sources and the Set content dialog,
  and the records the dialog writes
- [**Naming Files So the Library Finds Them**](naming-files.md) —
  title-and-year folders, SxxExx
  episodes, and what Kodi probes from
  the file itself
- [**The Library and Its Databases**](the-library.md) —
  how a scan thinks, the local scraper
  and NFO files, the `<premiered>`
  lesson, and the rebuild from nothing
- [**The Web Interface and Remotes**](web-interface-and-remotes.md) —
  Chorus in a browser, the JSON-RPC
  remote underneath, phone remotes, and
  the port you must never forward
- [**Add-ons — Official and Otherwise**](add-ons.md) —
  the official repository, the zip-file
  door, and the one safety rule
- [**Profiles**](profiles.md) — separate
  worlds for separate people, the folder
  plus the list entry, and the load that
  failed until both halves existed
- [**Advanced Settings, Honestly**](advanced-settings.md) —
  the settings file with no screen, the
  three lines worth having, and the
  folklore labelled
- [**Backing Up and Moving Kodi**](backing-up.md) —
  the one folder that is Kodi, and the
  NFO export that is its second string
- [**Recipes**](recipes.md) — a network
  share, a children's profile, the fully
  offline library, scripting Kodi, and
  un-misreading a show
- [**The Neighbours**](the-neighbours.md) —
  Jellyfin the server, Plex, the
  single-file players, live TV backends,
  and the zero-library option
- [**Limits**](limits.md) — no content,
  literal-minded matching, one box one
  library, device-bound playback, and
  version drift
- [**Troubleshooting**](troubleshooting.md) —
  the empty scan, the lying home screen,
  the 1970 show, buffering in the right
  order, and the missing sound
- [**Glossary**](glossary.md) — the
  terms, collected in one place

## What it doesn't cover

Getting media: ripping discs, recording
TV and downloading are other tools'
jobs, with their own guides in this
series and elsewhere. Third-party
add-ons and "builds" are covered only
to be warned against, in chapters 1 and
9 — this guide installs none and
recommends none. Skins beyond the
default are named, not toured. And
Kodi on game consoles and exotic
hardware is left to the forums that
know it.

## How to use this guide

Read chapters 1 and 2 for the model —
what Kodi is, and which part holds what.
Chapters 3 to 5 get you an installed
Kodi with your folders added; chapter 6
is the one to read before you scan
anything you care about, because names
decide outcomes. Chapter 7 is the heart:
read it slowly and the rest of Kodi
stops being mysterious. The lab's
transcripts live in `kodi-lab/transcripts/`
(t00 to t06), its fixture script is
`kodi-lab/make-fixtures.sh`, and its two
screenshots — the empty home screen and
the library it claimed not to have — are
`kodi-lab/screenshot-home.png` and
`kodi-lab/screenshot-movies.png`.

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [Jellyfin for Mere Mortals](https://paulsullivan33-dev.github.io/jellyfin-for-mere-mortals/)
- [ffmpeg for Mere Mortals](https://paulsullivan33-dev.github.io/ffmpeg-for-mere-mortals/)
- [HandBrake for Mere Mortals](https://paulsullivan33-dev.github.io/handbrake-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/kodi-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/kodi-for-mere-mortals/blob/main/LICENSE-CODE).
