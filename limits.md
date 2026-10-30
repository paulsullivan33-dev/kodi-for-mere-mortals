# Limits

What Kodi cannot do, or does not do
well — collected in one place so the
rest of the guide's enthusiasm can be
trusted.

- **Kodi brings no content.** It plays
  and organises your files. There is
  nothing to watch until you supply
  media, and no subscription to buy that
  changes this. Chapter 1's elephant
  lives here: anyone selling you "Kodi
  with everything included" is selling
  something else under its name.
- **The library is literal-minded.** It
  believes filenames completely
  (chapter 6). A badly named collection
  produces a confidently wrong library,
  and no amount of rescanning fixes a
  claim that was never true.
- **One box, one library.** Each
  profile is its own island (chapter
  10). Kodi has no accounts, no central
  server, no sync of watched state
  between two televisions in one house —
  that is the neighbours' architecture
  (chapter 14), not a setting you have
  missed.
- **Playback is the device's problem.**
  Kodi decodes with the hardware it is
  given and falls back to software
  decoding where it must. The lab's
  software renderer (llvmpipe) played a
  small clip in real time; it would not
  have played a 4K film that way, and
  neither will a bargain box asked to
  decode beyond its silicon. HDR,
  surround formats and refresh-rate
  switching are all properties of the
  device and display first, settings
  second.
- **Versions drift.** Distribution
  builds lag upstream by whole major
  versions (the lab: 20.5 against a
  21.3 stable), stores lag installers,
  and add-ons follow the major version.
  Two Kodis in one house can be
  genuinely different programs wearing
  one name.
- **No sound hardware, no sound.** Obvious
  once said, but the lab's machine
  proved the shape of it: Kodi runs,
  plays, and keeps a straight face in
  its log — `no sink was returned` —
  while the film plays silently. The
  check is always the device chain, not
  the file.
- **The web interface is a remote, not
  a vault.** One password guards a
  control channel that can read your
  library and stop the program. On the
  home network that is fair; exposed to
  the internet it is not (chapter 8).
- **What this guide could not verify.**
  Stated once, plainly: real televisions
  and remotes, sound of any kind, HDR
  and hardware decoding, live TV, the
  online scrapers' behaviour against the
  real databases, the phone remote app,
  and the other platforms' installs are
  described from documentation, not
  demonstrated. `criteria.md` is the
  full ledger, and the chapters say so
  where it matters.
