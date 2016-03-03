class Datum < ActiveRecord::Base
  belongs_to :worker

  scope :assigned, -> { where.not(worker_id: nil) }
  scope :not_assigned, -> { where(worker_id: nil) }
end
