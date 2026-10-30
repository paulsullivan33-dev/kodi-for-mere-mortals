# The Web Interface and Remotes

By the end of this chapter Kodi answers
to a web browser and to commands sent
over your network — the same machinery
the phone remotes use — and every claim
in it was exercised against the lab's
Kodi, including shutting it down.

## Turning it on

**Settings → Services → Control** (the
settings level must be Standard or
higher, chapter 4):

- **Allow remote control via HTTP** — on.
- **Port** — 8080 by default. Pick
  another if something else on the
  machine uses it; the lab used 18090.
- **Username and password** — set both.
  The username defaults to `kodi`. Treat
  the password as a real one: anything
  that can reach this port can drive
  your Kodi, read your library's
  contents, and — chapter's end — switch
  it off.
- Below them, **Allow remote control
  from applications on other systems** is
  the separate switch for non-web
  remotes and control apps. The web
  interface works without it; phone apps
  like Kore (below) need it.

The lab set these in `guisettings.xml`
before launch — they are three lines
there, `services.webserver`,
`services.webserverport`,
`services.webserverpassword` — and then
proved from the outside that the settings
had landed. Asked for its own settings
over the interface it had just opened,
Kodi answered `18090` for the port
(transcript `kodi-lab/transcripts/t02`).

## Chorus: Kodi in a browser

Visit `http://<the machine>:8080/` and
Kodi serves **Chorus**, its bundled web
interface: your library with its
artwork, a remote control, playlists,
and settings. Two behaviours from the
lab are worth naming because they are
the security model in miniature:

- Without credentials the server answered
  **HTTP 401** — a closed door, not an
  error.
- With them, the same address served the
  interface (its page title is simply
  "Kodi").

Chorus is an add-on like everything else
(`webinterface.default`), and others can
be installed in its place; the
**Web interface** setting chooses which.

## JSON-RPC: the remote underneath

Under Chorus sits the interface the
remotes actually speak: **JSON-RPC**, a
method-calling protocol over HTTP. A
request is a small JSON document; the
reply is another. The lab's session,
verbatim from transcript `t02`:

```console
$ curl -u kodi:<password> -H 'Content-Type: application/json' \
    -d '{"jsonrpc":"2.0","method":"JSONRPC.Ping","id":1}' \
    http://127.0.0.1:18090/jsonrpc
{"id":1,"jsonrpc":"2.0","result":"pong"}
```

```json
{"jsonrpc":"2.0","method":"Application.GetProperties",
 "params":{"properties":["name","version"]},"id":2}
→ {"name":"Kodi","version":{"major":20,"minor":5,
   "revision":"20240927-nogitfound","tag":"stable"}}
```

Everything a remote can do is a method
like these — hundreds of them, covering
the library, the player, settings,
profiles and the application itself.
The ones this guide exercised for real:

- `VideoLibrary.Scan` and
  `VideoLibrary.GetMovies` — chapter 5's
  scan and chapter 7's contents, asked
  over the network instead of read from
  the database file; the answers agreed.
- `Player.Open` on a library film, then
  `Player.GetProperties` to watch its
  clock: 3.4 seconds, 6.9 seconds, done —
  proof of playback, measured rather
  than assumed, on a machine with no
  screen to watch (transcript `t04`).
- `Profiles.LoadProfile` — chapter 10's
  profile switch.
- `Application.Quit` — the lab's last
  command of the day. Kodi logged
  "Exiting the application…" and closed,
  shut down by a sentence of JSON from
  another process. A remote control that
  can do that deserves its password.

One honest limit from the same
transcript: when the lab asked the
player for two properties that do not
exist in this API version ("playing",
"paused"), the reply was a formal
**Invalid params** error naming the
offending element. The API is strict
about its vocabulary, per version —
script against the version you have,
which `JSONRPC.Version` will tell you
(the lab's answered 13.0.0).

## Phone remotes

**Kore** is Team Kodi's official remote
app for Android: it finds Kodi on the
network, pairs with the same username
and password, and gives you a remote,
the library, and now-playing controls.
Third-party remotes for both phone
platforms speak the same JSON-RPC and
the same EventServer underneath. The
lab had no phone and no Android device,
so Kore itself is documented-only here —
but everything it would say to Kodi is
the protocol above, exercised end to
end.

## The security paragraph, once

Kodi's web port is a remote control for
an application that can browse your
files and play your media. On your home
network, behind your router, with a
password set, it is a reasonable thing
to run — this guide's lab did. **Do not
forward this port to the internet.**
Routers call it port forwarding; forums
suggest it for "access anywhere"; the
honest description is publishing a
remote control for your house on the
public network, protected by one
password and a protocol never designed
for exposure. If you need your library
away from home, that is the neighbours'
job — chapter 14.
