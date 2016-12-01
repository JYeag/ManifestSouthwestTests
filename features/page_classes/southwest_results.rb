class SouthwestResults
  include PageObject
  list_item(:highlighted_departure_date, :id => 'carouselTodayDepart')
  list_item(:highlighted_return_date, :id => 'carouselTodayReturn')

  list_items(:list_of_disabled_dates, :class => 'carouselDisabled')
  def list_of_disabled_dates
    list_of_disabled_dates_elements
  end

  list_items(:list_of_enabled_dates, :class => 'carouselEnabledSodaIneligible')
  def list_of_enabled_dates
    list_of_enabled_dates_elements
  end
end
