from i3pystatus import Status
from i3pystatus.spotify import Spotify

status = Status()

status.register("clock",
        format="%a %-d %b %H:%M KW%V",)

status.register("load")

status.register("temp",
    format="{temp:.0f}°C",)

status.register("battery",
        format="{status}/{consumption:.0f}W {percentage:.0f}%",
    alert=True,
    alert_percentage=20,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

status.register("network",
    interface="wlp3s0",
    format_up="{essid} {v4cidr} {quality:.0f}%",)

status.register("disk",
    path="/",
    format="{avail}G",)

status.register("pulseaudio",
    format="{volume}♪",)

status.register("spotify")

status.run()

