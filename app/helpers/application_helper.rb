module ApplicationHelper

  def full_title(title)
    'XTScore'
  end

  def format_num(num)
    if num.to_i == num
      num.to_i
    else
      num.to_f.round(2)
    end
  end
end
