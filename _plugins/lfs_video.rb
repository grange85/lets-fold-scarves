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
# AHFoW liquid lfsvid
#
# Example:
#    {% lfsvid youtube-id video-caption %}

module Jekyll
  class LfsVidTag < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        lfsvid_url, lfsvid_caption = tag_contents[0], tag_contents[1]
        lfsvid_tag(lfsvid_url, lfsvid_caption)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'lfsvid' while parsing the following markup:

  #{@markup}

Valid syntax:
{% lfsvid youtube-id video-caption %}
eos
      end
    end

    private

    def determine_arguments(input)
      matched = input.match(/["](.*?)["] ?["](.*?)["]/)
      [matched[1].to_s.strip, matched[2].to_s.strip] if matched && matched.length >= 3
    end

    def lfsvid_tag(lfsvid_url, lfsvid_caption = nil)
      if lfsvid_caption.empty?
        "<figure class=\"caption aligncenter\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/#{lfsvid_url}\" frameborder=\"0\" allowfullscreen></iframe></figure>"
      else
        "<figure class=\"caption aligncenter\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/#{lfsvid_url}\" frameborder=\"0\" allowfullscreen></iframe><figcaption class=\"caption-text\">#{lfsvid_caption}</figcaption></figure>"
      end
    end
  end
end

Liquid::Template.register_tag('lfsvid', Jekyll::LfsVidTag)
