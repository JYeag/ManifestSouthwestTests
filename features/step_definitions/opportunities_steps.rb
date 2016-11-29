require 'page-object'
include PageObject::PageFactory
When(/^I filter jobs by Columbus$/) do
  visit_page ManifestSolutions do |page|
    page.location = 'Columbus, OH'
    sleep(1)
  end
end

Then(/^only Columbus opportunities are present$/) do
  on_page ManifestSolutions do |page|
    page.opp_loc_elements.each do |element|
      expect(element.text).to eq 'Columbus, OH'
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
    page.opp_type_elements.each do |element|
      expect(element.text).to eq 'Contract'
    end
  end
end
