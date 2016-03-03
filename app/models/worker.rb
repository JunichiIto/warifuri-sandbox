class Worker < ActiveRecord::Base
  has_many :data

  def self.warifui!(assign_table)
    transaction do
      assign_table.each do |name, count|
        worker = Worker.find_by! name: name
        updated = Datum.not_assigned.order(:id).limit(count).update_all(worker_id: worker)
        raise "Please check count / expeced: #{count} / actual: #{updated}" if count != updated
      end
      raise 'Could not assign all' if Datum.not_assigned.exists?
    end
  end
end
