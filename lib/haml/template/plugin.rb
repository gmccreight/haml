# :stopdoc:
# This file makes Haml work with Rails
# using the > 2.0.1 template handler API.

module Haml
  class Template
    include Compilable if defined?(ActionView::TemplateHandlers::Compilable)

    def self.line_offset
      1
    end
 
    def line_offset
      self.class.line_offset
    end

    def initialize(view)
      @view = view
    end

    def compile(template)
      options = Haml::Template.options.dup
      Haml::Engine.new(template, options).send(:precompiled_with_ambles, [])
    end
  end
end

ActionView::Base.register_template_handler(:haml, Haml::Template)
# :startdoc:
