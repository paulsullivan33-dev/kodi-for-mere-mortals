# First Run

By the end of this chapter Kodi has run
once, created its home, and shown you
its front door — and you know the two
first-run surprises that catch almost
everybody: the settings that hide until
you ask for them, and the error messages
that are about your machine rather than
your media.

## What the first run creates

Start Kodi once and close it again. In
that short visit it builds the entire
userdata tree described in chapter 2 —
on Linux, `~/.kodi/` containing
`userdata/` with its `Database/`,
`guisettings.xml`, `profiles.xml`,
`Thumbnails/` and the rest. The lab's
transcript `kodi-lab/transcripts/t01`
lists the tree its first run created,
along with the line from the log that
proves which Kodi did it:

```text
Starting Kodi from Debian (20.5 Debian package version: 2:20.5+dfsg-1ubuntu1). Platform: Linux x86 64-bit
```

Nothing in that tree existed before the
first run and none of it is in the
program's install folder. That is the
separation chapter 2 promised, visible.

## The front door

Kodi opens on the **home screen** of its
default skin, **Estuary**: a menu down
the left — Movies, TV shows, Music,
Music videos, TV, Radio, Games, Add-ons,
Pictures, Videos — and a clock at the
top right. With no media added yet, the
main area carries an invitation instead
of posters. The lab photographed its
first-run screen; the picture is
`kodi-lab/screenshot-home.png`, and the
text in it is the whole of chapter 5 in
one paragraph:

> Your library is currently empty. In
> order to populate it with your personal
> media, enter "Files" section, add a
> media source and configure it. After
> the source has been added and indexed
> you will be able to browse your library.

Note the Debian branding on the lab's
screen ("KODI from debian") — a
distribution build may dress the logo
its own way; the layout is the same
everywhere.

## The settings have levels

Open Settings and you will find fewer
options than this guide sometimes names.
Kodi hides its settings behind **levels**
— Basic, Standard, Advanced, Expert —
shown at the bottom left of each
settings screen. The level you need for
this guide is **Standard**, which is
where the Services settings of chapter 8
appear; some screens default to Basic.
When a setting this guide names is not
on your screen, raising the level is
the fix, and it is worth learning before
it frustrates you.

While you are there: Settings → System
Information is the screen that reports
your exact version, your machine's name
and the state of its storage — the page
to quote when asking anyone for help.

## The errors that are not about you

The lab's machine had no sound hardware
at all, and its first log is full of
complaints about it:

```text
CAESinkALSA - Unable to open device "default" for playback
CActiveAESink::OpenSink - no sink was returned
ActiveAE::InitSink - returned error
```

Kodi ran anyway — it simply had no
voice. Read errors like these as a
report about the *machine*: no audio
device existed to open. On a real
television setup the equivalent lines
name your TV or receiver instead, and a
"No sink" error there means Kodi cannot
reach the device it was told to use —
chapter 16 picks this up. The general
lesson travels: **Kodi's log describes
the machine it finds, faithfully and
sometimes bluntly, and most scary lines
in it are descriptions, not verdicts.**

The lab's screen was also imaginary —
a virtual display with software
rendering (`GL_RENDERER = llvmpipe`, in
the same log). Kodi does not care: a
display is a display. On your machine
that line will name your graphics
hardware instead, which is one more
reason the log is worth reading once
before anything goes wrong.
