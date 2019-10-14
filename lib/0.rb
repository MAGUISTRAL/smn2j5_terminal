require 'rspec'
require 'pry'
require 'nokogiri'
require 'watir'
require 'open-uri'

def get_name
puts ARGV
end

def check_if_user_gave_input
  abort("mkdir: missing input") if ARGV.empty?
end

def get_folder_name
  return folder_name = ARGV.first
end

def create_folder(name)
  Dir.mkdir(name)
end

#     créer un alias mkdiruby="ruby /home/ton/chemin/vers/dossier/mkdiruby.rb"

def perform
  get_name
  check_if_user_gave_input
  get_folder_name
  create_folder(name)
end

perform
