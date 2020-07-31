require "google_drive"
class WelcomeController < ApplicationController
  def index
    final=[]
    session = GoogleDrive::Session.from_config("config.json")
    session.files.each do |file|
      item=Hash.new
      item["title"]=file.title
      item["size"]=(file.size / (1024.0 * 1024.0)).round(2)
      item["Time"]=Time.parse(file.modified_time.to_s)
      final.append(item) 
    end
    @Session=final
  end
end
