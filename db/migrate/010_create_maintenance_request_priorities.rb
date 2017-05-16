class CreateMaintenanceRequestPriorities < ActiveRecord::Migration[5.0]
  def change
    create_table :maintenance_request_priorities do |t|
      t.string :label, null: false
      t.string :description, null: false

      t.timestamps
    end

    priorities = [
      {
        label: "Low",
        description: "Fixed by end of month"
      },
      {
        label: "Medium",
        description: "Fixed by end of week"
      },
      {
        label: "High",
        description: "Fixed by end of day"
      },
      {
        label: "Immediate",
        description: "Fixing this as soon as possible"
      },
    ]

    priorities.each do |priority|
      MaintenanceRequestPriority.find_or_create_by!(priority)
    end
  end
end

