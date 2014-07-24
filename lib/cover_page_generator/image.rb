require_relative '../html_generator/html'
module CoverPageGenerator
  class Image
    def initialize file_name, title, author, image_index
      @file_name = file_name || "public/image.jpg"
      @title = title
      @author = author
      @public_folder = File.expand_path('../../../public', __FILE__)
      @font = "#{@public_folder}/tam.ttf"
      @html_content = HtmlGenerator::Html.new(@title, @author, @font, @file_name)
      @html_file = File.open("#{@public_folder}/html_files/1.html", "w")
      @image_index = image_index
    end

    def generate
      @html_file.write(@html_content.to_html)
      @html_file.close
      system("phantomjs #{@public_folder}/phantomjs/rasterize.js #{@public_folder}/html_files/1.html project_madurai/#{@image_index}.jpg '450px*700px'")
      "Generating project/madurai/#{@image_index}.jpg => @{title}"
    end
  end
end

