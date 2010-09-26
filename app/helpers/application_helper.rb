module ApplicationHelper

  def sense_page(c, a)
    if c == controller.controller_name and a == controller.action_name
      "active"
    end
  end

end
