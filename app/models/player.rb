class Player < ActiveRecord::Base
  
  BOWLING_TYPES = %w(NA Fast Medium MediumFast Slow Chinaman Orthodox LegSpin OffSpin)
  BATTING_HAND = %w(RightHand LeftHand)
  BOWLING_TYPE = %w(RightHanded LeftHanded)
  
  def full_name
    "#{self.first_name.titleize} #{self.last_name.titleize}"
  end
end
