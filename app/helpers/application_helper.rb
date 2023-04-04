module ApplicationHelper

  include Pagy::Frontend

  def navigation_at()
    render partial: 'navigator/navbar'
  end

  def menu_at()
    render partial: 'navigator/menu'
  end

end
