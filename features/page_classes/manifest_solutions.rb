class ManifestSolutions
  include PageObject
  page_url 'http://manifestcorp.com/opportunities/all-opportunities/'

  select(:type, :name => 'opportunity_type')
  select(:location, :name =>'opportunity_loc')
  div(:opp_list, :class => 'opp-table')
end
