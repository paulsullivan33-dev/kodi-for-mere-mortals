# Profiles

By the end of this chapter your Kodi can
keep separate worlds for separate
people — separate libraries, watched
ticks and settings — and you have seen
from the lab exactly what a profile is
made of: **a folder, plus one entry in
a list.** The lab learned that by
breaking it, and the break is the
lesson.

## Why profiles exist

One Kodi usually serves a household, and
households disagree: about what is in
the library, about what counts as
watched, about volume defaults and
subtitles. A **profile** gives each
person (or each room) their own complete
set of databases, settings and sources.
The first profile is **Master user**; it
always exists and cannot be deleted.
Others are created in **Settings →
Profiles**, where you also choose what
the new one starts with — copies of the
master's settings and sources, or
fresh ones — and whether to show a
**login screen** at startup so each
person picks their own world.

Profiles can be fenced: the real
`profiles.xml` from the lab (below)
carries lock fields for settings, files,
music, video, pictures and the add-on
manager, and a lock code to hold them.
That is the machinery behind a children's
profile that can watch its library and
change very little else.

## The anatomy, verbatim

This is the master profile's entry in
the lab's `userdata/profiles.xml`,
complete:

```xml
<profile>
    <id>0</id>
    <name>Master user</name>
    <directory pathversion="1">special://masterprofile/</directory>
    <hasdatabases>true</hasdatabases>
    <canwritedatabases>true</canwritedatabases>
    <hassources>true</hassources>
    <canwritesources>true</canwritesources>
    <lockaddonmanager>false</lockaddonmanager>
    <locksettings>0</locksettings>
    <lockfiles>false</lockfiles>
    <lockmusic>false</lockmusic>
    <lockvideo>false</lockvideo>
    <lockpictures>false</lockpictures>
    <lockprograms>false</lockprograms>
    <lockgames>false</lockgames>
    <lockmode>0</lockmode>
    <lockcode></lockcode>
    <lastdate></lastdate>
</profile>
```

Read it as a table of contents for the
idea: an identity (`id`, `name`), a
**directory** where its userdata lives,
four switches saying whether it has and
may write its own databases and sources,
and the lock fields. A profile whose
`hassources` is false borrows the
master's source list; one with
`hasdatabases` false borrows the
libraries too. Most home profiles want
their own databases (separate watched
states are the point) and can share
sources.

## The lab's experiment, including the failure

The lab added a second profile, "Guest
Room", by writing its entry into
`profiles.xml` by hand — the entry
above, with a new id and a directory of
`profiles/Guest Room/`. Kodi could see
the profile: its interface listed both,
and `Profiles.GetProfiles` over JSON-RPC
returned them. But telling Kodi to load
it failed, and the log said why, in
three lines worth quoting whole
(transcript `kodi-lab/transcripts/t05`):

```text
special://profile/ is mapped to: special://masterprofile/profiles/Guest Room/
error: CSettings: unable to load settings from special://profile/guisettings.xml, creating new default settings
critical: CProfileManager: unable to load settings for profile "Guest Room"
```

The entry existed; **the folder did
not**. Kodi does not conjure the
profile's home into being for a profile
it was merely told about — the Settings
screen creates the folder when it
creates the profile, and the hand-written
entry skipped that half of the job.

So the lab created the folder by hand
too, and loaded the profile again. This
time Kodi moved in: within seconds the
empty folder held a complete userdata
tree of its own — its own `Database/`
with a fresh, empty `MyVideos121.db`,
its own `Thumbnails/`, its own settings
— and a count of its video library
returned **0 movies**, against the
master profile's 3. Two libraries, one
installation, no overlap. That is a
profile, demonstrated end to end.

Two smaller findings from the same
experiment, both useful at home:

- **The web interface follows the
  profile.** When the lab switched to
  Guest Room, the web server on port
  18090 went quiet — the guest profile
  had its own settings, in which the web
  server was still off. Remote access is
  a per-profile decision, not a
  machine-wide one.
- **Kodi remembers who was home.**
  `profiles.xml` records `lastloaded`;
  restart Kodi without a login screen
  and you return to the profile you left.

## The practical word

Create profiles in **Settings →
Profiles**, where both halves of the job
are done for you. Know the anatomy
anyway, because the day a profile
refuses to load, the log's complaint
will name one of the two halves — the
entry or the folder — and you will know
which one to go and look at.
