#!/bin/sh

mkdir -p /data/nxt_db

if ! test -d /data/conf; then
	cp -a /app/nxt/conf /data/conf
fi

java -cp classes:lib/*:/data/conf:addons/classes:addons/lib/* nxt.Nxt
