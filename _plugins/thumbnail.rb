module Jekyll
  class RenderThumbTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
       @attributes = {}

      text.scan(Liquid::TagAttributes) do |key, value|
        @attributes[key] = value.gsub(/^'|"/, '').gsub(/'|"$/, '')
      end
 @alt = @attributes['alt'].to_s
     @text = @attributes['image'].to_s
      @text2 = @attributes['image'].to_s.gsub('.png','-small.png')
    end

    def render(context)
      "<a href=\"#{context.registers[:site].config['baseurl']}#{@text}\" ><img alt=\"#{@alt}\" src=\"#{context.registers[:site].config['baseurl']}#{@text2}\"/></a>"
    end
  end
end

Liquid::Template.register_tag('thumbnail', Jekyll::RenderThumbTag)
