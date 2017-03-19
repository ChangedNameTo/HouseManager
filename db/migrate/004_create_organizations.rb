class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :full_name, null: false
      t.string :abbreviation, null: false
      t.string :school, null: false
      t.string :address, null: false
      t.integer :organization_manager
      t.integer :user_manager
      t.integer :kitchen_manager
      t.integer :house_manager
      t.integer :service_manager
      t.integer :scholarship_manager

      t.timestamps
    end

    add_index :organizations, :full_name, unique: true
    add_foreign_key :organizations, :users, column:"organization_manager", name: 'fk_organization_manager'
    add_foreign_key :organizations, :users, column:"user_manager", name: 'fk_user_manager'
    add_foreign_key :organizations, :users, column:"kitchen_manager", name: 'fk_kitchen_manager'
    add_foreign_key :organizations, :users, column:"house_manager", name: 'fk_house_manager'
    add_foreign_key :organizations, :users, column:"service_manager", name: 'fk_service_manager'
    add_foreign_key :organizations, :users, column:"scholarship_manager", name: 'fk_scholarship_manager'

    execute <<-SQL
      CREATE TRIGGER remove_manager
              BEFORE UPDATE
                  ON organizations
            FOR EACH STATEMENT
                  IF NEW.organization_manager <> OLD.organization_manager THEN
                      DELETE FROM user_roles
                            WHERE user_id = OLD.organization_manager
                            WHERE role_id = (
                                              SELECT id
                                                FROM roles
                                               WHERE label ilike '%Organization Manager%'
                                            )
              ELSEIF NEW.user_manager <> OLD.user_manager THEN
                      DELETE FROM user_roles
                            WHERE user_id = OLD.user_manager
                            WHERE role_id = (
                                              SELECT id
                                                FROM roles
                                               WHERE label ilike '%User Manager%'
                                            )
              ELSEIF NEW.kitchen_manager <> OLD.kitchen_manager THEN
                      DELETE FROM user_roles
                            WHERE user_id = OLD.kitchen_manager
                            WHERE role_id = (
                                              SELECT id
                                                FROM roles
                                               WHERE label ilike '%Kitchen Manager%'
                                            )
              ELSEIF NEW.house_manager <> OLD.house_manager THEN
                      DELETE FROM user_roles
                            WHERE user_id = OLD.house_manager
                            WHERE role_id = (
                                              SELECT id
                                                FROM roles
                                               WHERE label ilike '%House Manager%'
                                            )
              ELSEIF NEW.service_manager <> OLD.service_manager THEN
                      DELETE FROM user_roles
                            WHERE user_id = OLD.service_manager
                            WHERE role_id = (
                                              SELECT id
                                                FROM roles
                                               WHERE label ilike '%Service Manager%'
                                            )
              ELSEIF NEW.scholarship_manager <> OLD.scholarship_manager THEN
                      DELETE FROM user_roles
                            WHERE user_id = OLD.scholarship_manager
                            WHERE role_id = (
                                              SELECT id
                                                FROM roles
                                               WHERE label ilike '%Scholarship Manager%'
                                            );
    SQL

    execute <<-SQL
      CREATE TRIGGER add_manager
               AFTER UPDATE
                  ON organizations
            FOR EACH STATEMENT
                  IF NEW.organization_manager <> OLD.organization_manager THEN
                      INSERT INTO user_roles
                                  (
                                    user_id,
                                    role_id,
                                    created_at,
                                    updated_at
                                  )
                           VALUES
                                  (
                                    NEW.organization_manager,
                                    (
                                      SELECT id
                                        FROM roles
                                       WHERE label
                                       ILIKE '%Organization Manager%'
                                    ),
                                    now(),
                                    now()
                                  )
              ELSEIF NEW.user_manager <> OLD.user_manager THEN
                      INSERT INTO user_roles
                                  (
                                    user_id,
                                    role_id,
                                    created_at,
                                    updated_at
                                  )
                           VALUES
                                  (
                                    NEW.user_manager,
                                    (
                                      SELECT id
                                        FROM roles
                                       WHERE label
                                       ILIKE '%User Manager%'
                                    ),
                                    now(),
                                    now()
                                  )
              ELSEIF NEW.kitchen_manager <> OLD.kitchen_manager THEN
                      INSERT INTO user_roles
                                  (
                                    user_id,
                                    role_id,
                                    created_at,
                                    updated_at
                                  )
                           VALUES
                                  (
                                    NEW.kitchen_manager,
                                    (
                                      SELECT id
                                        FROM roles
                                       WHERE label
                                       ILIKE '%Kitchen Manager%'
                                    ),
                                    now(),
                                    now()
                                  )
              ELSEIF NEW.house_manager <> OLD.house_manager THEN
                      INSERT INTO user_roles
                                  (
                                    user_id,
                                    role_id,
                                    created_at,
                                    updated_at
                                  )
                           VALUES
                                  (
                                    NEW.house_manager,
                                    (
                                      SELECT id
                                        FROM roles
                                       WHERE label
                                       ILIKE '%House Manager%'
                                    ),
                                    now(),
                                    now()
                                  )
              ELSEIF NEW.service_manager <> OLD.service_manager THEN
                      INSERT INTO user_roles
                                  (
                                    user_id,
                                    role_id,
                                    created_at,
                                    updated_at
                                  )
                           VALUES
                                  (
                                    NEW.service_manager,
                                    (
                                      SELECT id
                                        FROM roles
                                       WHERE label
                                       ILIKE '%Service Manager%'
                                    ),
                                    now(),
                                    now()
                                  )
              ELSEIF NEW.scholarship_manager <> OLD.scholarship_manager THEN
                      INSERT INTO user_roles
                                  (
                                    user_id,
                                    role_id,
                                    created_at,
                                    updated_at
                                  )
                           VALUES
                                  (
                                    NEW.scholarship_manager,
                                    (
                                      SELECT id
                                        FROM roles
                                       WHERE label
                                       ILIKE '%Scholarship Manager%'
                                    ),
                                    now(),
                                    now()
                                  );
    SQL

    organizations = [
      {
        full_name: "Phi Sigma Kappa",
        abbreviation: "PSK",
        school: "Georgia Tech",
        address: "825 Techwood Drive NW"
      }

    ]

    organizations.each do |organization|
      Organization.find_or_create_by!(organization)
    end
  end
end
