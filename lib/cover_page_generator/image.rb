require "RMagick"
module CoverPageGenerator
  class Image
    def initialize file_name, title, author
      @file_name = file_name || "public/image.jpg"
      @title = title
      @author = author
      public_folder = File.expand_path('../../../public', __FILE__)
      puts public_folder
      @font = "#{public_folder}/ta.ttf"
    end

    def generate
      pwd = Dir.pwd
      img =  Magick::ImageList.new(@file_name)
      canvas = Magick::ImageList.new
      canvas.new_image(450, 700, Magick::TextureFill.new(img))
      text = Magick::Draw.new
      text.encoding = "Unicode"
      text.font = @font
      text.gravity = Magick::CenterGravity
      @title  = @title.scan(/\S.{0,30}\S(?=\s|$)|\S+/).join("\n")
      text.annotate(canvas, 450,300,0,0, @title) {
        self.fill = '#fff'
        self.pointsize = 30
      }
      text.annotate(canvas, 450,500,0,0, @author) {
        self.fill = '#fff'
        self.pointsize = 22
      }
      titlize = @title.gsub(" ", "_").gsub("/", "_").gsub("\n", "_")
      puts "Generating '#{(pwd + "/project_madurai/" + titlize + ".jpg")}'"
      canvas.write(pwd + "/project_madurai/" + titlize + ".jpg")
    end
  end
end

