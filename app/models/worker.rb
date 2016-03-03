class Worker < ActiveRecord::Base
  has_many :data

  def self.warifui!
    table = {
        'Alice' => 1,
        'Bob' => 2,
        'Chris' => 5,
        'Dave' => 3,
    }
    offset = 0
    table.each do |name, count|
      worker = Worker.find_by! name: name
      Datum.where(worker_id: nil).order(:id).limit(count).update_all(worker_id: worker)
      offset += count
    end
  end
end
