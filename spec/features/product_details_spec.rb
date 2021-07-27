require 'rails_helper'

RSpec.feature "Visitor navigates product detail page from home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Electronics'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('electronics2.jpg'),
        quantity: 3,
        price: 26.00
        )
    end
  end

  scenario "They see the product details" do
    # ACT
    visit root_path

    #navigate and click on the product
    first('.product').click_link('Details')

    # VERIFY
    expect(page).to have_css '.products-show'
    
    #DEBUG
    save_screenshot
  end

end