if `ls /usr/local/bin`.match /identify/
  Paperclip.options[:command_path] = "/usr/lib/ImageMagick-6.5.1/"
end
Paperclip.options[:whiny_thumbnails] = true
Paperclip.options[:log] = true

