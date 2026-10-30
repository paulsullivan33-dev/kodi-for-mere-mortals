# What Kodi Is

You have media files — films you ripped
from discs you own, home videos, a music
collection, recordings from a camera —
sitting in folders on a computer or a
network drive. The folder view is a poor
way to browse them from a couch. **Kodi**
is the program that turns those folders
into a library: it looks at your files,
finds out what each one is, and presents
the lot as posters, titles, plots and
genres on a screen designed to be read
from across the room.

Kodi is free, open source, and made by
the XBMC Foundation, a non-profit. It
began in 2002 as a media player for the
original Xbox and has since become a
general home theatre application for
Windows, macOS, Linux, Android and
Android TV. It is a **player and a
librarian**. It is not a streaming
service, and this distinction matters
more for Kodi than for most programs in
this series:

- Kodi ships with **no content at all**.
  No films, no channels, no subscriptions,
  nothing to watch until you point it at
  media of your own.
- Kodi does not download your media from
  the internet. It organises and plays
  files that are already yours — on a
  local disk, a USB drive, or a network
  share in your house.
- What Kodi fetches from the internet,
  when you let it, is *descriptions* of
  your files: titles, years, plots,
  artwork. Chapter 7 shows how even that
  can be done offline.

## The elephant in the room

Kodi is also famous for something its
makers did not build and do not support.
Third parties package Kodi with add-ons
and ready-made "builds" that promise free
films and sport streamed from pirate
sources. If you have heard of Kodi at
all, this may be how you heard of it.

Three plain facts about that world. The
streams are other people's content,
taken without permission — in most
places, using them is unlawful. The
builds themselves are a common delivery
vehicle for junk and worse, because they
ask you to install software from
anonymous sources and switch off Kodi's
safety checks to do it. And Team Kodi
supports none of it: their forum rules
ban discussion of those add-ons, and
this guide follows the same line. **Kodi
is for media you own or have the right
to play.** That is not a small use case —
decades of DVDs, Blu-rays, CDs, home
video and legitimate downloads are
exactly what it was built for — and it
is the only use case this guide teaches.
Chapter 9 returns to the subject, because
the safety rule for add-ons follows
directly from it.

## Built for the couch

Kodi's interface assumes a television and
a remote control: large text, simple
menus, navigation in four directions.
It works happily with a keyboard and
mouse too, and chapter 8 shows how a
phone or a web browser becomes the
remote. But the design centre is the
**ten-foot interface** — readable at ten
feet — and most of Kodi's quirks make
sense once you know it was designed for
a couch first and a desk second.

## What the lab did

The lab behind this guide ran the real
thing: **Kodi 20.5**, the build Ubuntu
24.04 ships, on a small Linux machine
with a virtual screen instead of a TV.
Against it the lab built a library from
five short invented films and episodes
— clips generated on the spot, with
fictional descriptions written by hand —
drove Kodi over its own network
interface, played a film and measured
the player's clock to prove it played,
gave it a second user profile, and at
one point deleted its entire video
database to see what a fresh scan could
rebuild. The transcripts are in
`kodi-lab/`.

What the lab could not do, it did not
fake. The machine had no television, no
remote control and no sound hardware —
Kodi's log complains about the missing
sound device by name, and the guide
quotes it rather than working around it.
Playback on real TVs, surround sound,
HDR and hardware video decoding are
described from Kodi's documentation and
labelled as such. `criteria.md` keeps
the full ledger.
