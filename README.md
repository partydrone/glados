# GlaDOS

[![Build Status](https://travis-ci.org/wavetronix/glados.svg?branch=master)](https://travis-ci.org/wavetronix/glados)
[![codebeat badge](https://codebeat.co/badges/fedc55e1-aa4c-4be4-be6b-38c23eeadd37)](https://codebeat.co/projects/github-com-wavetronix-glados)

## Getting started

This project runs in Docker! To run it, you will need Docker for Mac or Docker
for Windows installed.

### Download the app from GitHub

To get up and running, clone this repo to your
local machine:

```
$ git clone https://github.com/wavetronix/glados GlaDOS
```

### Create a `.env` file

This app gets most of it's configuration information from environment variables
stored in a local file. We included an example `.env.example` file. Copy this
file to `.env` at the root of the project and make any necessary changes.
Comments in the file will help you determine what values you need.

### Build the app
Once you have copied the project locally, run:

```
$ docker-compose build
```

### Set up the database

You will need to create the database and seed it with some data:

```
$ docker-compose run app rails db:setup
```

## Running the app

When you're ready to fire it up:

```
$ docker-compose up -d
```

It may take a bit for all the container images to download the first time, but once it's done you can make sure everything is running with the following command:

```
docker-compose ps
```

If everything is honky-dory, you will see something like this:

```
-------------------------------------------------------------------------------------
glados_app_1        bundle exec rails s -p 300 ...   Up      0.0.0.0:3000->3000/tcp
glados_postgres_1   /docker-entrypoint.sh postgres   Up      0.0.0.0:5433->5432/tcp
```

You can now access the app in a browser at `http://localhost:3000`.

## Cleaning up

Once you're done, just shut everything down:

```
$ docker-compose down
```

# Gource

Use this command in the terminal at the source of the project:

```
$ gource --key --background-image ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Pictures/GLaDOS1.jpg --title "GlaDOS Development" --hide filenames --seconds-per-day 0.67 --auto-skip-seconds 1 -1920x1080 -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 gource.mp4
```

You can substitute any value for the `--background-image` parameter that you like, or leave it out for the default black background.
