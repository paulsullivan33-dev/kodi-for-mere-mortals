# The Neighbours

Kodi sits in a crowded street. This
chapter places the houses on either
side — what each does that Kodi doesn't,
and vice versa — so the choice between
them is a decision rather than a habit.

## Jellyfin — the server

[Jellyfin for Mere
Mortals](https://paulsullivan33-dev.github.io/jellyfin-for-mere-mortals/)
is the closest neighbour and the most
instructive contrast. Jellyfin is a
**server**: it runs on one machine,
holds the library centrally, transcodes
video for whatever asks, and serves
browsers and apps on every screen in the
house, each with their own account and
watched state. Kodi is a **player**:
the library lives on the box under the
television, and that box must be able
to play the files as they are.

The practical dividing lines:

- **Several screens, several people,
  one library** → Jellyfin's shape.
- **One good screen, files it can play
  directly, no server to feed** →
  Kodi's shape, and the simpler one.
- The two compose: Jellyfin add-ons for
  Kodi present a Jellyfin server's
  library inside Kodi's interface, for
  people who want Kodi's playback and
  Jellyfin's centre. Documented here,
  not demonstrated — the lab ran no
  server.

## Plex — the polished cousin

Plex makes the same server-shaped offer
as Jellyfin with commercial polish, a
company account in the middle, and some
features behind a paid tier. People who
value the finish choose it happily;
people who value owning the whole stack
tend to land on Jellyfin. It is named
here so the map is complete; this guide
has no Plex lab and offers no verdict
beyond the shape.

## The single-file players

VLC and its kin play anything you hand
them and organise nothing. That is not
a criticism — for one file, once, a
player with no library is exactly the
right weight. Kodi earns its keep when
the same files are browsed nightly:
posters instead of filenames, watched
instead of remembered, resumed instead
of searched for. If your media life is a
folder you visit twice a year, the
honest advice is that you may not need
a librarian at all.

Preparing files for any of these is the
converter's job; [ffmpeg for Mere
Mortals](https://paulsullivan33-dev.github.io/ffmpeg-for-mere-mortals/)
covers it directly, and [HandBrake for
Mere Mortals](https://paulsullivan33-dev.github.io/handbrake-for-mere-mortals/)
covers the point-and-click route for
turning discs into files Kodi can shelve.

## Kodi in front of a TV backend — PVR

Kodi has a television face — the TV and
Radio menus, the programme guide — but
**no tuner of its own**. Live TV reaches
Kodi through a **PVR backend**: a
separate program (Tvheadend, NextPVR,
MythTV and others) that owns the aerial,
satellite or network tuner, records on
schedule, and serves channels; a **PVR
client add-on** in Kodi connects the two.
The guide data and channel lists live
in the databases chapter 2 met
(`TV40.db`, `Epg16.db`), filled by the
backend, not by Kodi.

So "watch live TV in Kodi" is really
"run a backend, then give Kodi its
client add-on" — a weekend project with
its own moving parts, described here
from Kodi's documentation and labelled
documented-only: the lab had no tuner,
no backend and no aerial, and says so
rather than dressing up an empty
programme guide as a demonstration.

## The zero-library option

Finally, the neighbour nobody mentions:
Kodi's own **Files view**. Everything in
this guide after chapter 5 is about the
library, but Kodi will also simply
browse folders and play what it finds,
posters or no posters. For a drive of
home video passing through, that is
sometimes the whole requirement — and
knowing the library is optional, not
obligatory, is part of knowing the tool.
