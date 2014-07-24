module HtmlGenerator
  class Html
    def initialize title, author, font, bg
      @title = title
      @author = author
      @font = font
      @bg = bg
    end

    def to_html
      <<-EOM
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="UTF-8">
          <title>#{@title}</title>
          <style>
            @font-face {
              font-family: 'TamilFont';
              url('#{@font}') format('truetype')
            }
          </style>
        </head>
        <body style='background:url("#{@bg}") no-repeat;text-align:center;color:#fff'>
          <div style='padding:10px'>
            <h1 style="font-weight:bold">#{@title}</h1>
            <p style='position:absolute;width:100%;bottom:100px;font-size:25px;color:#a00'>#{@author}</p>
          </div>
        </body>
      </html>
      EOM
    end
  end
end
