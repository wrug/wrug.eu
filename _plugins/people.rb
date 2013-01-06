require 'yaml'

module Jekyll

  class PeoplePage < Page
    def initialize(site, base, people)
      @site = site
      @base = base
      @dir = "/people"
      @name = 'index.html'
      self.process @name
      self.read_yaml File.join(base, '_layouts'), 'people.html'
      {
        title: "Ludzie",
        section: "people",
        layout: 'default',
        people: people,
      }.each { |k, v| self.data[k.to_s] = v }
    end
  end

  class PeopleGenerator < Generator
    safe true

    def generate(site)
      data = YAML.load File.read site.config['people_file']
      data.sort! { |a, b| a['fullname'] <=> b['fullname'] }
      site.pages << PeoplePage.new(site, site.source, data)
    end
  end

end
