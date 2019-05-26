## The blog _[Let's Fold Scarves](https://www.moley75.co.uk/)_

### Building the blog
 1. Opening a terminal (Windows R and type cmd)
 2. Type "LetsFoldScarves.cmd"

When the site is ready it will be viewable at
[http://127.0.0.1:4050](http://127.0.0.1:4050)

This will show all posts including those set to unpublished

### Writing a new blog post
 1. Open Sublime
 2. Start a new file
 3. Type **post** and hit the tab key - this will load in the default template
 4. Update the title, date, categories etc.
 5. Save the file in the *_Posts/* folder it must be named **yyyy-mm-dd-title-of-post.md**
 6. If your site is building (as above) this will rebuild the site and the new post will be visible soon

### Publishing to live
 1. When you're happy open GitHub Desktop
 2. Make sure all the files you want to add or change are ticked in the left hand column
 3. Write a commit message in the bottom left and click commit
 4. Push
 5. This will push to Github and the site will be built and published to LIVE (this will take a couple of minutes) and the site will be available at [https://www.moley75.co.uk](https://www.moley75.co.uk)

### content plugins

**Notes**  
 - All URLs must be served over https!


#### Embed image
```
{% lfsimage "image-url" "caption" %}
{% lfsimage "https://thejar.hitchcock.zone/1000/The%20Lady%20Vanishes%20(1938)/0011.jpg" "Hitchcock's model trains" %}
```

Local images can be stored in the images folder.

To resize images open the file in Paint and on the Home tab choose resize - select the *Pixels* radio button and ensure that the *Maintain aspect ratio* tickbox is ticked.

For a full width image choose 800 as the width.

Choose Save as and save it in the images folder. 

For local images use root relative paths so...
```
{% lfsimage "/images/uploads/2007/05/wtwta-giles.jpg" "Giles" %}
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
{% lfsaudio "/images/uploads/a-fake-url.mp3" "caption" %}
```

