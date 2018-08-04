##
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
# Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
# 
# 
# LFS liquid lfsaudio
#
# Example:
#    {% lfsaudio image-url image-caption %}

module Jekyll
  class LfsAudioTag < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        lfsaudio_url, lfsaudio_caption = tag_contents[0], tag_contents[1]
        lfsaudio_tag(lfsaudio_url, lfsaudio_caption)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'lfs_audio' while parsing the following markup:

  #{@markup}

Valid syntax:
{% lfsaudio audio-url audio-caption %}
eos
      end
    end

    private

    def determine_arguments(input)
      matched = input.match(/["](.*?)["] ?["](.*?)["]/)
      [matched[1].to_s.strip, matched[2].to_s.strip] if matched && matched.length >= 3
    end

    def lfsaudio_tag(lfsaudio_url, lfsaudio_caption = "audio")
        "<div class=\"well\"><p class=\"audio\">Audio: <a href=\"#{ahfowaudio_url}\">#{ahfowaudio_caption}</a></p><audio controls=\"controls\" preload=\"none\" src=\"#{ahfowaudio_url}\"></audio></div>"
    end
  end
end

Liquid::Template.register_tag('lfsaudio', Jekyll::LfsAudioTag)
