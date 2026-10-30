# Naming Files So the Library Finds Them

By the end of this chapter your files
have names a machine can match. This is
the least glamorous chapter in the guide
and the one that decides whether the
library works at all, because the
scanner is a literal-minded reader of
filenames: it cannot watch the film to
find out what it is.

## The one rule

**A filename is a claim.** The scanner
reads the name, believes it, and asks
the scraper for a description of
*that*. Every library horror story —
the war film that arrived wearing a
romcom's poster, the series filed as one
very long film — is a filename claiming
the wrong thing, filed faithfully.

## Films: one folder each, year included

The layout the lab used, and the one to
copy:

```text
Movies/
├── The Clockwork Garden (2021)/
│   └── The Clockwork Garden (2021).mkv
├── A Field Guide to Clouds (2019)/
│   └── A Field Guide to Clouds (2019).mkv
└── Summer at the Observatory (2023)/
    └── Summer at the Observatory (2023).mkv
```

- **Title, then the year in brackets.**
  The year is not decoration: it is how
  the scraper tells a film from its own
  remake, and how it ignores the other
  films that share a title.
- **A folder per film**, named the same
  as the file. With the "separate
  folders" option from chapter 5 set,
  Kodi takes the *folder* name as the
  claim and treats everything inside —
  the film, its NFO file, its artwork —
  as belonging to that one title. It
  also keeps extra files from being
  mistaken for extra films.
- Keep the folder and the file names
  identical. Two different claims about
  one film is how duplicates are born.

Flat folders — every film file in one
big directory — also work, with folder
names off and each filename carrying its
own title and year. The per-film folder
is simply harder to get wrong.

## TV: show, season, SxxExx

```text
TV/
└── The Night Train (2022)/
    ├── tvshow.nfo
    └── Season 01/
        ├── The Night Train S01E01.mkv
        └── The Night Train S01E02.mkv
```

- The unit of identity is the **episode
  code**: `S01E02` means season 1,
  episode 2. It must be in the filename;
  nothing else in the name matters as
  much. `1x02` is also understood.
- `Season 01` folders (two digits) keep
  a season's files together and sorting
  honestly. Specials live in
  `Season 00`.
- The episode's *title* does not come
  from the filename at all — the scraper
  supplies it from the episode number,
  which is why the lab's episodes
  arrived named "Departure" and "The
  Border Stop" rather than "S01E01" and
  "S01E02".

## What Kodi learns without being told

Names are the claim, but the file itself
is evidence, and Kodi collects it: when
the lab's films were scanned, Kodi
probed each one and stored what it
found in the database's stream-details
table. One real row:

```text
h264 · 640x360 · 16:9 · 8 seconds
```

Codec, width, height, aspect ratio,
duration — measured from the file, not
the name. This is why the library can
badge a film "1080p" or show its running
time before you have told it anything,
and why a mislabelled *file* still plays
at its true size and length. It is also
the limit of the file's testimony: it
knows its shape, never its story.

## Small print that saves evenings

- **Multi-part films** — files ending
  `-cd1`/`-cd2` (or `part1`/`part2`)
  with an otherwise identical name are
  *stacked*: played as one film, listed
  once.
- **Trailers and extras** sitting beside
  a film get their own naming habits
  (`-trailer`, an `Extras` folder) —
  left loose, a trailer can be scanned
  as a second copy of the film.
- **Sample files and leftovers** from
  downloads are claims too. A folder
  called `Sample` inside a film folder
  will be scanned with everything else;
  remove what you do not mean.
- Renaming is safe and reversible:
  nothing about the media itself changes.
  Rename, then refresh that item (or
  rescan), and the library corrects
  itself. Chapter 13 in the recipes has
  the routine for a show renamed in bulk.

The fixtures in this chapter are the
lab's own invented films, generated as
eight-second clips by the script kept at
`kodi-lab/make-fixtures.sh`. The names
are the lesson; the films are test
patterns with a tone for a soundtrack,
which is all a scanner needs.
