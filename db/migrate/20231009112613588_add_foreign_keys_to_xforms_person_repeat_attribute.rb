# frozen_string_literal: true

# Migration responsible for adding foreign keys to the xforms_person_repeat_attribute table
class AddForeignKeysToXformsPersonRepeatAttribute < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :xforms_person_repeat_attribute, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :xforms_person_repeat_attribute, :users, column: :creator, primary_key: :user_id
    add_foreign_key :xforms_person_repeat_attribute, :users, column: :voided_by, primary_key: :user_id
    add_foreign_key :xforms_person_repeat_attribute, :person_attribute_type, column: :person_attribute_type_id, primary_key: :person_attribute_type_id
    add_foreign_key :xforms_person_repeat_attribute, :person, column: :person_id, primary_key: :person_id
  end
end
