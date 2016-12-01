When(/^I filter jobs by Columbus$/) do
  visit_page ManifestSolutions do |page|
    page.location = 'Columbus, OH'
    sleep(1)
  end
end

Then(/^only Columbus opportunities are present$/) do
  on_page ManifestSolutions do |page|
    opp_locs = page.opp_locs
    opp_locs.each do |opp_loc|
      expect(opp_loc.text).to eq 'Columbus, OH'
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
    opp_types = page.opp_types
    opp_types.each do |opp_type|
      expect(opp_type.text).to eq 'Contract'
    end
  end
end
