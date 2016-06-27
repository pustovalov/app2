require "rails_helper"
require "support/helpers/login_helper.rb"
include LoginHelper

describe Flickr do
  it "valid answer" do
    VCR.use_cassette 'flickr', match_requests_on: [:host] do
      @answer = Flickr.find("car")
    end
    expect(@answer).to be_instance_of(FlickRaw::ResponseList)
    expect(@answer.length).to eq 10
  end
end

describe "user add image" do
  let!(:user) { create(:user_with_one_block_without_cards) }
  before do
    visit login_path
    login('test@test.com', '12345')
  end

  scenario "to new card", :js do
    visit new_card_path
    find(".ac-flickr-toggle").click
    find(".ac-flickr-search-field").set("car")
    VCR.use_cassette 'flickr' do
      find(".ac-flickr-submit").click
    end
    expect(page).to have_xpath "//li/a/img"
  end
end
