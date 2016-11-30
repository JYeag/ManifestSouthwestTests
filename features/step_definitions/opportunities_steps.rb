When(/^I filter jobs by Columbus$/) do
  visit_page ManifestSolutions do |page|
    page.location = 'Columbus, OH'
    sleep(1)
  end
end

Then(/^only Columbus opportunities are present$/) do
  on_page ManifestSolutions do |page|
    page.opp_list_element.div_elements.each do |element|
      if(element.attribute('class') == 'opp-loc')
        expect(element.text).to eq 'Columbus, OH'
      end
    end
  end
end

When(/^I filter jobs by contract$/) do
  visit_page ManifestSolutions do |page|
    page.type = 'Contract'
    sleep(1)
    end
end

Then(/^only contract opportunities are present$/) do
  on_page ManifestSolutions do |page|
    page.opp_list_element.div_elements.each do |element|
      if(element.attribute('class') == 'opp-type')
        expect(element.text).to eq 'Contract'
      end
    end
  end
end
