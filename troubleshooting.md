# Troubleshooting

Ordered by how often each one actually
happens. Every entry ends with the check
that settles it, and several end in the
lab, because the lab met them personally.

## The scan ran and nothing appeared

The classic. Work through it in order:

1. **Was content set on the source?** A
   source with content "None" is only
   browsed, never scanned into the
   library. Check via the source's
   context menu → Edit source / Change
   content (chapter 5).
2. **Was it set to the right kind?**
   Films interpreted as TV shows (or the
   reverse) match almost nothing. Same
   place, same fix.
3. **Do the names claim the right
   things?** Chapter 6. Open the Files
   view: if the files play from there,
   Kodi can see them and the problem is
   matching, not access.
4. **Read the log.** `~/.kodi/temp/kodi.log`
   narrates every scan — which folders
   it walked, what the scraper answered.
   "No information found" beside your
   folder is the scanner telling you the
   claim failed.

## The home screen says the library is empty — but it isn't

The lab photographed this one. Its home
screen read "Your library is currently
empty" *after* a successful scan, while
the Movies section itself listed all
three films (`kodi-lab/screenshot-home.png`
and `screenshot-movies.png` are minutes
apart). The home screen's placeholder is
drawn from a cached view and can lag a
scan that finished behind its back.
**The check:** open the section itself
(Movies → Titles) before concluding
anything. If the section lists your
media, the library is fine and the home
screen will catch up.

## A show is dated 1970, or wears the wrong year

For local/NFO libraries, the show's date
comes from `<premiered>` in `tvshow.nfo`
— a full date — not from `<year>`,
which is the movie element. The lab's
show arrived at 1970-01-01 carrying a
`<year>` and reported 2022 after the one
element was swapped (transcripts `t03`,
`t06`). For online-scraped shows, a wrong
year is nearly always the folder's year
disagreeing with the database's first
air date: check the name first.

## A film is filed as a different film

The filename claimed the other title, or
the year is missing and the title is
shared by several films. Add the year
(chapter 6), remove the item from the
library, rescan. If it persists, the
scraper is choosing between near-matches:
use an NFO file to settle it outright —
an NFO beside the file outranks the
scraper's guesses.

## Buffering on network playback

In the order it actually is:

1. **The network**: a film that plays
   fine copied locally and buffers from
   the share has named its culprit. Wi-Fi
   through walls is the usual one.
2. **The source**: a busy NAS, a sleeping
   USB drive, another job saturating the
   same disk.
3. **The device**: software decoding a
   heavy file (chapter 15) can look
   exactly like buffering — the clock
   stalls because the picture cannot be
   drawn in time. Play the same file from
   local storage and watch whether the
   stalls follow the file or the route.

Cache settings (chapter 11) come a
distant fourth, whatever the forums say:
they change how much Kodi reads ahead,
not how fast the share can serve.

## No sound

Kodi reports the audio chain in its log
at every start. Find the sink lines:

```console
$ grep -i 'sink\|audio' ~/.kodi/temp/kodi.log | tail
```

The lab's machine had no audio device
at all — `no sink was returned` — and
that is the bottom of the well: nothing
downstream can fix a device that does
not exist. On a real setup the same
lines name your TV, receiver or
soundbar; if they name a device you did
not expect, **Settings → System →
Audio** is where the output device is
chosen, and a receiver that was asleep
when Kodi started is the classic reason
it chose something else.

## An add-on refuses to install, or vanished after an upgrade

Almost always a version fact: the add-on
declares the Kodi majors it supports,
and chapter 3's drift means your
installed Kodi may not be among them —
the repository hides incompatible
add-ons by default, which reads as
"vanished". Check your version
(`kodi --version`, or System
Information) against the add-on's page
before suspecting corruption. For
zip-installed add-ons, ask chapter 9's
question first: whose zip was it?

## A profile will not load

The log names the half that failed.
`unable to load settings for profile`
with a mapping line above it (the lab's
transcript `t05`) means Kodi resolved
the profile's directory and found
nothing usable there — an entry without
its folder, or a folder whose settings
file is damaged. Create profiles in the
GUI so both halves are born together;
repair by restoring the profile's folder
from your chapter 12 backup, not by
editing `profiles.xml` at midnight.

## Kodi will not start at all after hand-editing files

A malformed `advancedsettings.xml` is
ignored with a note in the log; a
malformed `guisettings.xml` or
`profiles.xml` can cost you the startup.
The recovery is the same for all three:
close Kodi, rename the suspect file,
start Kodi. It rebuilds defaults for
the missing file, and the renamed one
is there to diff against your backup.
Which is the last word of this chapter
and of chapter 12: **the log first, the
backup second, the forums third.**
