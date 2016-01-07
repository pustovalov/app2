class Home::HomeController < Home::BaseController
  def index
    @card = find_card(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end
end
