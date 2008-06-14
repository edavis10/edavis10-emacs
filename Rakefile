#!/usr/bin/env ruby
require "fileutils"
require 'rake/clean'

@elisp="~/.elisp"

desc "delete all byte compiled files"
task :clean_byte do
  Dir['**/**.elc'].each do |file|
    File.delete(file)
  end
end

desc "byte compile all emacs files"
task :compile do
  system("emacs -batch -f batch-byte-recompile-directory #{@elisp}")
end
