class ManifestSolutions
  include PageObject
  page_url 'http://manifestcorp.com/opportunities/all-opportunities/'

  select(:type, :name => 'opportunity_type')
  select(:location, :name =>'opportunity_loc')

  divs(:opp_locs, :class => 'opp-loc')
  def opp_locs
    opp_locs_elements
  end

  divs(:opp_types, :class => 'opp-type')
  def opp_types
    opp_types_elements
  end
  
end
