require 'spec_helper'

# Each entry has a "click to reveal changes" link to display details in a popup
# These tables are nested and contain duplicate information, so it's difficult
# to target cells using anything but row and column numbers
def expect_hidden_details(details, table: nil, row: 0, column: 0)
  within(:css, "table#{table}>tbody") do
    expect(page).to_not have_content(details)
    find(:css, "tr:nth-child(#{row}) td:nth-child(#{column}) a").click
    expect(page).to have_content(details)
  end
end

RSpec.feature 'Order History', :type => :feature, js: true do
  let!(:order) { create(:order, number: 'R212345678') }

  before :each do
    login_as_admin
  end

  it "tracks order history" do
    visit spree.versions_admin_order_path(order)
    expect(page).to have_css("table#order-history>tbody tr", count: 2)

    order.update(email: 'foo@bar.com')
    visit(current_path)

    expect(page).to have_css("table#order-history>tbody tr", count: 3)
    expect_hidden_details('R212345678', table: '#order-history', row: 1, column: 5)
  end

  it "tracks order line item history" do
    visit spree.versions_admin_order_path(order)

    expect(page).to have_css("table#line-item-history>tbody tr", count: 0)

    order.contents.add(create(:variant, currency: 'USD'))
    visit(current_path)

    expect(page).to have_css("table#line-item-history>tbody tr", count: 2)
    expect_hidden_details('USD', table: '#line-item-history', row: 1, column: 7)
  end
end
