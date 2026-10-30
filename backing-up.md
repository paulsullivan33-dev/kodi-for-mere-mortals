# Backing Up and Moving Kodi

By the end of this chapter you have a
backup that can actually rebuild your
Kodi — and you know which half of it
most backups forget.

## The one-folder truth

Chapter 2 established it and chapter 7
proved what it means: everything Kodi
knows about you lives in the **userdata
tree** (`~/.kodi` on Linux — back up the
whole folder, not just `userdata/`
inside it, so add-on program data and
the folder layout travel too). Settings,
sources, profiles, add-on data, the
library databases, the artwork cache:
all of it is files in that tree.

So the backup is a copy, made **while
Kodi is closed** — the databases are
SQLite files and copying one mid-write
is how a backup quietly contains a torn
page:

```console
$ tar -czf kodi-backup-2026-10-30.tar.gz -C ~ .kodi
```

Restoring is the same shape in reverse:
install Kodi, run it once so it builds
its tree, close it, replace the tree
with yours, start it again. Chapter 4's
first run is the scaffolding; your
archive is the furniture.

## The half that copy forgets: where the media went

A restored Kodi reads its sources from
`sources.xml`, and the sources name
*paths*. Move from a laptop to a TV box,
or plug the archive drive into a
different letter or mount point, and the
library is intact and entirely pointed
at folders that are not there. Nothing
is lost — the media files are wherever
you put them — but the paths must be
reconciled: edit the sources (and let
the database follow, via the source's
context menu, or by removing and
re-adding sources at the new path and
rescanning). Plan a move as "copy the
tree, then fix the addresses", and it
holds no surprises.

## The second string: NFO files as a library that backs itself up

Chapter 7's rebuild is the deeper
insurance. Kodi can **export** its
library — Settings → Media → Library →
Export library — writing an NFO file
(and optionally artwork) beside every
film, show and episode. From that day:

- Any Kodi, on any machine, can rebuild
  the library from the media folders
  alone, with the local-information
  scraper — descriptions, artwork and
  all — exactly as the lab's fresh
  database was rebuilt from five NFO
  files in transcript `t06`.
- The export also carries watched ticks
  and resume points into the NFO files,
  and chapter 11's `importwatchedstate`
  setting brings them home on import.
  Without the export, those live only
  in the database, and a lost database
  loses them: the one thing in Kodi
  that cannot be re-derived from the
  files.

The tidy regime is therefore two-deep
and cheap: **copy `.kodi` for the
installation's state; keep the library
exported to NFO files for the library's
soul.** Either alone restores most of
Kodi. Together they restore all of it,
onto different hardware, at a different
address, years later.

## What not to back up this way

The media itself, obviously — the
archive above holds descriptions and
state, not films; a media library needs
its own backup, sized in terabytes
rather than megabytes, and no advice in
this guide substitutes for it. And the
program: never archive the installed
application expecting it to run later.
Install fresh, restore the tree. Kodi
is free and the tree is the part that
was ever yours.
