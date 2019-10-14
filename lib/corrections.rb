def check_if_user_gave_input #Si l'utilisateur n'a pas rentré d'argument, lui afficher les infos de ce programme
  if ARGV.empty?
     abort("Pour activer ce programme il faut préciser un nom du dossier (1 seul mot)")
  elsif ARGV.length > 1
    abort("Le nom de votre dossier doit tenir en 1 mot")
  else
    return ""
  end
end

#Fonction pour créer un dossier
def create_folder(name)
  Dir.mkdir(name)
end

#Fonction qui permet de créer un fichier dans une dossier, à partir de rien
def create_file_from_scratch(folder_direction,file_name)
  return File.open("#{folder_direction}/#{file_name}", "w")
end

#Fonction pour créer un fichier et écrire à l'intérieur
def create_file(folder_direction, file_name, text_in_file)
  gemfile = create_file_from_scratch(folder_direction,file_name)
  gemfile.puts(text_in_file)
  gemfile.close
end


def perform

  unless check_if_user_gave_input.nil? #A moins que l'utilisateur n'ait pas entré les bons arguments, faire :

    #Création du dossier maitre
    create_folder(ARGV.first)

    #Création du dossier lib
    create_folder("#{ARGV.first}/lib")

    #Création du dossier spec
    create_folder("#{ARGV.first}/spec")

    #Création du fichier .env 'sans rien à l'intérieur
    create_file(ARGV.first, ".env", "")

    #Création du fichier .gitignore avec .env
    create_file(ARGV.first, ".gitignore", ".env")

    #Lister les gems thp à ajouter
    gems_thp_to_add = ["source 'https://rubygems.org'","ruby '2.5.1'","gem 'rspec'","gem 'pry'","gem 'rubocop', '~> 0.57.2'","gem 'dotenv'","gem 'nokogiri'", "gem 'open-uri'", "gem 'watir'"]
    #Lister les require thp à ajouter dans les fichiers
    requires_thp_to_add = ["#require 'rubygems'","#-------Pour le scrapping-------","#require 'nokogiri'","#require 'open-uri'","#-------Pour simuler un navigateur-------","#require 'watir'","#require 'launchy'","#-------Pour les tests------","#require 'pry'"]

    #Création du fichier Gemfile dans le dossier maitre avec les gems à ajouter au projet
    create_file(ARGV.first, "Gemfile", gems_thp_to_add.join("\n"))

    #Création d'un fichier ruby 0.rb avec les bons require relatifs aux gems
    create_file("#{ARGV.first}/lib", "0.rb", requires_thp_to_add.join("\n"))

    #Création d'un fichier 0_spec.rb avec les bons éléments pour les specs
    template_app_spec = '''require_relative "../lib/0.rb"
describe "The function_1 method" do
  it "Should return xxx for test type 1" do
    expect(function_1()).to eq("Bmfy f xywnsl!")
  end
  it "Should only xxx for test type 2" do
    expect(function_1().to eq(5)
  end
  it "Should only xxxx for test type 3" do
    expect(function_1()).to eq("invalid key")
  end
end
describe "the function_2 method" do
  it "should return xxx for test type 1" do
    expect(function_2()).not_to be_nil
  end
end'''
    create_file("#{ARGV.first}/spec", "0_spec.rb", 0_spec)

    #Initialisation des gems, github et rspec
    system("cd #{ARGV.first}\ngit init\nbundle install\nrspec --init")

    puts "\n\nVotre projet '#{ARGV.first}' créé !"
  end

end

perform
