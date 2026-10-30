# Writing criteria for this guide

Every "for Mere Mortals" guide is written to the same nine-point
standard, so a reader who trusts one can trust the rest. Here it
is, with the verification notes for this particular guide below.

1. **Fix it first.** Reader outcomes lead, not action items: each
   chapter opens by naming the outcome it delivers, shows a check
   the reader can run to confirm they got it, and a reasonable
   reader finishes able to state what was done, what it means,
   and what to try next.
2. **Plain language.** Short sentences, everyday vocabulary,
   technical terms defined on first use. No slang, and no
   idioms that only make sense in one country — the reader may
   be translating as they go.
3. **No dead ends.** A guide never tells the reader to do
   something it cannot show them how to verify. Every claim a
   reader relies on — an install, a command, an output — is
   something this guide demonstrates or clearly labels
   documented-only below.
4. **Live-verified where it matters.** Procedures are run for
   real in the guide's lab wherever the build machine allows it,
   and the transcripts kept in the repository are the evidence.
   What could not be run is listed honestly below, never
   presented as if it had been.
5. **General audiences.** Nothing in this guide — examples,
   fixtures, names, addresses — is modelled on any particular
   reader or author's real life, network, or organisations.
   The lab's five films and episodes are invented titles with
   invented plots, generated as test clips on the spot.
6. **Standalone.** A reader needs this guide, its lab, and
   nothing else. Where another guide would genuinely help, it
   is pointed to once, by name, and the chapter still completes
   without it.
7. **Honest about limits.** Chapter 15 names what the tool
   cannot do: no content of its own, literal-minded filename
   matching, one library per profile with no sync between
   boxes, playback bounded by the device's decoders, add-ons
   bound to the major version, and a remote-control port that
   must not face the internet.
8. **The ethics rule is in the text, early.** Kodi raises the
   question other guides in this series do not: its fame rests
   partly on third-party add-ons that stream other people's
   content without permission. Chapter 1 draws the guide's
   line before any procedure depends on it — Kodi is taught
   here as a player for media you own or have the right to
   play — and chapter 9 turns it into a practical safety rule
   for add-ons.
9. **Builds clean.** The site builds with MkDocs in strict mode
   with no warnings, and a fresh reader following the chapters
   in order reaches the stated outcome of each.

## Verification notes for this guide

The build machine is a shared Ubuntu 24.04 sandbox (about
7.9 GB of memory, other work running alongside; timings are
therefore approximate and the guide treats them so). Kodi
**20.5 (Nexus)**, Ubuntu package `2:20.5+dfsg-1ubuntu1`, was
obtained by downloading the distribution's own `.deb` packages
and unpacking them into a lab folder — nothing was installed
system-wide on the shared machine — and the unmodified
distribution binary was run from that tree with its library
paths pointed at it. Current upstream stable as of the lab
(October 2026) is 21.3 "Omega"; chapter 3 makes the two-version
gap explicit rather than hiding it. Kodi ran under a virtual
X server (Xvfb) at 1024×600 with software rendering
(`GL_RENDERER = llvmpipe` in its log), its home a lab folder,
its web interface on loopback port 18090 — the only port it
opened. All transcripts live in `kodi-lab/transcripts/`;
the fixture generator is `kodi-lab/make-fixtures.sh`.

