## {% issue #issue %} will generate a code for bugzilla netbeans issue

module Jekyll
  class RenderIssueTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "<a href=\"https://netbeans.org/bugzilla/show_bug.cgi?id=#{@text}\" >Issue #{@text}</a>"
    end
  end
end

Liquid::Template.register_tag('issue', Jekyll::RenderIssueTag)
