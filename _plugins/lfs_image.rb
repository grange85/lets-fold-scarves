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
# LFS liquid lfsimage
#
# Example:
#    {% lfsimage image-url image-caption %}

module Jekyll
  class LfsImageTag < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        lfsimage_url, lfsimage_caption = tag_contents[0], tag_contents[1]
        lfsimage_tag(lfsimage_url, lfsimage_caption)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'lfsimage' while parsing the following markup:

  #{@markup}

Valid syntax:
{% lfsimage image-url image-caption %}
eos
      end
    end

    private

    def determine_arguments(input)
      matched = input.match(/["](.*?)["] ?["](.*?)["]/)
      [matched[1].to_s.strip, matched[2].to_s.strip] if matched && matched.length >= 3
    end

    def lfsimage_tag(lfsimage_url, lfsimage_caption = nil)
      if lfsimage_caption.empty?
        "<figure class=\"caption aligncenter\"><img src=\"#{lfsimage_url}\" /></figure>"
      else
        "<figure class=\"caption aligncenter\"><img src=\"#{lfsimage_url}\" alt=\"#{lfsimage_caption}\" /><figcaption class=\"caption-text\">#{lfsimage_caption}</figcaption></figure>"
      end
    end
  end
end

Liquid::Template.register_tag('lfsimage', Jekyll::LfsImageTag)