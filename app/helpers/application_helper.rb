module ApplicationHelper

  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'
  
  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet 
  end

  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow'}
    }

    extensions = {
      autolink:                     true,
      highlight:                    true,
      superscript:                  true,
      disable_indented_code_blocks: true,
      space_after_headers:          true,
      fenced_code_blocks:           true,
      no_intra_emphasis:            true
    }

    #renderer = Redcarpet::Render::HTML.new(options)
    renderer = HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end