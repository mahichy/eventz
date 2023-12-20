class Event < ApplicationRecord

  def self.upcoming
    where("starts_at > ?", Time.now).order("starts_at desc")
  end


  def free?
    price.blank? || price.zero? 
  end
end
