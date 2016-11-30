class SouthwestAirlinesMain
  include PageObject
  page_url 'https://www.southwest.com/'

  text_field(:origin, :name => 'originAirport')
  text_field(:destination, :name => 'destinationAirport')
  button(:submit, :id => 'jb-booking-form-submit-button')
  div(:depart, :class => 'js-depart-date-label')
  div(:return, :class => 'js-return-date-label')
end
