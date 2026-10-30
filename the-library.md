# The Library and Its Databases

By the end of this chapter you have
watched a scan think, read your library
out of the database file it lives in,
and seen the proof of the most useful
fact about it: **the library is a cache.
Your files are the substance.** Delete
the database and a rescan rebuilds it —
the lab did exactly that, on purpose,
and this chapter shows both halves.

## Anatomy of a scan

When the lab's scan started, Kodi's log
narrated it (transcript
`kodi-lab/transcripts/t03`):

```text
VideoInfoScanner: Starting scan ..
VideoInfoScanner: Scanning dir '.../media/Movies/' as not in the database
VideoInfoScanner: Found matching full NFO file: .../The Clockwork Garden (2021).nfo
VideoInfoScanner: Extracted filestream details from video file .../The Clockwork Garden (2021).mkv
```

Four moves, repeated per file: walk the
source; for each folder, check whether
anything changed since the last scan
(the scanner hashes folders, which is
why a second scan over an unchanged
library is nearly instant); ask the
scraper about each new or changed file;
probe the file itself for the stream
details of chapter 6.

## Where the answers come from: the scraper

The default movie and TV scrapers ask
The Movie Database over the internet:
they send it your filename's title and
year and file whatever comes back. For
ordinary films and shows this is the
right default and this guide does not
argue with it — but the lab could not
use it. Its films are invented; no
database has heard of them; and a lab
that phones a third party to describe
its own fixtures proves nothing about
the machinery. So the lab used the other
scraper Kodi ships: **Local information
only**, which reads an **NFO file** — a
small XML text file stored beside the
media. Here is the whole description of
one of the lab's films, exactly as the
scanner consumed it:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<movie>
  <title>The Clockwork Garden</title>
  <year>2021</year>
  <plot>A gardener builds a mechanical flower that opens when the sun rises, and the whole street comes to watch it wake.</plot>
  <genre>Documentary</genre>
  <director>Ingrid Halvorsen</director>
</movie>
```

Every field the library shows for that
film — title, year, plot, genre,
director — came out of those nine lines.
TV works the same way, with a
`tvshow.nfo` in the show's folder and an
`episodedetails` file beside each
episode. This is not an exotic corner:
NFO files are how home videos, rare
recordings and anything unlisted get
first-class library entries, and chapter
12 shows they double as the library's
best backup.

## The one field that bit: `<premiered>`

The lab's first `tvshow.nfo` described
the show's year the way the movie file
does, with a `<year>` element — and the
show arrived in the library dated
**1970-01-01**, the database's way of
saying "no date". The element the local
scraper reads for a show is
`<premiered>`, a full date:

```xml
<premiered>2022-03-04</premiered>
```

With that one change, a rescan reported
the show's year as 2022 (transcript
`t06`). Movie NFOs accept `<year>`; TV
show NFOs want `<premiered>`. It is a
small, sharp edge, and it is in this
guide because the lab cut itself on it
and kept the evidence.

## Reading the library in its own file

The library the interface shows is rows
in `MyVideos121.db`, and nothing stops
you reading them directly while Kodi is
closed. From the lab's database, after
its first scan:

```text
movie    | A Field Guide to Clouds
movie    | Summer at the Observatory
movie    | The Clockwork Garden
episode  | Departure        (season 1, episode 1)
episode  | The Border Stop  (season 1, episode 2)
tvshow   | The Night Train
files table: 5 rows · stream details: 10 rows
```

Three things are worth noticing. The
**files** table holds the five clips —
files exist in Kodi's world before and
beyond the library, which is why an
unmatched file can still be played from
the Files view. The **stream details**
are stored per file, video and audio
streams separately. And the titles,
plots and directors you saw in the
interface are simply columns here —
there is no hidden layer where the
"real" library lives.

The same contents, asked politely over
the network instead of read off the
disk, are chapter 8's business.

## The rebuild

Finally, the experiment the whole
chapter leans on. The lab closed Kodi,
set the video database aside, and
started Kodi again, which created a
fresh, empty one. It re-registered the
two sources and scanned. Result
(transcript `t06`): three movies, one
show, two episodes — everything, back,
from the files and their NFO files
alone.

So the division of labour is:

- **Files + NFO files** — what your media
  is. Durable, yours, worth backing up.
- **The database** — Kodi's index of the
  above, plus the things only Kodi
  knows: watched ticks, resume points,
  play counts. Rebuildable, but the
  rebuild loses exactly those.

Chapter 12 turns that into a backup
plan that keeps both halves safe.
