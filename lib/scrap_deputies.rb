# require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_deputies
  deputies_list = []
  done = [] # les deputes deja traites

  (0..11).each do |page_num| # pour chacune des 12 pages du site

    url = "https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50&"+
    "debut_deputes=#{page_num * 50}&lang=fr#pagination_deputes"

    puts "scraping #{url}"
    Nokogiri::HTML(open(url)).search("ul.list_ann").each do
      |el| # HTML element
      deputy = {}
      block = Nokogiri::HTML(el.to_html)
      full_name = block.search("h2")[0].text
      if done.include?(full_name)
        puts "------#{full_name} est déjà là !"
      else
        deputy[:full_name] = full_name
        # deputy[:pol_group] = block.search("//ul/li[3]")[0].text.gsub(/<span> +(Groupe politique|GROUPE POLITIQUE) +\: +/,"")
        deputy[:email] = block.search("li @href")[0].text.gsub("mailto:","")

        deputy = process_data(deputy)
        puts "-------"
        print deputy
        puts "-------"
        deputies_list << deputy
        done << full_name
      end
    end
  end

  return deputies_list
end

def process_data (deputy)
  deputy[:first_name] = deputy[:full_name].split(" ")[1]
  deputy[:last_name] = deputy[:full_name].split(" ")[2..-1].join(" ")
  return deputy
end
