When(/^I search for a flight using the default dates$/) do
  visit_page SouthwestAirlinesMain do |page|
    page.origin = 'CMH'
    page.destination = 'FLL'
    @depart_date = Date.parse(page.depart_element.text)
    @return_date = Date.parse(page.return_element.text)
    page.submit
    sleep(2)
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page SouthwestAirlinesResults do |page|
    depart_result = Date.parse(page.departure_element.attribute('carouselfulldate'))
    return_result = Date.parse(page.returning_element.attribute('carouselfulldate'))

    expect(depart_result).to eq @depart_date
    expect(return_result).to eq @return_date
  end
end

Then(/^I can't choose a departure date from the past$/) do
  on_page SouthwestAirlinesResults do |page|
    page.disabled_dates_elements.each do |checked_date|
      date = Date.parse(checked_date.attribute('carouselfulldate'))

      expect(date).to be < Date.today
    end

    page.enabled_dates_elements.each do |checked_date|
      date = Date.parse(checked_date.attribute('carouselfulldate'))

      expect(date).to be >= Date.today
    end
  end
end

