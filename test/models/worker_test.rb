require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  test "warifuri!" do
    alice = Worker.create! name: 'Alice'
    bob = Worker.create! name: 'Bob'
    chris = Worker.create! name: 'Chris'
    dave = Worker.create! name: 'Dave'

    (1..11).each do |i|
      Datum.create! label: "data-#{i}"
    end

    table = {
        'Alice' => 1,
        'Bob' => 2,
        'Chris' => 5,
        'Dave' => 3,
    }

    Worker.warifui!(table)

    data_alice = alice.reload.data.order(:id).pluck(:label)
    assert_equal %w(data-1), data_alice

    data_bob = bob.reload.data.order(:id).pluck(:label)
    assert_equal %w(data-2 data-3), data_bob

    data_chris = chris.reload.data.order(:id).pluck(:label)
    assert_equal %w(data-4 data-5 data-6 data-7 data-8), data_chris

    data_dave = dave.reload.data.order(:id).pluck(:label)
    assert_equal %w(data-9 data-10 data-11), data_dave

    assert_equal [], Datum.where(worker_id: nil)
  end
end