The lab had **no television, no remote control and no audio
device**. Video playback is therefore proven by measurement
(the player's own clock, polled over the API), not by
watching; sound is proven absent, by Kodi's log.

Run for real, with transcripts as evidence:

- Provenance and version: package policy, the download-only
  fetch of the Kodi closure, and `kodi --version` reporting
  20.5 from the unpacked tree; 131 bundled add-ons counted on
  disk (t00).
- First run: the full userdata tree created from nothing —
  `guisettings.xml`, `profiles.xml`, `Database/` holding
  Addons33, MyVideos121, MyMusic82, TV40, Epg16, Textures13
  and ViewModes6 databases — the log's start line, its
  software-renderer line, and its repeated failure to open
  any audio device, there being none; clean shutdown on a
  terminate signal (t01).
- Web interface and JSON-RPC: web server enabled on port
  18090 by pre-seeding `guisettings.xml`; HTTP 401 without
  credentials; the Chorus page served with them; JSON-RPC
  13.0.0 answering Ping ("pong"), Application.GetProperties
  (Kodi 20.5, revision 20240927-nogitfound), and
  Settings.GetSettingValue confirming the port from inside;
  one malformed call returned the API's formal Invalid
  params error (t02).
- The library: five fixture clips generated with ffmpeg
  (test pattern video, sine-tone audio), described by
  hand-written NFO files, filed by the bundled Local
  information scraper (`metadata.local` v1.0.1) after a
  JSON-RPC scan — 3 movies, 1 TV show, 2 episodes, with
  titles, years, plots, genres and directors intact. The
  same library read directly from `MyVideos121.db` with
  sqlite3 (movie/episode/tvshow rows, 5 file rows, 10
  stream-detail rows; one stream row shows h264, 640×360,
  8 s, probed from the file itself). The scanner's log
  lines, including "Found matching full NFO file", are
  transcribed (t03). Sources were registered by writing the
  same `sources.xml` entry and database content rows the
  Set content dialog writes; the clicking itself is
  documented-only, and chapter 5 says so.
- Playback: `Player.Open` on a library film, active player
  reported, and the play clock polled at wall-clock rate
  (3.439 s, 6.941 s, 100%) under software rendering; the
  audio track had no sink and the log's ActiveAE errors
  during playback are transcribed with it (t04).
- Profiles: a second profile ("Guest Room") added to
  `profiles.xml` by hand; listed by the API; its first load
  failed with the log's "unable to load settings for
  profile" because the profile's folder did not exist; with
  the folder created, the load succeeded and the profile
  bootstrapped its own complete userdata with its own empty
  video database (0 movies to the master's 3). The web
  server going quiet after the switch — it follows the
  profile's own settings — was observed, not assumed (t05).
- The rebuild: the video database set aside, Kodi restarted
  onto a fresh empty one, sources re-registered, rescan —
  all 3 movies, the show and both episodes restored from
  files and NFO files alone. The same experiment carries
  the `<premiered>` fix: the show's `tvshow.nfo` with
  `<year>` had produced a 1970-01-01 date in the first
  build; with `<premiered>2022-03-04</premiered>` the
  rebuilt library reports the show's year as 2022 (t06).
- `advancedsettings.xml`: the lab's three settings
  (loglevel, cache memory size, importwatchedstate) were in
  place before a run whose log records "Loaded settings
  file from special://profile/advancedsettings.xml" and
  prints the file's contents back (t01's successor run;
  quoted in chapter 11).
- Exit over the wire: `Application.Quit` sent by JSON-RPC
  closed Kodi cleanly, its log ending "Exiting the
  application…" (t04).

Documented only — described from Kodi's documentation and
the project's own pages, not run, and the text does not
claim otherwise:

- The graphical click-paths themselves: adding sources
  through the Files screens, the Set content dialog, the
  profile-creation screens, the library export menu. The
  records they write and everything downstream of them were
  run and measured; the clicking was not.
- Installs on Windows, macOS, Android, Android TV and
  dedicated systems (LibreELEC/OSMC), and the Flatpak route.
  The Vega OS Fire TV limitation is current reporting
  (September–October 2026), labelled with its date in
  chapter 3.
- The online scrapers (The Movie Database) against the real
  databases — the lab's fixtures are invented, so the local
  scraper carried the whole demonstration by design.
- Chorus beyond its front door (the lab verified the
  served page and its authentication behaviour; it did not
  tour the interface), and the Kore phone app, which speaks
  the JSON-RPC exercised here but was not itself run.
- Add-on installation of any kind, from the repository or
  otherwise: the bundled set was inspected on disk and no
  add-on was installed, deliberately (chapter 9 explains).
- PVR and live TV end to end, Jellyfin-from-Kodi add-ons,
  network shares as sources (the lab's sources were local
  folders), and everything about real displays, remotes,
  surround sound, HDR and hardware decoding.

Fixtures are this guide's own and deliberately generic: five
short generated clips — three invented films and two episodes
of an invented series — with fictional plots, directors and
dates written for the lab. No real person's media library,
names or network appears anywhere in them. The one password
in the transcripts (`mere-mortals-lab`) is a throwaway
credential created for the lab's loopback-only web server and
protects nothing else.
