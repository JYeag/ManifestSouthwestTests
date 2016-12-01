When(/^I search for a flight using the default dates$/) do
  visit_page SouthwestHome
  on_page SouthwestHome do |page|
    @departure_date = Date.parse(page.departure_date)
    @return_date = Date.parse(page.return_date)
    page.departure_airport = 'CMH'
    page.arrival_airport = 'FLL'
    page.search
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page SouthwestResults do |page|
    highlighted_departure_date = Date.parse(page.highlighted_departure_date)
    highlighted_return_date = Date.parse(page.highlighted_return_date)
    expect(highlighted_departure_date).to eq @departure_date
  end
end

Then(/^I can't choose a departure date from the past$/) do
  on_page SouthwestResults do |page|
    list_of_disabled_dates = page.list_of_disabled_dates
    list_of_enabled_dates = page.list_of_enabled_dates
    list_of_disabled_dates.each do |disabled_date|
        expect(Date.parse(disabled_date.attribute('carouselfulldate'))).to be < Date.today
    end
    list_of_enabled_dates.each do |enabled_date|
        expect(Date.parse(enabled_date.attribute('carouselfulldate'))).to be >= Date.today
    end
  end
end
