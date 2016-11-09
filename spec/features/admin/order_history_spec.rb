require 'spec_helper'

# Each entry has a "click to reveal changes" link to display details in a popup
# These tables are nested and contain duplicate information, so it's difficult
# to target cells using anything but row and column numbers
def expect_hidden_details(details, table: nil, row: 0, column: 0)
  within(:css, "table#{table}>tbody") do
    find(:css, "tr:nth-child(#{row}) td:nth-child(#{column}) a").click
    within '.object-changes' do
      expect(page).to have_content(details)
    end
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

    variant = create(:variant)
    order.contents.add(variant)
    visit(current_path)

    expect(page).to have_css("table#line-item-history>tbody tr", count: 2)
    expect_hidden_details(variant.price, table: '#line-item-history', row: 1, column: 7)
  end

  it "tracks order adjustment history" do
    visit spree.versions_admin_order_path(order)

    expect(page).to have_css("table#adjustment-history>tbody tr", count: 0)

    create(:tax_adjustment, adjustable: order, order: order)
    visit(current_path)

    expect(page).to have_css("table#adjustment-history>tbody tr", count: 2)
    expect_hidden_details('Spree::TaxRate', table: '#adjustment-history', row: 1, column: 6)
  end

  it "tracks order payment history" do
    visit spree.versions_admin_order_path(order)

    expect(page).to have_css("table#payment-history>tbody tr", count: 1)

    create(:payment, order: order, response_code: '54321')
    visit(current_path)

    expect(page).to have_css("table#payment-history>tbody tr", count: 3)
    expect_hidden_details('54321', table: '#payment-history', row: 1, column: 7)
  end

  it "tracks order shipment history" do
    visit spree.versions_admin_order_path(order)

    expect(page).to have_css("table#shipment-history>tbody tr", count: 0)

    create(:shipment, order: order, stock_location: create(:stock_location, id: 9182736))
    visit(current_path)

    expect(page).to have_css("table#shipment-history>tbody tr", count: 2)
    expect_hidden_details('9182736', table: '#shipment-history', row: 1, column: 7)
  end

  context 'with shipped order' do
    let!(:order) { create(:shipped_order) }

    it "tracks order return authorizations history" do
      visit spree.versions_admin_order_path(order)

      expect(page).to have_css("table#returns-history>tbody tr", count: 0)
      create(:return_authorization, order: order, memo: 'All wrong.')
      visit(current_path)

      expect(page).to have_css("table#returns-history>tbody tr", count: 2)
      expect_hidden_details('All wrong.', table: '#returns-history', row: 1, column: 6)
    end
  end
end
