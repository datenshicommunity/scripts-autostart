# Script Auto Start

## Install smug

Download dari [release](https://github.com/ivaaaan/smug/releases)

```
$ mkdir smug
$ tar -xzf smug_0.1.0_Darwin_x86_64.tar.gz -C ./smug 
$ sudo mv smug/smug /usr/local/bin
$ rm -rf smug
```

## Buat Config

Config taruh di `~/.config/smug/` <= Wajib

template :

```yaml
session: crot

root: ~/lokasifolder

windows:
  - name: code
    layout: main-vertical
    commands:
      - nano namafile.crot
    panes:
      - type: vertical
        commands:
          - tmux detach
```

## Jalanin Scriptnya

```bash
$ wget https://github.com/osu-datenshi/scripts-autostart/raw/master/start.sh
$ chmod +x start.sh
$ ./start.sh
```

## Jalanin per-project

```
$ smug start api --detach
$ smug start avatar --detach
$ smug start beatmap-server --detach
$ smug start lets --detach
$ smug start multi-backend --detach
$ smug start multi-frontend --detach
$ smug start peppy --detach
$ smug start yohane --detach
```
