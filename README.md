## The blog _[Let's Fold Scarves](https://www.moley75.co.uk/)_



### content plugins

**Notes**  
 - All URLs must be served over https!


#### Embed image
```
{% lfsimage "image-url" "caption" %}
{% lfsimage "https://thejar.hitchcock.zone/1000/The%20Lady%20Vanishes%20(1938)/0011.jpg" "Hitchcock's model trains" %}
```
For local images use root relative paths so...
```
{% lfsimage "/images/uploads/2007/05/wtwta-giles.jpg" "Hitchcock's model trains" %}
```

#### Embed Youtube video
```
{% lfsvid "youtube-id" "caption" %}
{% lfsvid "K2gDLA3fWAI" "Under Your Spell" %}
```
#### Embed audio (mp3)
```
{% lfsaudio "audio-url" "caption" %}
{% lfsaudio "https://media.kexp.org/podcasts/instudio/media/2018-03-15_luna_01-23-18_full_performance.mp3" "Luna on KEXP" %}
```
For local images use root relative paths so...
```
{% lfsimage "/images/uploads/a-fake-url.mp3" %}
```

