class Position < ApplicationRecord
  def to_s
    name
  end

  def xt_position
    if %w(FW FWL FWR AML AMR).include?(name)
      'FW'
    elsif %w(AMC SS).include?(name)
      'AMC/SS'
    elsif %w(WF IF).include?(name)
      'WF/IF'
    elsif %w(CM LCM RCM MC ML MR).include?(name)
      'CM/LCM/RCM'
    elsif %w(DM DMC DML DMR).include?(name)
      'DM'
    elsif %w(DL DR).include?(name)
      'DL/DR'
    else
      name
    end
  end
end
