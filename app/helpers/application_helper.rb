# frozen_string_literal: true

module ApplicationHelper
  def active?(current)
    'active' if current == controller_name
  end

  def flash_class(key)
    case key.to_s
    when 'notice'
      'success'
    when 'alert'
      'warning'
    else
      'default'
    end
  end
end
