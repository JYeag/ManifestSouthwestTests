class SouthwestAirlinesResults
  include PageObject
  list_item(:departure, :id => 'carouselTodayDepart')
  list_item(:returning, :id => 'carouselTodayReturn')

  div(:depart_div, :id => 'newDepartDateCarousel')
  div(:return_div, :id => 'newReturnDateCarousel')
end
