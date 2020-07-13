class HomeController < ApplicationController
	def index
	end	

def scrape
	url = params[:crawled_data]
	 # binding.pry
	  response = CrawledDataSpider.process(url,current_user.id)
	  @crawls =  CrawledData.all
	  if response[:status] == :completed && response[:error].nil?
	    # flash.now[:notice] = "Successfully scraped url"
	  else
	    flash.now[:alert] = response[:error]
	    
	  end
	rescue StandardError => e
	  flash.now[:alert] = "Error: #{e}"
	  
end

  def download_data
    @crawls =  CrawledData.all

    respond_to do |format|
      format.csv { send_data @crawls.to_csv, filename: "crawled-#{Date.today}.csv" }
    end
   end

   def search_data
      email = params[:search_data]
      @crawl =  CrawledData.find_by_email(email)
   end

end
