require 'page-object'
class ManifestSolutions
  include PageObject
  page_url 'http://manifestcorp.com/opportunities/all-opportunities/'

  select(:type, :name => 'opportunity_type')
  select(:location, :name =>'opportunity_loc')
  divs(:opp_loc, :class => 'opp-loc')
  divs(:opp_type, :class => 'opp-type')
end
