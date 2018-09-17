module CalculatorsHelper
  def options_for_function_select
    %w(normdist multiply minus_multiply zero).map do |key|
      [I18n.t('functions.' + key), key]
    end
  end

  def options_for_per_mode_select
    %w(match _minute minute).map do |key|
      [I18n.t('per_mode.' + key), key]
    end
  end

  def class_key(key)
    key.gsub('/', '-')
  end
end
