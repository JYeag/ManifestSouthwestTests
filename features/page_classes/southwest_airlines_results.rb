class SouthwestAirlinesResults
  include PageObject
  list_item(:departure, :id => 'carouselTodayDepart')
  list_item(:returning, :id => 'carouselTodayReturn')

  list_items(:disabled_dates, :id => 'carouselDisabled')
  list_items(:enabled_dates, :id => 'carouselEnabledSodaIneligible')
end
