# Add-ons — Official and Otherwise

By the end of this chapter you can tell
a trustworthy add-on from a dangerous
one at sight, because you know where
each kind comes from. Add-ons are where
Kodi's power and Kodi's one real danger
live side by side.

## Add-ons are the architecture

Chapter 2 said it in passing: Kodi's own
features are add-ons. The lab's build
carried **131 bundled add-ons** —
scrapers, the Estuary skin, the Chorus
web interface, screensavers, subtitle
and metadata helpers, the interfaces
other add-ons build on. When you "add a
feature to Kodi", you are nearly always
installing one more of these small,
single-purpose programs.

They come in kinds worth knowing by
name: **scrapers** (chapter 7),
**skins**, **PVR clients** (chapter 14),
**subtitle services**, **screensavers**,
**programs** (tools and launchers) and
**services** (background helpers). Each
declares the Kodi version it works
with — which is why chapter 3's version
gap matters: an add-on built for Kodi
21 will refuse, or fail, on the lab's
Kodi 20.

## The official repository

Inside Kodi: **Add-ons → Install from
repository → Kodi Add-on repository**.
Everything there is reviewed by Team
Kodi, versioned, and updated through
Kodi itself. Installing from the
repository — a weather provider, a
subtitle service, a different skin — is
the normal, safe way to extend Kodi, and
for most readers it is the only way they
will ever need.

Two habits inside the repository are
worth forming. Read an add-on's own
page before installing: what it does,
what it connects to, who maintains it.
And expect dependencies: Kodi lists the
other add-ons a choice needs and
installs them with it — that is the
package working as designed, not a
warning sign.

## The other door, and the rule for it

Kodi also offers **Install from zip
file**, and a setting beside it —
**Unknown sources** — that is off by
default and must be deliberately
switched on before any zip can be
installed. Some third-party
**repositories** (zip files that add a
whole new catalogue to browse) are
legitimate: a hardware maker, a public
broadcaster, a well-known project
publishing its own add-on.

And some are the machinery of chapter
1's elephant. The "builds" and wizards
that promise free everything are
distributed exactly this way — a zip,
from a site with no name behind it,
asking you to switch the safety off
first. What arrives can be anything:
add-ons that stream pirated content,
add-ons that mine or spy, add-ons that
simply break the installation they
landed in. Kodi cannot inspect what you
install from a zip; that is what the
repository's review exists for.

So the rule, stated once and plainly:

> **Install add-ons from Kodi's own
> repository, or from the named maker's
> own page — a project you could write
> to and expect an answer. If a guide or
> video begins by telling you to enable
> Unknown sources and fetch a zip from a
> site you have never heard of, what it
> is really asking is for you to lower
> the one guard Kodi gave you. Don't.**

## What the lab did — and didn't

The lab installed nothing. It read the
bundled set off the disk (131 add-ons),
met the ones its work depended on by
name in the log — `metadata.local`
v1.0.1 among them — and left the
repository and the zip door unopened,
so both are described here from Kodi's
documentation and the settings
themselves rather than from a
demonstration. That is a deliberate gap
and `criteria.md` lists it as one: the
safety rule above does not depend on
which add-ons happen to be fashionable
this year, and a guide that installs
third-party software to prove a point
about third-party software has missed
its own point.

## Housekeeping

- **Disabling beats uninstalling** when
  you are diagnosing: a disabled add-on
  keeps its settings (in
  `userdata/addon_data/`) and can be
  switched back on; an uninstalled one
  starts over.
- **Updates** arrive through the same
  screens; the auto-update setting per
  add-on is worth leaving on for
  repository add-ons and means nothing
  for zip-installed ones, which is
  another quiet cost of the other door.
- An add-on that crashes leaves its
  complaint in `kodi.log` under its own
  name — chapter 16's habit applies.
