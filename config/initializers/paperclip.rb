if `ls /usr/local/bin`.match /identify/
  Paperclip.options[:command_path] = "/usr/local/bin/"
end
Paperclip.options[:whiny_thumbnails] = true
Paperclip.options[:log] = true

