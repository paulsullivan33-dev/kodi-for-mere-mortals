# Adding Your Media

By the end of this chapter your folders
of media are sources, Kodi knows what
kind of thing each folder holds, and a
first scan has been set in motion. This
is the chapter the empty home screen
asked for.

## The two halves of the job

Adding media is two different decisions
that the interface walks you through as
one:

1. **Where the files are** — the source.
2. **What the files are** — the content
   type and the scraper that will
   describe them.

Both halves are stored, and chapter 2
showed where: the source list in
`userdata/sources.xml`, and the content
declaration in the video database. The
lab set both by writing exactly the
records the dialog writes, so this
chapter can show them to you as facts
rather than screenshots.

## The walk-through

From the home screen: **Videos → Files →
Add videos…**. Browse to the folder —
a folder on this machine, or a network
location (SMB and NFS shares are offered
in the same browser) — give the source a
name, and confirm. Kodi then asks the
question that matters, in a dialog
titled **Set content**:

- **This directory contains**: Movies,
  TV shows, Music videos, or None.
- **Choose information provider**: the
  scraper. The movie and TV defaults ask
  The Movie Database over the internet.
  **Local information only** reads NFO
  files beside the media instead —
  chapter 7 is built on it, and it is
  the right choice for home video, odd
  recordings, and anything no database
  has heard of.
- Options that match your layout, of
  which the one that matters is
  **"Movies are in separate folders that
  match the movie title"** — chapter 6
  explains why the lab's library, and
  most tidy libraries, want it on.

Choose wrongly here and the scan still
runs — it just interprets every filename
as the wrong kind of thing, which is the
number one cause of the empty-library
mystery in chapter 16. The setting can
be changed afterwards from the source's
context menu (**Change content**), so a
mistake is a detour, not a disaster.

## What you actually wrote down

Here is the lab's source list, verbatim
from its `sources.xml` — this is all a
source is:

```xml
<source>
    <name>Lab Movies</name>
    <path pathversion="1">/home/hatch/workspace/kodi-labwork/media/Movies/</path>
    <allowsharing>true</allowsharing>
</source>
```

And here, in words, is the content
record the lab set for it, exactly the
fields the Set content dialog controls:
the path, content type **movies**,
scraper **metadata.local**, "scan
recursively" on, "use folder names" on.
For the TV source: content type
**tvshows**, same scraper, folder names
off (episode files carry the show's
identity, not their folders — chapter 6
again).

The lab is a machine room, so it wrote
these records with a text editor and a
database command instead of a remote
control. That is the only step in this
guide performed by hand rather than by
clicking, and it is disclosed here
because it matters for how you read the
evidence: **everything the clicking
causes — the scan, the matching, the
library — was then run for real** and is
transcribed in `kodi-lab/transcripts/`.
On your couch, the clicking is easier.

## Starting the scan

Adding a source with content offers an
immediate scan ("Do you want to refresh
information for all items in this
path?"). Later scans are started from
the side menu in any library view
(**Update library**), from **Settings →
Media → Library**, where you can also
ask Kodi to scan on every start — a
good setting for a folder that changes
often, a slow one for a huge archive on
a network drive.

The lab started its scan over Kodi's
network interface with the command that
chapter 8 takes apart:

```json
{"jsonrpc": "2.0", "method": "VideoLibrary.Scan", "id": 1}
{"id": 1, "jsonrpc": "2.0", "result": "OK"}
```

Within seconds the library held three
films, one TV show and two episodes.
What happened inside those seconds is
chapter 7.
