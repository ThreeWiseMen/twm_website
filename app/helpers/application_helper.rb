# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def sense_page(c, a)
    if c == controller.controller_name and a == controller.action_name
      "active"
    end
  end
  
end
