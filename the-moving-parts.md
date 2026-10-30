# The Moving Parts

By the end of this chapter you can point
at each part of a Kodi installation and
say what it holds — which turns most
later confusion into a named problem
with a known address.

## The program and your data are separate

Kodi the application is replaceable. You
can uninstall it, upgrade it, or install
a different version, and nothing personal
is lost, because everything personal
lives in one folder tree called the
**userdata** folder. On Linux it is
`~/.kodi/userdata`; Kodi also calls it
`special://masterprofile/`, a name you
will meet in its log. Inside it live:

- **guisettings.xml** — nearly every
  setting from the settings screens.
- **sources.xml** — the list of folders
  you have told Kodi to look at.
- **profiles.xml** — the user profiles
  (chapter 10).
- **Database/** — the library databases.
- **addon_data/** — each add-on's own
  settings and data.
- **Thumbnails/** — cached artwork.

Copy that one tree and you have copied
the whole installation's state; chapter
12 is built on this. The lab's first run
created the full tree from nothing, and
transcript `kodi-lab/transcripts/t01`
lists what appeared.

## The library databases

The library is a set of SQLite database
files in `userdata/Database/`. The lab's
Kodi 20.5 created these:

| File | Holds |
|---|---|
| `MyVideos121.db` | Films, TV shows, episodes, music videos |
| `MyMusic82.db` | The music library |
| `Addons33.db` | Which add-ons are installed and enabled |
| `Textures13.db` | The artwork cache index |
| `TV40.db`, `Epg16.db` | TV channels and programme-guide data (chapter 14) |
| `ViewModes6.db` | How each screen was last sorted and displayed |

The numbers are database *schema*
versions, and they change between Kodi
releases — a Kodi 21 machine's video
database has a different number. They
are useful as a warning: tools and forum
advice that name an exact database file
are talking about one Kodi version only.

Chapter 7 opens `MyVideos121.db` and
reads the library straight out of it.

## Sources, content and scrapers

Three ideas do all the library's work,
and mixing them up causes most beginner
trouble:

- A **source** is a folder Kodi may look
  in — nothing more. Adding a source does
  not put anything in the library.
- **Content** is what you declare the
  source to hold: films, TV shows, music
  videos, or none. This is set per source,
  and it decides how the files there are
  interpreted.
- A **scraper** is the add-on that turns
  a filename into a description. One
  scraper asks The Movie Database over
  the internet; the one this guide's lab
  used, called **Local information only**
  (add-on id `metadata.local`), reads
  small text files — **NFO files** —
  stored beside the media instead.

When you run a scan, Kodi walks the
sources, and for each file it asks the
scraper, "what is this?" The answers go
into the database. That is the whole
machine; chapter 7 watches it happen in
the log, line by line.

## Everything is an add-on

Kodi's own features arrive as **add-ons**:
the scrapers, the skins (the default skin
is called **Estuary**), the web interface
(**Chorus**, add-on id
`webinterface.default`), TV and radio
clients, subtitle services, screensavers.
The lab's build carried 131 bundled
add-ons before anything was installed.
Chapter 9 is about telling the ones you
can trust from the ones you cannot.

## The log

Kodi writes a running log to
`~/.kodi/temp/kodi.log` (the previous
run becomes `kodi.old.log`). Almost
every mystery in this guide — a scan
that found nothing, a profile that would
not load, a sound device that was not
there — was answered by a line in that
log, quoted verbatim where it matters.
When Kodi misbehaves, the log is the
first place to look; chapter 16 makes a
habit of it.
