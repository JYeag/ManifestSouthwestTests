class SouthwestHome
  include PageObject
  page_url 'https://www.southwest.com/'

  text_field(:departure_airport, :name => 'originAirport')
  text_field(:arrival_airport, :name => 'destinationAirport')
  button(:search, :id => 'jb-booking-form-submit-button')
  div(:departure_date, :class => 'js-depart-date-label')
  div(:return_date, :class => 'js-return-date-label')
end
