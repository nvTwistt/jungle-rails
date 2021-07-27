require 'rails_helper'

RSpec.feature "Vistor adds product to cart", type: :feature, js: true do

  # SETUP
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

  scenario "Cart updates and adds 1 to the count" do
    # ACT
    visit root_path
    first('.product').click_button('Add')

    # VERIFY
    expect(page).to have_text 'My Cart (1)'

    # DEBUG
    save_screenshot
  end
end
