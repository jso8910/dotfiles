import requests, os, json, html
import sys

user = os.environ.get('user')
apikey = os.environ.get('apikey')
url = f"https://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user={user}&api_key={apikey}&format=json&limit=1"
try:
    request = requests.get(url)
except:
    sys.exit(1)

j = request.json()

song = j['recenttracks']['track'][0]
song_name = html.escape(song['name'])
artist_name = html.escape(song['artist']['#text'])
album_name = html.escape(song['album']['#text'])
image_url = song['image'][-1]['#text']

image = requests.get(image_url, stream=True)
image.raw.decode_content = True
with open(os.path.expanduser('~/scripts/album.png'), 'wb') as f:
    for chunk in image:
        f.write(chunk)

print(json.dumps({
    "song_name": song_name,
    "artist_name": artist_name,
    "album_name": album_name
}))
