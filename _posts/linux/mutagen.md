# https://github.com/mutagen-io/mutagen
mutagen sync create --name=web-app-code ~/project user@example.org:~/project
mutagen forward create --name=web-app tcp:localhost:8080 docker://devcontainer:tcp:localhost:1313
mutagen [sync/forward] list
mutagen [sync/forward] monitor web-app-code
mutagen [sync/forward] pause ...
mutagen [sync/forward] resume web-app-code
mutagen [sync/forward] flush web-app-code
mutagen [sync/forward] reset web-app-code
mutagen [sync/forward] terminate web-app-code