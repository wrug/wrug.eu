#encoding: utf-8
require 'yaml'

module Jekyll

  class SlidesPage < Page
    def initialize(site, base, meetings)
      @site = site
      @base = base
      @dir = "/slides"
      @name = 'index.html'
      self.process @name
      self.read_yaml File.join(base, '_layouts'), 'slides.html'
      {
        title: "Materiały",
        section: "slides",
        layout: 'default',
        meetings: meetings,
      }.each { |k, v| self.data[k.to_s] = v }
    end
  end

  class SlidesGenerator < Generator
    safe true

    def generate(site)
      data = YAML.load File.read site.config['people_file']
      meetings = {}
      data.each do |person|
        person['talks'].each do |talk|
          date = talk['date']
          meetings[date] ||= []
          meetings[date] << {'slides' => talk['slides'], 'title' => talk['title'], 'date' => talk['date'], 'author' => person['fullname']}
        end
      end
      meetings = meetings.sort { |a,b| b[0] <=> a[0] }
      site.pages << SlidesPage.new(site, site.source, meetings)
    end
  end

end
