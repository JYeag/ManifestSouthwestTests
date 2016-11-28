require 'page-object'
class SouthwestAirlinesMain
  include PageObject
  page_url 'https://www.southwest.com/'

  text_field(:origin, :name => 'originAirport')
  text_field(:destination, :name => 'destinationAirport')
  button(:submit, :id => 'jb-booking-form-submit-button')
  div(:depart, :class => 'js-depart-date-label')
  div(:return, :class => 'js-return-date-label')
end

class SouthwestAirlinesResults
  include PageObject
  list_item(:departure, :id => 'carouselTodayDepart')
  list_item(:returning, :id => 'carouselTodayReturn')

  list_items(:disabled_dates, :id => 'carouselDisabled')
  list_items(:enabled_dates, :id => 'carouselEnabledSodaIneligible')
end