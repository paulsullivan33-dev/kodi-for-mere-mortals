# Advanced Settings, Honestly

By the end of this chapter you know
where Kodi's hidden settings file
lives, which of its contents are worth
a normal reader's time — a short list —
and which famous ones are folklore.

## The file the GUI doesn't offer

Some Kodi settings have no screen. They
live in a hand-written file,
`userdata/advancedsettings.xml`, which
Kodi reads once at startup if it exists.
It is XML, it must be well-formed, and
there is no undo: a malformed file is
ignored (the log notes the failure) and
a wrong value is obeyed just as
faithfully as a right one.

That Kodi reads it is not a matter of
faith. The lab's file was in place
before its second run, and the log
announced the reading and printed the
contents back:

```text
info: Loaded settings file from special://profile/advancedsettings.xml
info: Contents of special://profile/advancedsettings.xml are...
```

Any change you make here can be verified
the same way: restart, and read the log
to confirm the file was loaded and what
Kodi understood it to say.

## The lab's file, whole

```xml
<advancedsettings version="1">
    <loglevel>1</loglevel>
    <cache>
        <memorysize>52428800</memorysize>
    </cache>
    <videolibrary>
        <importwatchedstate>true</importwatchedstate>
    </videolibrary>
</advancedsettings>
```

Three settings, and they are honestly
the three a home user is most likely to
meet:

- **`<loglevel>1</loglevel>`** — debug
  logging without the on-screen overlay
  the GUI's debug switch draws over your
  film. The setting to change *before*
  reproducing a problem for a bug report:
  it makes `kodi.log` say much more
  about what happened.
- **`<cache><memorysize>`** — how much
  memory Kodi may use to read ahead when
  playing from the network, in bytes
  (the lab's 52428800 is 50 MB). Worth
  setting on a low-memory box that plays
  from a slow share. See the myth below
  before touching it for any other
  reason.
- **`<videolibrary><importwatchedstate>`**
  — when importing NFO files (chapter
  7), also import the watched ticks and
  resume points stored in them (with its
  sibling `importresumepoint`). This is
  the setting that makes an NFO-based
  backup *complete* — chapter 12 uses it.

## The folklore, labelled

Forum threads about Kodi are full of
`advancedsettings.xml` files copied from
stranger to stranger, and three claims
about them deserve plain answers:

- **"Set the cache to zero and buffering
  is fixed."** Memory size zero means
  "use the disk as cache instead", a
  real option with real costs (it wears
  small flash storage, and on some
  platforms misbehaves). But nearly all
  buffering is the network or the source
  being slower than the film — chapter
  16 — and no cache setting makes a slow
  share fast. The cache is a bucket; the
  tap is the problem.
- **"These twenty lines make Kodi
  faster."** A pasted file whose lines
  you cannot explain is a liability:
  some lines will be for another
  version, some will be defaults wearing
  a costume, and one may be the setting
  that breaks the thing you later debug
  for a weekend. Add one line at a time,
  for a named reason, and check the log
  took it.
- **"If it's not in the file, add it
  anyway."** A setting Kodi does not
  recognise is silently ignored — the
  file is not a suggestion box. The
  list of real settings is Kodi's own
  documentation of this file; if a name
  is not there, it is not a setting.

## The working rule

The GUI covers almost everything.
Reach for `advancedsettings.xml` when
the thing you need is named there and
nowhere else, write the smallest file
that does it, and let the log confirm
the reading. The lab's three lines are
a reasonable permanent file for a small
machine — which is to say, the honest
advanced-settings chapter for most
readers is a short one.
