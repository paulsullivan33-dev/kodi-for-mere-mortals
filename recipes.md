# Recipes

Short, complete jobs. Each assumes the
chapters it leans on and says which
half was proven in the lab and which is
the documented route.

## Point Kodi at a network share

*Chapters 5 and 6.* In **Add videos →
Browse**, choose the network type your
server offers — Windows network (SMB)
for most NAS boxes and Windows shares,
NFS for most Linux servers — then the
server, then the folder. Kodi asks for
the share's username and password and
offers to remember them; they are kept
per source. Add the share's film folder
and its TV folder as *separate* sources:
content types differ, and one source
cannot be both. Name the files as
chapter 6 prescribes before the first
scan, not after the third.

## A children's profile with its own small library

*Chapters 5 and 10.* Create the profile
in Settings → Profiles, starting with
fresh sources rather than copies. In the
child's profile, add one source: the
folder of approved media, content set,
scanned. Back in the profile's settings,
apply the locks `profiles.xml` carries —
settings and files at minimum, so the
fences themselves cannot be edited —
and give the master profile a lock code
too, or the fences are ornamental. Each
profile's library is its own database
(the lab counted 0 films in its guest
profile against the master's 3), so
nothing needs hiding in a shared view:
the small library is the whole world in
that profile.

## The fully offline library

*Chapters 5 and 7 — the lab's own
build, proven end to end.* For media no
database knows — home video, recordings,
the obscure and the unreleased — write
an NFO file beside each item (chapter 7
quotes the movie, show and episode
forms, including the `<premiered>`
lesson for shows), set the source's
scraper to **Local information only**,
and scan. No network is involved at any
point; the lab's library was built on a
machine whose only network use was
talking to itself. The fixture script
is `kodi-lab/make-fixtures.sh`.

## Drive Kodi from a script

*Chapter 8 — every call below is
verbatim from the lab's transcripts.*

Scan the library after new files land
(a download folder's finishing touch):

```console
$ curl -s -u kodi:<password> -H 'Content-Type: application/json' \
  -d '{"jsonrpc":"2.0","method":"VideoLibrary.Scan","id":1}' \
  http://127.0.0.1:8080/jsonrpc
{"id":1,"jsonrpc":"2.0","result":"OK"}
```

Ask what is in the library (titles and
years):

```console
$ curl -s -u kodi:<password> -H 'Content-Type: application/json' \
  -d '{"jsonrpc":"2.0","method":"VideoLibrary.GetMovies",
       "params":{"properties":["title","year"]},"id":2}' \
  http://127.0.0.1:8080/jsonrpc
```

Ask what is playing, and how far in:

```console
$ curl -s -u kodi:<password> -H 'Content-Type: application/json' \
  -d '{"jsonrpc":"2.0","method":"Player.GetProperties",
       "params":{"playerid":1,"properties":["time","percentage"]},"id":3}' \
  http://127.0.0.1:8080/jsonrpc
```

The port is the one you set in chapter
8 (the lab's was 18090; 8080 is the
default in these examples). And the
polite nightly shutdown is the same
shape, with method `Application.Quit` —
proven, once, at the end of the lab's
longest day.

## Recover a show the scanner misread

*Chapters 6, 7 and 16.* If a series
arrived wrong — misdated, misnamed,
filed as someone else — fix the *names*
first, not the library: correct the
folder and episode filenames (or the
NFO files, for a local library), then in
the show's context menu choose **Remove
from library**, and run **Update
library**. The files were never touched;
only the description is discarded and
rebuilt from the corrected claims.
Repeat per show rather than wiping the
database: the nuclear option of chapter
7 exists, but it spends every other
show's watched ticks to fix one show's
poster.
