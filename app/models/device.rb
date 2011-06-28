class Device < ActiveRecord::Base
  belongs_to :user

  has_many :outgoing_calls
  has_many :incomming_calls
  has_many :failed_calls

  def to_s
    exten
  end

end
