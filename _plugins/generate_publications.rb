# _plugins/generate_publications.rb
module Jekyll
    class PublicationPage < Page
      def initialize(site, base, dir, pub)
        @site = site
        @base = base
        @dir  = dir
        @name = 'index.html'
  
        self.process(@name)
        self.read_yaml(File.join(base, '_layouts'), 'publication.html')
        self.data['title'] = pub['title']
        self.data['description'] = pub['description']
        self.data['date'] = pub['date']
        self.data['authors'] = pub['authors']
        self.data['embed'] = pub['embed']
        self.data['savings'] = pub['savings']
      end
    end
  
    class PublicationGenerator < Generator
      safe true
  
      def generate(site)
        site.data['publications'].each do |pub|
          slug = Jekyll::Utils.slugify(pub['title'])
          site.pages << PublicationPage.new(site, site.source, File.join('publications', slug), pub)
        end
      end
    end
  end
  