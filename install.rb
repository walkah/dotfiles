#!/usr/bin/env ruby

# from http://errtheblog.com/posts/89-huba-huba

home = File.expand_path('~')

Dir['*'].each do |file|
  next if file =~ /install/ || file =~ /README/
  target = File.join(home, ".#{file}")
  unless File.exist? target
    `ln -vsf #{File.expand_path file} #{target}`
  else
    unless File.symlink? target
      puts "#{target} exists"
    end
  end
end
