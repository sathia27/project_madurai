require_relative "project_madurai/version"
require_relative "project_madurai/meta_data"
require_relative "cover_page_generator/image.rb"
class Extractor
  def initialize image
    File.open(image)
    @image = image
  end
  def start
    details = ProjectMadurai::MetaData.new.list
    Dir.mkdir("project_madurai") rescue true
    image_index = 1
    details.each do |detail|
      puts CoverPageGenerator::Image.new(@image, detail[:title], detail[:author], image_index).generate
      image_index+=1
    end
  end
end
