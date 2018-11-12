class CreateEventStats < ActiveRecord::Migration[5.1]
  def change
    create_table :event_stats do |t|
      EventStat.info_keys.each do |key|
        t.string key.underscore
      end

      EventStat.id_keys.each do |key|
        t.integer key.underscore, default: 0
      end

      EventStat.stat_keys.each do |key|
        t.decimal key.underscore, precision: 12, scale: 6
      end
      t.timestamps
    end
  end
end
