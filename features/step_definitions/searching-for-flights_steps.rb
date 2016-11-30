When(/^I search for a flight using the default dates$/) do
  visit_page SouthwestAirlinesMain do |page|
    page.origin = 'CMH'
    page.destination = 'FLL'
    @depart_date = Date.parse(page.depart)
    @return_date = Date.parse(page.return)
    page.submit
    sleep(1)
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page SouthwestAirlinesResults do |page|
    depart_result = Date.parse(page.departure)
    return_result = Date.parse(page.returning)

    expect(depart_result).to eq @depart_date
    expect(return_result).to eq @return_date
  end
end

Then(/^I can't choose a departure date from the past$/) do
  on_page SouthwestAirlinesResults do |page|
    page.depart_div_element.list_item_elements.each do |checked_date|
      date = Date.parse(checked_date.attribute('carouselfulldate'))
      if(checked_date.attribute('class') == 'carouselDisabled')
        expect(date).to be < Date.today
      else
        expect(date).to be >= Date.today
      end
    end

    page.return_div_element.list_item_elements.each do |checked_date|
      date = Date.parse(checked_date.attribute('carouselfulldate'))
      if(checked_date.attribute('class') == 'carouselDisabled')
        expect(date).to be < Date.today
      else
        expect(date).to be >= Date.today
      end
    end
  end
end
