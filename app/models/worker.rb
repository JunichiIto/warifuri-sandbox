class Worker < ActiveRecord::Base
  has_many :data

  def self.warifui!(assign_table)
    offset = 0
    assign_table.each do |name, count|
      worker = Worker.find_by! name: name
      Datum.where(worker_id: nil).order(:id).limit(count).update_all(worker_id: worker)
      offset += count
    end
  end
end
