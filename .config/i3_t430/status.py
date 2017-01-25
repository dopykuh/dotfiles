from i3pystatus import Status
from i3pystatus.spotify import Spotify

status = Status()

status.register("clock",
        format="%a %-d %b %H:%M KW%V",)

status.register("load")

status.register("temp",
    format="{temp:.0f}°C",)

status.register("battery",
    format="{status}/{consumption}W {percentage}%",
    alert=True,
    alert_percentage=5,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

status.register("network",
    interface="eth0",
    format_up="{v4cidr}",)

status.register("network",
    interface="wlp3s0",
    format_up="{essid} {quality:03.0f}%",)

status.register("disk",
    path="/",
    format="{used}/{total}G [{avail}G]",)

status.register("pulseaudio",
    format="♪{volume}",)

status.register("spotify")

status.run()

