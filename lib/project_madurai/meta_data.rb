require 'nokogiri'
require 'open-uri'
module ProjectMadurai
  class MetaData
    def page
      Nokogiri::HTML(open("http://www.projectmadurai.org/pmworks.html"))
    end

    def parent_node
      "table.sortable tr"
    end

    def list
      details = []
      page.search(parent_node).each do |node|
        if node.css('td') && node.css('td')[1] && node.css('td')[2]
          detail = {}
          detail[:title] = node.css('td')[1].text
          detail[:author] = node.css('td')[2].text
          details << detail
        end
      end
      details
    end
  end
end
