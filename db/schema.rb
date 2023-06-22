# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "allergy", primary_key: "allergy_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "severity_concept_id"
    t.integer "coded_allergen", null: false
    t.string "non_coded_allergen"
    t.string "allergen_type", limit: 50, null: false
    t.string "comment", limit: 1024
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: true, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38
    t.index ["allergy_id"], name: "allergy_id", unique: true
    t.index ["changed_by"], name: "allergy_changed_by_fk"
    t.index ["coded_allergen"], name: "allergy_coded_allergen_fk"
    t.index ["creator"], name: "allergy_creator_fk"
    t.index ["patient_id"], name: "allergy_patient_id_fk"
    t.index ["severity_concept_id"], name: "allergy_severity_concept_id_fk"
    t.index ["voided_by"], name: "allergy_voided_by_fk"
  end

  create_table "allergy_reaction", primary_key: "allergy_reaction_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "allergy_id", null: false
    t.integer "reaction_concept_id", null: false
    t.string "reaction_non_coded"
    t.string "uuid", limit: 38
    t.index ["allergy_id"], name: "allergy_reaction_allergy_id_fk"
    t.index ["allergy_reaction_id"], name: "allergy_reaction_id", unique: true
    t.index ["reaction_concept_id"], name: "allergy_reaction_reaction_concept_id_fk"
  end

  create_table "care_setting", primary_key: "care_setting_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "care_setting_type", limit: 50, null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "care_setting_changed_by"
    t.index ["creator"], name: "care_setting_creator"
    t.index ["name"], name: "name", unique: true
    t.index ["retired_by"], name: "care_setting_retired_by"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "clob_datatype_storage", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.text "value", size: :long, null: false
    t.index ["uuid"], name: "clob_datatype_storage_uuid_index", unique: true
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "cohort", primary_key: "cohort_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1000
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_changed_cohort"
    t.index ["creator"], name: "cohort_creator"
    t.index ["uuid"], name: "cohort_uuid_index", unique: true
    t.index ["voided_by"], name: "user_who_voided_cohort"
  end

  create_table "cohort_member", primary_key: "cohort_member_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "cohort_id", null: false
    t.integer "patient_id", null: false
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["cohort_id"], name: "cohort"
    t.index ["creator"], name: "cohort_member_creator"
    t.index ["patient_id"], name: "patient"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "concept", primary_key: "concept_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.boolean "retired", default: false, null: false
    t.string "short_name"
    t.text "description"
    t.text "form_text"
    t.integer "datatype_id", default: 0, null: false
    t.integer "class_id", default: 0, null: false
    t.boolean "is_set", default: false, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "version", limit: 50
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_changed_concept"
    t.index ["class_id"], name: "concept_classes"
    t.index ["creator"], name: "concept_creator"
    t.index ["datatype_id"], name: "concept_datatypes"
    t.index ["retired_by"], name: "user_who_retired_concept"
    t.index ["uuid"], name: "concept_uuid_index", unique: true
  end

  create_table "concept_answer", primary_key: "concept_answer_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", default: 0, null: false
    t.integer "answer_concept"
    t.integer "answer_drug"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "uuid", limit: 38, null: false
    t.float "sort_weight", limit: 53
    t.index ["answer_concept"], name: "answer"
    t.index ["answer_drug"], name: "answer_answer_drug_fk"
    t.index ["concept_id"], name: "answers_for_concept"
    t.index ["creator"], name: "answer_creator"
    t.index ["uuid"], name: "concept_answer_uuid_index", unique: true
  end

  create_table "concept_attribute", primary_key: "concept_attribute_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", null: false
    t.integer "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "concept_attribute_attribute_type_id_fk"
    t.index ["changed_by"], name: "concept_attribute_changed_by_fk"
    t.index ["concept_id"], name: "concept_attribute_concept_fk"
    t.index ["creator"], name: "concept_attribute_creator_fk"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["voided_by"], name: "concept_attribute_voided_by_fk"
  end

  create_table "concept_attribute_type", primary_key: "concept_attribute_type_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.integer "min_occurs", null: false
    t.integer "max_occurs"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "concept_attribute_type_changed_by_fk"
    t.index ["creator"], name: "concept_attribute_type_creator_fk"
    t.index ["retired_by"], name: "concept_attribute_type_retired_by_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "concept_class", primary_key: "concept_class_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.index ["changed_by"], name: "concept_class_changed_by"
    t.index ["creator"], name: "concept_class_creator"
    t.index ["name"], name: "concept_class_name_index"
    t.index ["retired"], name: "concept_class_retired_status"
    t.index ["retired_by"], name: "user_who_retired_concept_class"
    t.index ["uuid"], name: "concept_class_uuid_index", unique: true
  end

  create_table "concept_complex", primary_key: "concept_id", id: :integer, default: nil, charset: "utf8", force: :cascade do |t|
    t.string "handler"
  end

  create_table "concept_datatype", primary_key: "concept_datatype_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "hl7_abbreviation", limit: 3
    t.string "description"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["creator"], name: "concept_datatype_creator"
    t.index ["name"], name: "concept_datatype_name_index"
    t.index ["retired"], name: "concept_datatype_retired_status"
    t.index ["retired_by"], name: "user_who_retired_concept_datatype"
    t.index ["uuid"], name: "concept_datatype_uuid_index", unique: true
  end

  create_table "concept_description", primary_key: "concept_description_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", default: 0, null: false
    t.text "description", null: false
    t.string "locale", limit: 50, default: "", null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_changed_description"
    t.index ["concept_id"], name: "concept_being_described"
    t.index ["creator"], name: "user_who_created_description"
    t.index ["uuid"], name: "concept_description_uuid_index", unique: true
  end

  create_table "concept_map_type", primary_key: "concept_map_type_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "is_hidden"
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "mapped_user_changed_concept_map_type"
    t.index ["creator"], name: "mapped_user_creator_concept_map_type"
    t.index ["name"], name: "name", unique: true
    t.index ["retired_by"], name: "mapped_user_retired_concept_map_type"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "concept_name", primary_key: "concept_name_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id"
    t.string "name", default: "", null: false
    t.string "locale", limit: 50, default: "", null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.string "concept_name_type", limit: 50
    t.boolean "locale_preferred", default: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.index ["changed_by"], name: "concept_name_changed_by"
    t.index ["concept_id"], name: "unique_concept_name_id"
    t.index ["concept_name_id"], name: "concept_name_id", unique: true
    t.index ["creator"], name: "user_who_created_name"
    t.index ["name"], name: "name_of_concept"
    t.index ["uuid"], name: "concept_name_uuid_index", unique: true
    t.index ["voided_by"], name: "user_who_voided_name"
  end

  create_table "concept_name_tag", primary_key: "concept_name_tag_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "tag", limit: 50, null: false
    t.text "description"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.index ["changed_by"], name: "concept_name_tag_changed_by"
    t.index ["concept_name_tag_id"], name: "concept_name_tag_id", unique: true
    t.index ["concept_name_tag_id"], name: "concept_name_tag_id_2", unique: true
    t.index ["creator"], name: "user_who_created_name_tag"
    t.index ["tag"], name: "concept_name_tag_unique_tags", unique: true
    t.index ["uuid"], name: "concept_name_tag_uuid_index", unique: true
    t.index ["voided_by"], name: "user_who_voided_name_tag"
  end

  create_table "concept_name_tag_map", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "concept_name_id", null: false
    t.integer "concept_name_tag_id", null: false
    t.index ["concept_name_id"], name: "map_name"
    t.index ["concept_name_tag_id"], name: "map_name_tag"
  end

  create_table "concept_numeric", primary_key: "concept_id", id: :integer, default: 0, charset: "utf8", force: :cascade do |t|
    t.float "hi_absolute", limit: 53
    t.float "hi_critical", limit: 53
    t.float "hi_normal", limit: 53
    t.float "low_absolute", limit: 53
    t.float "low_critical", limit: 53
    t.float "low_normal", limit: 53
    t.string "units", limit: 50
    t.boolean "allow_decimal"
    t.integer "display_precision"
  end

  create_table "concept_proposal", primary_key: "concept_proposal_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id"
    t.integer "encounter_id"
    t.string "original_text", default: "", null: false
    t.string "final_text"
    t.integer "obs_id"
    t.integer "obs_concept_id"
    t.string "state", limit: 32, default: "UNMAPPED", null: false, comment: "Valid values are: UNMAPPED, SYNONYM, CONCEPT, REJECT"
    t.string "comments", comment: "Comment from concept admin/mapper"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "locale", limit: 50, default: "", null: false
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_changed_proposal"
    t.index ["concept_id"], name: "concept_for_proposal"
    t.index ["creator"], name: "user_who_created_proposal"
    t.index ["encounter_id"], name: "encounter_for_proposal"
    t.index ["obs_concept_id"], name: "proposal_obs_concept_id"
    t.index ["obs_id"], name: "proposal_obs_id"
    t.index ["uuid"], name: "concept_proposal_uuid_index", unique: true
  end

  create_table "concept_proposal_tag_map", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "concept_proposal_id", null: false
    t.integer "concept_name_tag_id", null: false
    t.index ["concept_name_tag_id"], name: "map_name_tag"
    t.index ["concept_proposal_id"], name: "map_proposal"
  end

  create_table "concept_reference_map", primary_key: "concept_map_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "concept_id", default: 0, null: false
    t.string "uuid", limit: 38, null: false
    t.integer "concept_reference_term_id", null: false
    t.integer "concept_map_type_id", default: 1, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.index ["changed_by"], name: "mapped_user_changed_ref_term"
    t.index ["concept_id"], name: "map_for_concept"
    t.index ["concept_map_type_id"], name: "mapped_concept_map_type"
    t.index ["concept_reference_term_id"], name: "mapped_concept_reference_term"
    t.index ["creator"], name: "map_creator"
    t.index ["uuid"], name: "concept_map_uuid_index", unique: true
    t.index ["uuid"], name: "concept_reference_map_uuid_id", unique: true
  end

  create_table "concept_reference_source", primary_key: "concept_source_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.text "description", null: false
    t.string "hl7_code", limit: 50
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "unique_id", limit: 250
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.index ["changed_by"], name: "concept_reference_source_changed_by"
    t.index ["creator"], name: "concept_source_creator"
    t.index ["hl7_code", "retired"], name: "unique_hl7_code"
    t.index ["hl7_code"], name: "concept_source_unique_hl7_codes", unique: true
    t.index ["retired_by"], name: "user_who_voided_concept_source"
    t.index ["unique_id"], name: "concept_reference_source_unique_id_unique", unique: true
    t.index ["uuid"], name: "concept_reference_source_uuid_id", unique: true
    t.index ["uuid"], name: "concept_source_uuid_index", unique: true
  end

  create_table "concept_reference_term", primary_key: "concept_reference_term_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "concept_source_id", null: false
    t.string "name"
    t.string "code", null: false
    t.string "version"
    t.string "description"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "mapped_user_changed"
    t.index ["code"], name: "idx_code_concept_reference_term"
    t.index ["concept_source_id"], name: "mapped_concept_source"
    t.index ["creator"], name: "mapped_user_creator"
    t.index ["retired_by"], name: "mapped_user_retired"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "concept_reference_term_map", primary_key: "concept_reference_term_map_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "term_a_id", null: false
    t.integer "term_b_id", null: false
    t.integer "a_is_to_b_id", null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["a_is_to_b_id"], name: "mapped_concept_map_type_ref_term_map"
    t.index ["changed_by"], name: "mapped_user_changed_ref_term_map"
    t.index ["creator"], name: "mapped_user_creator_ref_term_map"
    t.index ["term_a_id"], name: "mapped_term_a"
    t.index ["term_b_id"], name: "mapped_term_b"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "concept_set", primary_key: "concept_set_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", default: 0, null: false
    t.integer "concept_set", default: 0, null: false
    t.float "sort_weight", limit: 53
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["concept_id"], name: "idx_concept_set_concept"
    t.index ["concept_set"], name: "has_a"
    t.index ["creator"], name: "user_who_created"
    t.index ["uuid"], name: "concept_set_uuid_index", unique: true
  end

  create_table "concept_set_derived", primary_key: ["concept_id", "concept_set"], charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", default: 0, null: false
    t.integer "concept_set", default: 0, null: false
    t.float "sort_weight", limit: 53
    t.string "uuid", limit: 38
  end

  create_table "concept_state_conversion", primary_key: "concept_state_conversion_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", default: 0
    t.integer "program_workflow_id", default: 0
    t.integer "program_workflow_state_id", default: 0
    t.string "uuid", limit: 38, null: false
    t.index ["concept_id"], name: "triggering_concept"
    t.index ["program_workflow_id", "concept_id"], name: "unique_workflow_concept_in_conversion", unique: true
    t.index ["program_workflow_id"], name: "affected_workflow"
    t.index ["program_workflow_state_id"], name: "resulting_state"
    t.index ["uuid"], name: "concept_state_conversion_uuid_index", unique: true
  end

  create_table "concept_stop_word", primary_key: "concept_stop_word_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "word", limit: 50, null: false
    t.string "locale", limit: 50
    t.string "uuid", limit: 38, null: false
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["word", "locale"], name: "Unique_StopWord_Key", unique: true
  end

  create_table "concept_word", primary_key: "concept_word_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", default: 0, null: false
    t.string "word", limit: 50, default: "", null: false
    t.string "locale", limit: 20, default: "", null: false
    t.integer "concept_name_id", null: false
    t.float "weight", limit: 53, default: 1.0
    t.index ["concept_id"], name: "concept_word_concept_idx"
    t.index ["concept_name_id"], name: "word_for_name"
    t.index ["weight"], name: "concept_word_weight_index"
    t.index ["word"], name: "word_in_concept_name"
  end

  create_table "conditions", primary_key: "condition_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "additional_detail"
    t.integer "previous_version"
    t.integer "condition_coded"
    t.string "condition_non_coded"
    t.integer "condition_coded_name"
    t.string "clinical_status", limit: 50, null: false
    t.string "verification_status", limit: 50
    t.datetime "onset_date", precision: nil
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38
    t.integer "creator", null: false
    t.integer "voided_by"
    t.integer "changed_by"
    t.integer "patient_id", null: false
    t.datetime "end_date", precision: nil
    t.index ["changed_by"], name: "condition_changed_by_fk"
    t.index ["condition_coded"], name: "condition_condition_coded_fk"
    t.index ["condition_coded_name"], name: "condition_condition_coded_name_fk"
    t.index ["creator"], name: "condition_creator_fk"
    t.index ["patient_id"], name: "condition_patient_fk"
    t.index ["previous_version"], name: "condition_previous_version_fk"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["voided_by"], name: "condition_voided_by_fk"
  end

  create_table "dataintegrity_integrity_checks", primary_key: "dataintegrity_integrity_check_id", id: { type: :integer, unsigned: true }, charset: "utf8", force: :cascade do |t|
    t.string "check_name", limit: 100, null: false
    t.string "check_type", limit: 45, null: false
    t.string "check_code", limit: 1000, null: false
    t.string "check_result_type", limit: 45, null: false
    t.string "check_fail", limit: 100, null: false
    t.string "check_fail_operator", limit: 45, null: false
    t.string "check_repair_type", limit: 45
    t.string "check_repair", limit: 1000
    t.string "check_parameters", limit: 500
  end

  create_table "drug", primary_key: "drug_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", default: 0, null: false
    t.string "name"
    t.boolean "combination", default: false, null: false
    t.integer "dosage_form"
    t.float "maximum_daily_dose", limit: 53
    t.float "minimum_daily_dose", limit: 53
    t.integer "route"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.string "strength"
    t.index ["changed_by"], name: "drug_changed_by"
    t.index ["concept_id"], name: "primary_drug_concept"
    t.index ["creator"], name: "drug_creator"
    t.index ["dosage_form"], name: "dosage_form_concept"
    t.index ["retired_by"], name: "user_who_voided_drug"
    t.index ["route"], name: "route_concept"
    t.index ["uuid"], name: "drug_uuid_index", unique: true
  end

  create_table "drug_ingredient", primary_key: ["drug_id", "ingredient_id"], charset: "utf8", force: :cascade do |t|
    t.integer "drug_id", null: false
    t.integer "ingredient_id", null: false
    t.string "uuid", limit: 38, null: false
    t.float "strength", limit: 53
    t.integer "units"
    t.index ["ingredient_id"], name: "drug_ingredient_ingredient_id_fk"
    t.index ["units"], name: "drug_ingredient_units_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "drug_order", primary_key: "order_id", id: :integer, default: 0, charset: "utf8", force: :cascade do |t|
    t.integer "drug_inventory_id"
    t.float "dose", limit: 53
    t.boolean "as_needed"
    t.string "dosing_type"
    t.float "quantity", limit: 53
    t.string "as_needed_condition"
    t.integer "num_refills"
    t.text "dosing_instructions"
    t.integer "duration"
    t.integer "duration_units"
    t.integer "quantity_units"
    t.integer "route"
    t.integer "dose_units"
    t.integer "frequency"
    t.string "brand_name"
    t.boolean "dispense_as_written", default: false, null: false
    t.string "drug_non_coded"
    t.index ["dose_units"], name: "drug_order_dose_units"
    t.index ["drug_inventory_id"], name: "inventory_item"
    t.index ["duration_units"], name: "drug_order_duration_units_fk"
    t.index ["frequency"], name: "drug_order_frequency_fk"
    t.index ["quantity_units"], name: "drug_order_quantity_units"
    t.index ["route"], name: "drug_order_route_fk"
  end

  create_table "drug_reference_map", primary_key: "drug_reference_map_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "drug_id", null: false
    t.integer "term_id", null: false
    t.integer "concept_map_type", null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_changed_drug_reference_map"
    t.index ["concept_map_type"], name: "concept_map_type_for_drug_reference_map"
    t.index ["creator"], name: "drug_reference_map_creator"
    t.index ["drug_id"], name: "drug_for_drug_reference_map"
    t.index ["retired_by"], name: "user_who_retired_drug_reference_map"
    t.index ["term_id"], name: "concept_reference_term_for_drug_reference_map"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "encounter", primary_key: "encounter_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "encounter_type", null: false
    t.integer "patient_id", default: 0, null: false
    t.integer "location_id"
    t.integer "form_id"
    t.datetime "encounter_datetime", precision: nil, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.integer "visit_id"
    t.index ["changed_by"], name: "encounter_changed_by"
    t.index ["creator"], name: "encounter_creator"
    t.index ["encounter_datetime"], name: "encounter_datetime_idx"
    t.index ["encounter_type"], name: "encounter_type_id"
    t.index ["form_id"], name: "encounter_form"
    t.index ["location_id"], name: "encounter_location"
    t.index ["patient_id"], name: "encounter_patient"
    t.index ["uuid"], name: "encounter_uuid_index", unique: true
    t.index ["visit_id"], name: "encounter_visit_id_fk"
    t.index ["voided_by"], name: "user_who_voided_encounter"
  end

  create_table "encounter_diagnosis", primary_key: "diagnosis_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "diagnosis_coded"
    t.string "diagnosis_non_coded"
    t.integer "diagnosis_coded_name"
    t.integer "encounter_id", null: false
    t.integer "patient_id", null: false
    t.integer "condition_id"
    t.string "certainty", null: false
    t.integer "rank", null: false
    t.string "uuid", limit: 38, null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["changed_by"], name: "encounter_diagnosis_changed_by_fk"
    t.index ["condition_id"], name: "encounter_diagnosis_condition_id_fk"
    t.index ["creator"], name: "encounter_diagnosis_creator_fk"
    t.index ["diagnosis_coded"], name: "encounter_diagnosis_coded_fk"
    t.index ["diagnosis_coded_name"], name: "encounter_diagnosis_coded_name_fk"
    t.index ["encounter_id"], name: "encounter_diagnosis_encounter_id_fk"
    t.index ["patient_id"], name: "encounter_diagnosis_patient_fk"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["voided_by"], name: "encounter_diagnosis_voided_by_fk"
  end

  create_table "encounter_provider", primary_key: "encounter_provider_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "encounter_id", null: false
    t.integer "provider_id", null: false
    t.integer "encounter_role_id", null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.datetime "date_voided", precision: nil
    t.integer "voided_by"
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "encounter_provider_changed_by"
    t.index ["creator"], name: "encounter_provider_creator"
    t.index ["encounter_id"], name: "encounter_id_fk"
    t.index ["encounter_role_id"], name: "encounter_role_id_fk"
    t.index ["provider_id"], name: "provider_id_fk"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["voided_by"], name: "encounter_provider_voided_by"
  end

  create_table "encounter_role", primary_key: "encounter_role_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "encounter_role_changed_by_fk"
    t.index ["creator"], name: "encounter_role_creator_fk"
    t.index ["name"], name: "encounter_role_unique_name", unique: true
    t.index ["retired_by"], name: "encounter_role_retired_by_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "encounter_type", primary_key: "encounter_type_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.text "description"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "view_privilege"
    t.string "edit_privilege"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.index ["changed_by"], name: "encounter_type_changed_by"
    t.index ["creator"], name: "user_who_created_type"
    t.index ["edit_privilege"], name: "privilege_which_can_edit_encounter_type"
    t.index ["name"], name: "encounter_type_unique_name", unique: true
    t.index ["retired"], name: "retired_status"
    t.index ["retired_by"], name: "user_who_retired_encounter_type"
    t.index ["uuid"], name: "encounter_type_uuid_index", unique: true
    t.index ["view_privilege"], name: "privilege_which_can_view_encounter_type"
  end

  create_table "field", primary_key: "field_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.integer "field_type"
    t.integer "concept_id"
    t.string "table_name", limit: 50
    t.string "attribute_name", limit: 50
    t.text "default_value"
    t.boolean "select_multiple", default: false, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_changed_field"
    t.index ["concept_id"], name: "concept_for_field"
    t.index ["creator"], name: "user_who_created_field"
    t.index ["field_type"], name: "type_of_field"
    t.index ["retired"], name: "field_retired_status"
    t.index ["retired_by"], name: "user_who_retired_field"
    t.index ["uuid"], name: "field_uuid_index", unique: true
  end

  create_table "field_answer", primary_key: ["field_id", "answer_id"], charset: "utf8", force: :cascade do |t|
    t.integer "field_id", default: 0, null: false
    t.integer "answer_id", default: 0, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["answer_id"], name: "field_answer_concept"
    t.index ["creator"], name: "user_who_created_field_answer"
    t.index ["field_id"], name: "answers_for_field"
    t.index ["uuid"], name: "field_answer_uuid_index", unique: true
  end

  create_table "field_type", primary_key: "field_type_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 50
    t.text "description", size: :long
    t.boolean "is_set", default: false, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["creator"], name: "user_who_created_field_type"
    t.index ["uuid"], name: "field_type_uuid_index", unique: true
  end

  create_table "form", primary_key: "form_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "version", limit: 50, default: "", null: false
    t.integer "build"
    t.boolean "published", default: false, null: false
    t.text "description"
    t.integer "encounter_type"
    t.text "template", size: :medium
    t.text "xslt", size: :medium
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retired_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_last_changed_form"
    t.index ["creator"], name: "user_who_created_form"
    t.index ["encounter_type"], name: "encounter_type"
    t.index ["published", "retired"], name: "form_published_and_retired_index"
    t.index ["published"], name: "form_published_index"
    t.index ["retired"], name: "form_retired_index"
    t.index ["retired_by"], name: "user_who_retired_form"
    t.index ["uuid"], name: "form_uuid_index", unique: true
  end

  create_table "form_field", primary_key: "form_field_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "form_id", default: 0, null: false
    t.integer "field_id", default: 0, null: false
    t.integer "field_number"
    t.string "field_part", limit: 5
    t.integer "page_number"
    t.integer "parent_form_field"
    t.integer "min_occurs"
    t.integer "max_occurs"
    t.boolean "required", default: false, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.float "sort_weight"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_last_changed_form_field"
    t.index ["creator"], name: "user_who_created_form_field"
    t.index ["field_id"], name: "field_within_form"
    t.index ["form_id"], name: "form_containing_field"
    t.index ["parent_form_field"], name: "form_field_hierarchy"
    t.index ["uuid"], name: "form_field_uuid_index", unique: true
  end

  create_table "form_resource", primary_key: "form_resource_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "form_id", null: false
    t.string "name", null: false
    t.text "value_reference", null: false
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.index ["changed_by"], name: "form_resource_changed_by"
    t.index ["form_id", "name"], name: "unique_form_and_name", unique: true
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "formentry_archive", primary_key: "formentry_archive_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.text "form_data", size: :medium, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "creator", default: 0, null: false
    t.index ["creator"], name: "User who created formentry_archive"
  end

  create_table "formentry_error", primary_key: "formentry_error_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.text "form_data", size: :medium, null: false
    t.string "error", default: "", null: false
    t.text "error_details"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.index ["creator"], name: "User who created formentry_error"
  end

  create_table "formentry_queue", primary_key: "formentry_queue_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.text "form_data", size: :medium, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
  end

  create_table "formentry_xsn", primary_key: "formentry_xsn_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "form_id", null: false
    t.binary "xsn_data", size: :long, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "archived", default: 0, null: false
    t.integer "archived_by"
    t.datetime "date_archived", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["archived"], name: "formentry_xsn_archived_index"
    t.index ["archived_by"], name: "User who archived formentry_xsn"
    t.index ["creator"], name: "User who created formentry_xsn"
    t.index ["form_id"], name: "Form with which this xsn is related"
    t.index ["uuid"], name: "formentry_xsn_uuid_index", unique: true
  end

  create_table "global_property", primary_key: "property", id: :string, default: "", charset: "utf8", force: :cascade do |t|
    t.text "property_value", size: :medium
    t.text "description"
    t.string "uuid", limit: 38, null: false
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.index ["changed_by"], name: "global_property_changed_by"
    t.index ["property"], name: "global_property_property_index"
    t.index ["uuid"], name: "global_property_uuid_index", unique: true
  end

  create_table "hl7_in_archive", primary_key: "hl7_in_archive_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "hl7_source", default: 0, null: false
    t.string "hl7_source_key"
    t.text "hl7_data", size: :medium, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "message_state", default: 2
    t.string "uuid", limit: 38, null: false
    t.index ["message_state"], name: "hl7_in_archive_message_state_idx"
    t.index ["uuid"], name: "hl7_in_archive_uuid_index", unique: true
  end

  create_table "hl7_in_error", primary_key: "hl7_in_error_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "hl7_source", default: 0, null: false
    t.text "hl7_source_key"
    t.text "hl7_data", size: :medium, null: false
    t.string "error", default: "", null: false
    t.text "error_details", size: :medium
    t.datetime "date_created", precision: nil, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["uuid"], name: "hl7_in_error_uuid_index", unique: true
  end

  create_table "hl7_in_queue", primary_key: "hl7_in_queue_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "hl7_source", default: 0, null: false
    t.text "hl7_source_key"
    t.text "hl7_data", size: :medium, null: false
    t.integer "message_state", default: 0, null: false
    t.datetime "date_processed", precision: nil
    t.text "error_msg"
    t.datetime "date_created", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["hl7_source"], name: "hl7_source"
    t.index ["uuid"], name: "hl7_in_queue_uuid_index", unique: true
  end

  create_table "hl7_source", primary_key: "hl7_source_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", size: :tiny
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["creator"], name: "creator"
    t.index ["uuid"], name: "hl7_source_uuid_index", unique: true
  end

  create_table "htmlformentry_html_form", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "form_id"
    t.string "name"
    t.text "xml_data", size: :medium, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.string "uuid", limit: 38, null: false
    t.string "description", limit: 1000
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "User who changed htmlformentry_htmlform"
    t.index ["creator"], name: "User who created htmlformentry_htmlform"
    t.index ["form_id"], name: "Form with which this htmlform is related"
    t.index ["retired_by"], name: "user_who_retired_html_form"
    t.index ["uuid"], name: "htmlformentry_html_form_uuid_index", unique: true
  end

  create_table "liquibasechangelog", primary_key: ["ID", "AUTHOR", "FILENAME"], charset: "utf8", force: :cascade do |t|
    t.string "ID", limit: 63, null: false
    t.string "AUTHOR", limit: 63, null: false
    t.string "FILENAME", limit: 200, null: false
    t.datetime "DATEEXECUTED", precision: nil, null: false
    t.string "MD5SUM", limit: 35
    t.string "DESCRIPTION"
    t.string "COMMENTS"
    t.string "TAG"
    t.string "LIQUIBASE", limit: 20
    t.integer "ORDEREXECUTED", null: false
    t.string "EXECTYPE", limit: 10, null: false
  end

  create_table "liquibasechangeloglock", primary_key: "ID", id: :integer, default: nil, charset: "utf8", force: :cascade do |t|
    t.boolean "LOCKED", null: false
    t.datetime "LOCKGRANTED", precision: nil
    t.string "LOCKEDBY"
  end

  create_table "location", primary_key: "location_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.string "address1"
    t.string "address2"
    t.string "city_village"
    t.string "state_province"
    t.string "postal_code", limit: 50
    t.string "country", limit: 50
    t.string "latitude", limit: 50
    t.string "longitude", limit: 50
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "county_district"
    t.string "address3"
    t.string "address6"
    t.string "address5"
    t.string "address4"
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.integer "parent_location"
    t.string "uuid", limit: 38, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "address7"
    t.string "address8"
    t.string "address9"
    t.string "address10"
    t.string "address11"
    t.string "address12"
    t.string "address13"
    t.string "address14"
    t.string "address15"
    t.index ["changed_by"], name: "location_changed_by"
    t.index ["creator"], name: "user_who_created_location"
    t.index ["name"], name: "name_of_location"
    t.index ["parent_location"], name: "parent_location"
    t.index ["retired"], name: "retired_status"
    t.index ["retired_by"], name: "user_who_retired_location"
    t.index ["uuid"], name: "location_uuid_index", unique: true
  end

  create_table "location_attribute", primary_key: "location_attribute_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "location_attribute_attribute_type_id_fk"
    t.index ["changed_by"], name: "location_attribute_changed_by_fk"
    t.index ["creator"], name: "location_attribute_creator_fk"
    t.index ["location_id"], name: "location_attribute_location_fk"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["voided_by"], name: "location_attribute_voided_by_fk"
  end

  create_table "location_attribute_type", primary_key: "location_attribute_type_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.integer "min_occurs", null: false
    t.integer "max_occurs"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "location_attribute_type_changed_by_fk"
    t.index ["creator"], name: "location_attribute_type_creator_fk"
    t.index ["name"], name: "location_attribute_type_unique_name", unique: true
    t.index ["retired_by"], name: "location_attribute_type_retired_by_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "location_tag", primary_key: "location_tag_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.index ["changed_by"], name: "location_tag_changed_by"
    t.index ["creator"], name: "location_tag_creator"
    t.index ["retired_by"], name: "location_tag_retired_by"
    t.index ["uuid"], name: "location_tag_uuid_index", unique: true
  end

  create_table "location_tag_map", primary_key: ["location_id", "location_tag_id"], charset: "utf8", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "location_tag_id", null: false
    t.index ["location_tag_id"], name: "location_tag_map_tag"
  end

  create_table "logic_rule_definition", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "name", null: false
    t.string "description", limit: 1000
    t.string "rule_content", limit: 2048, null: false
    t.string "language", null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "changed_by for rule_definition"
    t.index ["creator"], name: "creator for rule_definition"
    t.index ["name"], name: "name", unique: true
    t.index ["retired_by"], name: "retired_by for rule_definition"
  end

  create_table "logic_rule_token", primary_key: "logic_rule_token_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, default: "0002-11-30 00:00:00", null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "token", limit: 512, null: false
    t.string "class_name", limit: 512, null: false
    t.string "state", limit: 512
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "token_changed_by"
    t.index ["creator"], name: "token_creator"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "logic_rule_token_tag", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "logic_rule_token_id", null: false
    t.string "tag", limit: 512, null: false
    t.index ["logic_rule_token_id"], name: "token_tag"
  end

  create_table "logic_token_registration", primary_key: "token_registration_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, default: "0002-11-30 00:00:00", null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "token", limit: 512, null: false
    t.string "provider_class_name", limit: 512, null: false
    t.string "provider_token", limit: 512, null: false
    t.string "configuration", limit: 2000
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "token_registration_changed_by"
    t.index ["creator"], name: "token_registration_creator"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "logic_token_registration_tag", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "token_registration_id", null: false
    t.string "tag", limit: 512, null: false
    t.index ["token_registration_id"], name: "token_registration_tag"
  end

  create_table "metadatasharing_exported_package", primary_key: "exported_package_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "name", limit: 64, null: false
    t.string "description", limit: 256, null: false
    t.binary "content"
  end

  create_table "metadatasharing_imported_item", primary_key: "imported_item_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "itemUuid", limit: 38, null: false
  end

  create_table "metadatasharing_imported_package", primary_key: "imported_package_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "package_uuid", limit: 38, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "name", limit: 64, null: false
    t.string "description", limit: 256, null: false
    t.datetime "date_imported", precision: nil, null: false
  end

  create_table "metadatasharing_imported_package_item", primary_key: ["imported_package_id", "imported_item_id"], charset: "utf8", force: :cascade do |t|
    t.integer "imported_package_id", default: 0, null: false
    t.integer "imported_item_id", default: 0, null: false
  end

  create_table "note", primary_key: "note_id", id: :integer, default: 0, charset: "utf8", force: :cascade do |t|
    t.string "note_type", limit: 50
    t.integer "patient_id"
    t.integer "obs_id"
    t.integer "encounter_id"
    t.text "text", null: false
    t.integer "priority"
    t.integer "parent"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_changed_note"
    t.index ["creator"], name: "user_who_created_note"
    t.index ["encounter_id"], name: "encounter_note"
    t.index ["obs_id"], name: "obs_note"
    t.index ["parent"], name: "note_hierarchy"
    t.index ["patient_id"], name: "patient_note"
    t.index ["uuid"], name: "note_uuid_index", unique: true
  end

  create_table "notification_alert", primary_key: "alert_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "text", limit: 512, null: false
    t.integer "satisfied_by_any", default: 0, null: false
    t.integer "alert_read", default: 0, null: false
    t.datetime "date_to_expire", precision: nil
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_changed_alert"
    t.index ["creator"], name: "alert_creator"
    t.index ["date_to_expire"], name: "alert_date_to_expire_idx"
    t.index ["uuid"], name: "notification_alert_uuid_index", unique: true
  end

  create_table "notification_alert_recipient", primary_key: ["alert_id", "user_id"], charset: "utf8", force: :cascade do |t|
    t.integer "alert_id", null: false
    t.integer "user_id", null: false
    t.integer "alert_read", default: 0, null: false
    t.timestamp "date_changed", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
    t.string "uuid", limit: 38, null: false
    t.index ["alert_id"], name: "id_of_alert"
    t.index ["user_id"], name: "alert_read_by_user"
  end

  create_table "notification_template", primary_key: "template_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 50
    t.text "template"
    t.string "subject", limit: 100
    t.string "sender"
    t.string "recipients", limit: 512
    t.integer "ordinal", default: 0
    t.string "uuid", limit: 38, null: false
    t.index ["uuid"], name: "notification_template_uuid_index", unique: true
  end

  create_table "obs", primary_key: "obs_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "concept_id", default: 0, null: false
    t.integer "encounter_id"
    t.integer "order_id"
    t.datetime "obs_datetime", precision: nil, null: false
    t.integer "location_id"
    t.integer "obs_group_id"
    t.string "accession_number"
    t.integer "value_group_id"
    t.integer "value_coded"
    t.integer "value_coded_name_id"
    t.integer "value_drug"
    t.datetime "value_datetime", precision: nil
    t.float "value_numeric", limit: 53
    t.string "value_modifier", limit: 2
    t.text "value_text"
    t.string "comments"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "value_complex", limit: 1000
    t.string "uuid", limit: 38, null: false
    t.integer "previous_version"
    t.string "form_namespace_and_path"
    t.string "status", limit: 16, default: "FINAL", null: false
    t.string "interpretation", limit: 32
    t.index ["concept_id"], name: "obs_concept"
    t.index ["creator"], name: "obs_enterer"
    t.index ["encounter_id"], name: "encounter_observations"
    t.index ["location_id"], name: "obs_location"
    t.index ["obs_datetime"], name: "obs_datetime_idx"
    t.index ["obs_group_id"], name: "obs_grouping_id"
    t.index ["order_id"], name: "obs_order"
    t.index ["person_id"], name: "patient_obs"
    t.index ["previous_version"], name: "previous_version"
    t.index ["uuid"], name: "obs_uuid_index", unique: true
    t.index ["value_coded"], name: "answer_concept"
    t.index ["value_coded_name_id"], name: "obs_name_of_coded_value"
    t.index ["value_drug"], name: "answer_concept_drug"
    t.index ["voided_by"], name: "user_who_voided_obs"
  end

  create_table "order_frequency", primary_key: "order_frequency_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", null: false
    t.float "frequency_per_day", limit: 53
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "order_frequency_changed_by_fk"
    t.index ["concept_id"], name: "concept_id", unique: true
    t.index ["creator"], name: "order_frequency_creator_fk"
    t.index ["retired_by"], name: "order_frequency_retired_by_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "order_group", primary_key: "order_group_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "order_set_id"
    t.integer "patient_id", null: false
    t.integer "encounter_id", null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "order_group_changed_by_fk"
    t.index ["creator"], name: "order_group_creator_fk"
    t.index ["encounter_id"], name: "order_group_encounter_id_fk"
    t.index ["order_set_id"], name: "order_group_set_id_fk"
    t.index ["patient_id"], name: "order_group_patient_id_fk"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["voided_by"], name: "order_group_voided_by_fk"
  end

  create_table "order_set", primary_key: "order_set_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "operator", limit: 50, null: false
    t.string "name", null: false
    t.string "description", limit: 1000
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "order_set_changed_by_fk"
    t.index ["creator"], name: "order_set_creator_fk"
    t.index ["retired_by"], name: "order_set_retired_by_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "order_set_member", primary_key: "order_set_member_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "order_type", null: false
    t.text "order_template"
    t.string "order_template_type", limit: 1024
    t.integer "order_set_id", null: false
    t.integer "sequence_number", null: false
    t.integer "concept_id", null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "order_set_member_changed_by_fk"
    t.index ["concept_id"], name: "order_set_member_concept_id_fk"
    t.index ["creator"], name: "order_set_member_creator_fk"
    t.index ["order_set_id"], name: "order_set_member_order_set_id_fk"
    t.index ["order_type"], name: "order_set_member_order_type_fk"
    t.index ["retired_by"], name: "order_set_member_retired_by_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "order_type", primary_key: "order_type_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "java_class_name", null: false
    t.integer "parent"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.index ["changed_by"], name: "order_type_changed_by"
    t.index ["creator"], name: "type_created_by"
    t.index ["name"], name: "name", unique: true
    t.index ["parent"], name: "order_type_parent_order_type"
    t.index ["retired"], name: "retired_status"
    t.index ["retired_by"], name: "user_who_retired_order_type"
    t.index ["uuid"], name: "order_type_uuid_index", unique: true
  end

  create_table "order_type_class_map", primary_key: ["order_type_id", "concept_class_id"], charset: "utf8", force: :cascade do |t|
    t.integer "order_type_id", null: false
    t.integer "concept_class_id", null: false
    t.index ["concept_class_id"], name: "concept_class_id", unique: true
  end

  create_table "orders", primary_key: "order_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "order_type_id", default: 0, null: false
    t.integer "concept_id", default: 0, null: false
    t.integer "orderer", null: false
    t.integer "encounter_id", null: false
    t.text "instructions"
    t.datetime "date_activated", precision: nil
    t.datetime "auto_expire_date", precision: nil
    t.datetime "date_stopped", precision: nil
    t.integer "order_reason"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.integer "patient_id", null: false
    t.string "accession_number"
    t.string "uuid", limit: 38, null: false
    t.string "order_reason_non_coded"
    t.string "urgency", limit: 50, default: "ROUTINE", null: false
    t.string "order_number", limit: 50, null: false
    t.integer "previous_order_id"
    t.string "order_action", limit: 50, null: false
    t.string "comment_to_fulfiller", limit: 1024
    t.integer "care_setting", null: false
    t.datetime "scheduled_date", precision: nil
    t.integer "order_group_id"
    t.float "sort_weight", limit: 53
    t.string "fulfiller_comment", limit: 1024
    t.string "fulfiller_status", limit: 50
    t.index ["care_setting"], name: "orders_care_setting"
    t.index ["creator"], name: "order_creator"
    t.index ["encounter_id"], name: "orders_in_encounter"
    t.index ["order_group_id"], name: "orders_order_group_id_fk"
    t.index ["order_reason"], name: "discontinued_because"
    t.index ["order_type_id"], name: "type_of_order"
    t.index ["orderer"], name: "orderer_not_drug"
    t.index ["patient_id"], name: "order_for_patient"
    t.index ["previous_order_id"], name: "previous_order_id_order_id"
    t.index ["uuid"], name: "orders_uuid_index", unique: true
    t.index ["voided_by"], name: "user_who_voided_order"
  end

  create_table "patient", primary_key: "patient_id", id: :integer, default: nil, charset: "utf8", force: :cascade do |t|
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "allergy_status", limit: 50, default: "Unknown", null: false
    t.index ["changed_by"], name: "user_who_changed_pat"
    t.index ["creator"], name: "user_who_created_patient"
    t.index ["voided_by"], name: "user_who_voided_patient"
  end

  create_table "patient_identifier", primary_key: "patient_identifier_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "patient_id", default: 0, null: false
    t.string "identifier", limit: 50, default: "", null: false
    t.integer "identifier_type", default: 0, null: false
    t.boolean "preferred", default: false, null: false
    t.integer "location_id"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.index ["changed_by"], name: "patient_identifier_changed_by"
    t.index ["creator"], name: "identifier_creator"
    t.index ["identifier"], name: "identifier_name"
    t.index ["identifier_type"], name: "defines_identifier_type"
    t.index ["location_id"], name: "identifier_location"
    t.index ["patient_id"], name: "idx_patient_identifier_patient"
    t.index ["uuid"], name: "patient_identifier_uuid_index", unique: true
    t.index ["voided_by"], name: "identifier_voider"
  end

  create_table "patient_identifier_type", primary_key: "patient_identifier_type_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.text "description"
    t.string "format"
    t.boolean "check_digit", default: false, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "required", default: false, null: false
    t.string "format_description"
    t.string "validator", limit: 200
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "location_behavior", limit: 50
    t.string "uniqueness_behavior", limit: 50
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.index ["changed_by"], name: "patient_identifier_type_changed_by"
    t.index ["creator"], name: "type_creator"
    t.index ["retired"], name: "retired_status"
    t.index ["retired_by"], name: "user_who_retired_patient_identifier_type"
    t.index ["uuid"], name: "patient_identifier_type_uuid_index", unique: true
  end

  create_table "patient_program", primary_key: "patient_program_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "patient_id", default: 0, null: false
    t.integer "program_id", default: 0, null: false
    t.datetime "date_enrolled", precision: nil
    t.datetime "date_completed", precision: nil
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.integer "location_id"
    t.integer "outcome_concept_id"
    t.index ["changed_by"], name: "user_who_changed"
    t.index ["creator"], name: "patient_program_creator"
    t.index ["location_id"], name: "patient_program_location_id"
    t.index ["outcome_concept_id"], name: "patient_program_outcome_concept_id_fk"
    t.index ["patient_id"], name: "patient_in_program"
    t.index ["program_id"], name: "program_for_patient"
    t.index ["uuid"], name: "patient_program_uuid_index", unique: true
    t.index ["voided_by"], name: "user_who_voided_patient_program"
  end

  create_table "patient_program_attribute", primary_key: "patient_program_attribute_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "patient_program_id", null: false
    t.integer "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "patient_program_attribute_attributetype_fk"
    t.index ["changed_by"], name: "patient_program_attribute_changed_by_fk"
    t.index ["creator"], name: "patient_program_attribute_creator_fk"
    t.index ["patient_program_id"], name: "patient_program_attribute_programid_fk"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["voided_by"], name: "patient_program_attribute_voided_by_fk"
  end

  create_table "patient_state", primary_key: "patient_state_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "patient_program_id", default: 0, null: false
    t.integer "state", default: 0, null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "patient_state_changer"
    t.index ["creator"], name: "patient_state_creator"
    t.index ["patient_program_id"], name: "patient_program_for_state"
    t.index ["state"], name: "state_for_patient"
    t.index ["uuid"], name: "patient_state_uuid_index", unique: true
    t.index ["voided_by"], name: "patient_state_voider"
  end

  create_table "person", primary_key: "person_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "gender", limit: 50, default: ""
    t.date "birthdate"
    t.boolean "birthdate_estimated", default: false, null: false
    t.boolean "dead", default: false, null: false
    t.datetime "death_date", precision: nil
    t.integer "cause_of_death"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.boolean "deathdate_estimated", default: false, null: false
    t.time "birthtime"
    t.string "cause_of_death_non_coded"
    t.index ["birthdate"], name: "person_birthdate"
    t.index ["cause_of_death"], name: "person_died_because"
    t.index ["changed_by"], name: "user_who_changed_pat"
    t.index ["creator"], name: "user_who_created_patient"
    t.index ["death_date"], name: "person_death_date"
    t.index ["uuid"], name: "person_uuid_index", unique: true
    t.index ["voided_by"], name: "user_who_voided_patient"
  end

  create_table "person_address", primary_key: "person_address_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "person_id"
    t.boolean "preferred", default: false, null: false
    t.string "address1"
    t.string "address2"
    t.string "city_village"
    t.string "state_province"
    t.string "postal_code", limit: 50
    t.string "country", limit: 50
    t.string "latitude", limit: 50
    t.string "longitude", limit: 50
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "county_district"
    t.string "address3"
    t.string "address6"
    t.string "address5"
    t.string "address4"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.string "address7"
    t.string "address8"
    t.string "address9"
    t.string "address10"
    t.string "address11"
    t.string "address12"
    t.string "address13"
    t.string "address14"
    t.string "address15"
    t.index ["changed_by"], name: "person_address_changed_by"
    t.index ["creator"], name: "patient_address_creator"
    t.index ["person_id"], name: "patient_addresses"
    t.index ["uuid"], name: "person_address_uuid_index", unique: true
    t.index ["voided_by"], name: "patient_address_void"
  end

  create_table "person_attribute", primary_key: "person_attribute_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "person_id", default: 0, null: false
    t.string "value", limit: 50, default: "", null: false
    t.integer "person_attribute_type_id", default: 0, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "attribute_changer"
    t.index ["creator"], name: "attribute_creator"
    t.index ["person_attribute_type_id"], name: "defines_attribute_type"
    t.index ["person_id"], name: "identifies_person"
    t.index ["uuid"], name: "person_attribute_uuid_index", unique: true
    t.index ["voided_by"], name: "attribute_voider"
  end

  create_table "person_attribute_type", primary_key: "person_attribute_type_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.text "description"
    t.string "format", limit: 50
    t.integer "foreign_key"
    t.boolean "searchable", default: false, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "edit_privilege"
    t.string "uuid", limit: 38, null: false
    t.float "sort_weight", limit: 53
    t.index ["changed_by"], name: "attribute_type_changer"
    t.index ["creator"], name: "type_creator"
    t.index ["edit_privilege"], name: "privilege_which_can_edit"
    t.index ["name"], name: "name_of_attribute"
    t.index ["retired"], name: "person_attribute_type_retired_status"
    t.index ["retired_by"], name: "user_who_retired_person_attribute_type"
    t.index ["searchable"], name: "attribute_is_searchable"
    t.index ["uuid"], name: "person_attribute_type_uuid_index", unique: true
  end

  create_table "person_merge_log", primary_key: "person_merge_log_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "winner_person_id", null: false
    t.integer "loser_person_id", null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.text "merged_data", size: :long, null: false
    t.string "uuid", limit: 38, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["changed_by"], name: "person_merge_log_changed_by_fk"
    t.index ["creator"], name: "person_merge_log_creator"
    t.index ["loser_person_id"], name: "person_merge_log_loser"
    t.index ["uuid"], name: "person_merge_log_unique_uuid", unique: true
    t.index ["voided_by"], name: "person_merge_log_voided_by_fk"
    t.index ["winner_person_id"], name: "person_merge_log_winner"
  end

  create_table "person_name", primary_key: "person_name_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.boolean "preferred", default: false, null: false
    t.integer "person_id", null: false
    t.string "prefix", limit: 50
    t.string "given_name", limit: 50
    t.string "middle_name", limit: 50
    t.string "family_name_prefix", limit: 50
    t.string "family_name", limit: 50
    t.string "family_name2", limit: 50
    t.string "family_name_suffix", limit: 50
    t.string "degree", limit: 50
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["creator"], name: "user_who_made_name"
    t.index ["family_name"], name: "last_name"
    t.index ["family_name2"], name: "family_name2"
    t.index ["given_name"], name: "first_name"
    t.index ["middle_name"], name: "middle_name"
    t.index ["person_id"], name: "name_for_patient"
    t.index ["uuid"], name: "person_name_uuid_index", unique: true
    t.index ["voided_by"], name: "user_who_voided_name"
  end

  create_table "privilege", primary_key: "privilege", id: :string, charset: "utf8", force: :cascade do |t|
    t.text "description"
    t.string "uuid", limit: 38, null: false
    t.index ["uuid"], name: "privilege_uuid_index", unique: true
  end

  create_table "program", primary_key: "program_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "concept_id", default: 0, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.string "name", limit: 50, null: false
    t.text "description"
    t.string "uuid", limit: 38, null: false
    t.integer "outcomes_concept_id"
    t.index ["changed_by"], name: "user_who_changed_program"
    t.index ["concept_id"], name: "program_concept"
    t.index ["creator"], name: "program_creator"
    t.index ["outcomes_concept_id"], name: "program_outcomes_concept_id_fk"
    t.index ["uuid"], name: "program_uuid_index", unique: true
  end

  create_table "program_attribute_type", primary_key: "program_attribute_type_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.integer "min_occurs", null: false
    t.integer "max_occurs"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "program_attribute_type_changed_by_fk"
    t.index ["creator"], name: "program_attribute_type_creator_fk"
    t.index ["name"], name: "name", unique: true
    t.index ["retired_by"], name: "program_attribute_type_retired_by_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "program_workflow", primary_key: "program_workflow_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "program_id", default: 0, null: false
    t.integer "concept_id", default: 0, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "workflow_voided_by"
    t.index ["concept_id"], name: "workflow_concept"
    t.index ["creator"], name: "workflow_creator"
    t.index ["program_id"], name: "program_for_workflow"
    t.index ["uuid"], name: "program_workflow_uuid_index", unique: true
  end

  create_table "program_workflow_state", primary_key: "program_workflow_state_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "program_workflow_id", default: 0, null: false
    t.integer "concept_id", default: 0, null: false
    t.boolean "initial", default: false, null: false
    t.boolean "terminal", default: false, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "state_voided_by"
    t.index ["concept_id"], name: "state_concept"
    t.index ["creator"], name: "state_creator"
    t.index ["program_workflow_id"], name: "workflow_for_state"
    t.index ["uuid"], name: "program_workflow_state_uuid_index", unique: true
  end

  create_table "provider", primary_key: "provider_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "person_id"
    t.string "name"
    t.string "identifier"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.integer "role_id"
    t.integer "speciality_id"
    t.index ["changed_by"], name: "provider_changed_by_fk"
    t.index ["creator"], name: "provider_creator_fk"
    t.index ["person_id"], name: "provider_person_id_fk"
    t.index ["retired_by"], name: "provider_retired_by_fk"
    t.index ["role_id"], name: "provider_role_id_fk"
    t.index ["speciality_id"], name: "provider_speciality_id_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "provider_attribute", primary_key: "provider_attribute_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "provider_id", null: false
    t.integer "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "provider_attribute_attribute_type_id_fk"
    t.index ["changed_by"], name: "provider_attribute_changed_by_fk"
    t.index ["creator"], name: "provider_attribute_creator_fk"
    t.index ["provider_id"], name: "provider_attribute_provider_fk"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["voided_by"], name: "provider_attribute_voided_by_fk"
  end

  create_table "provider_attribute_type", primary_key: "provider_attribute_type_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.integer "min_occurs", null: false
    t.integer "max_occurs"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "provider_attribute_type_changed_by_fk"
    t.index ["creator"], name: "provider_attribute_type_creator_fk"
    t.index ["retired_by"], name: "provider_attribute_type_retired_by_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "relationship", primary_key: "relationship_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "person_a", null: false
    t.integer "relationship", default: 0, null: false
    t.integer "person_b", null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.index ["changed_by"], name: "relationship_changed_by"
    t.index ["creator"], name: "relation_creator"
    t.index ["person_a"], name: "related_person"
    t.index ["person_b"], name: "related_relative"
    t.index ["relationship"], name: "relationship_type"
    t.index ["uuid"], name: "relationship_uuid_index", unique: true
    t.index ["voided_by"], name: "relation_voider"
  end

  create_table "relationship_type", primary_key: "relationship_type_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "a_is_to_b", limit: 50, null: false
    t.string "b_is_to_a", limit: 50, null: false
    t.integer "preferred", default: 0, null: false
    t.integer "weight", default: 0, null: false
    t.string "description"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "uuid", limit: 38, null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.index ["changed_by"], name: "relationship_type_changed_by"
    t.index ["creator"], name: "user_who_created_rel"
    t.index ["retired_by"], name: "user_who_retired_relationship_type"
    t.index ["uuid"], name: "relationship_type_uuid_index", unique: true
  end

  create_table "report_object", primary_key: "report_object_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1000
    t.string "report_object_type", null: false
    t.string "report_object_sub_type", null: false
    t.text "xml_data"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "user_who_changed_report_object"
    t.index ["creator"], name: "report_object_creator"
    t.index ["uuid"], name: "report_object_uuid_index", unique: true
    t.index ["voided_by"], name: "user_who_voided_report_object"
  end

  create_table "report_schema_xml", primary_key: "report_schema_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.text "xml_data", size: :medium, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["uuid"], name: "report_schema_xml_uuid_index", unique: true
  end

  create_table "reporting_report_design", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "name", null: false
    t.string "description", limit: 1000
    t.integer "report_definition_id", default: 0, null: false
    t.string "renderer_type", null: false
    t.text "properties"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "changed_by for reporting_report_design"
    t.index ["creator"], name: "creator for reporting_report_design"
    t.index ["report_definition_id"], name: "report_definition_id for reporting_report_design"
    t.index ["retired_by"], name: "retired_by for reporting_report_design"
  end

  create_table "reporting_report_design_resource", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "name", null: false
    t.string "description", limit: 1000
    t.integer "report_design_id", default: 0, null: false
    t.string "content_type", limit: 50
    t.string "extension", limit: 20
    t.binary "contents", size: :long
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "changed_by for reporting_report_design_resource"
    t.index ["creator"], name: "creator for reporting_report_design_resource"
    t.index ["report_design_id"], name: "report_design_id for reporting_report_design_resource"
    t.index ["retired_by"], name: "retired_by for reporting_report_design_resource"
  end

  create_table "reporting_report_request", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "base_cohort_uuid", limit: 38
    t.text "base_cohort_parameters"
    t.string "report_definition_uuid", limit: 38, null: false
    t.text "report_definition_parameters"
    t.string "renderer_type", null: false
    t.string "renderer_argument"
    t.integer "requested_by", default: 0, null: false
    t.datetime "request_datetime", precision: nil, null: false
    t.string "priority", null: false
    t.string "status", null: false
    t.datetime "evaluation_start_datetime", precision: nil
    t.datetime "evaluation_complete_datetime", precision: nil
    t.datetime "render_complete_datetime", precision: nil
    t.string "description", limit: 1000
    t.index ["requested_by"], name: "requested_by for reporting_report_request"
  end

  create_table "role", primary_key: "role", id: { type: :string, limit: 50, default: "" }, charset: "utf8", force: :cascade do |t|
    t.string "description"
    t.string "uuid", limit: 38, null: false
    t.index ["uuid"], name: "role_uuid_index", unique: true
  end

  create_table "role_privilege", primary_key: ["privilege", "role"], charset: "utf8", force: :cascade do |t|
    t.string "role", limit: 50, default: "", null: false
    t.string "privilege", null: false
    t.index ["role"], name: "role_privilege"
  end

  create_table "role_role", primary_key: ["parent_role", "child_role"], charset: "utf8", force: :cascade do |t|
    t.string "parent_role", limit: 50, default: "", null: false
    t.string "child_role", default: "", null: false
    t.index ["child_role"], name: "inherited_role"
  end

  create_table "room_temperature", primary_key: "room_temperature_id", id: :integer, charset: "utf8", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.datetime "time", precision: nil, null: false
    t.integer "temp", null: false
    t.string "uuid", limit: 38, null: false
  end

  create_table "scheduler_task_config", primary_key: "task_config_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.text "schedulable_class"
    t.datetime "start_time", precision: nil
    t.string "start_time_pattern", limit: 50
    t.integer "repeat_interval", default: 0, null: false
    t.integer "start_on_startup", default: 0, null: false
    t.integer "started", default: 0, null: false
    t.integer "created_by", default: 0
    t.datetime "date_created", precision: nil, default: "2005-01-01 00:00:00"
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.datetime "last_execution_time", precision: nil
    t.index ["changed_by"], name: "schedule_changer"
    t.index ["created_by"], name: "schedule_creator"
    t.index ["uuid"], name: "scheduler_task_config_uuid_index", unique: true
  end

  create_table "scheduler_task_config_property", primary_key: "task_config_property_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "value"
    t.integer "task_config_id"
    t.index ["task_config_id"], name: "task_config"
  end

  create_table "serialized_object", primary_key: "serialized_object_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 5000
    t.string "type", null: false
    t.string "subtype", null: false
    t.string "serialization_class", null: false
    t.text "serialized_data", size: :medium, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "creator", null: false
    t.datetime "date_changed", precision: nil
    t.integer "changed_by"
    t.boolean "retired", default: false, null: false
    t.datetime "date_retired", precision: nil
    t.integer "retired_by"
    t.string "retire_reason", limit: 1000
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "serialized_object_changed_by"
    t.index ["creator"], name: "serialized_object_creator"
    t.index ["retired_by"], name: "serialized_object_retired_by"
    t.index ["uuid"], name: "serialized_object_uuid_index", unique: true
  end

  create_table "test_order", primary_key: "order_id", id: :integer, default: 0, charset: "latin1", force: :cascade do |t|
    t.integer "specimen_source"
    t.string "laterality", limit: 20
    t.text "clinical_history"
    t.integer "frequency"
    t.integer "number_of_repeats"
    t.index ["frequency"], name: "test_order_frequency_fk"
    t.index ["specimen_source"], name: "test_order_specimen_source_fk"
  end

  create_table "tribe", primary_key: "tribe_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.boolean "retired", default: false, null: false
    t.string "name", limit: 50, default: "", null: false
  end

  create_table "user_property", primary_key: ["user_id", "property"], charset: "utf8", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false
    t.string "property", limit: 100, default: "", null: false
    t.string "property_value", default: "", null: false
  end

  create_table "user_role", primary_key: ["role", "user_id"], charset: "utf8", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false
    t.string "role", limit: 50, default: "", null: false
    t.index ["user_id"], name: "user_role"
  end

  create_table "users", primary_key: "user_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "system_id", limit: 50, default: "", null: false
    t.string "username", limit: 50
    t.string "password", limit: 128
    t.string "salt", limit: 128
    t.string "secret_question"
    t.string "secret_answer"
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.integer "person_id", null: false
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "activation_key"
    t.string "email"
    t.index ["changed_by"], name: "user_who_changed_user"
    t.index ["creator"], name: "user_creator"
    t.index ["email"], name: "email", unique: true
    t.index ["person_id"], name: "person_id_for_user"
    t.index ["retired_by"], name: "user_who_retired_this_user"
  end

  create_table "visit", primary_key: "visit_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "visit_type_id", null: false
    t.datetime "date_started", precision: nil, null: false
    t.datetime "date_stopped", precision: nil
    t.integer "indication_concept_id"
    t.integer "location_id"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "visit_changed_by_fk"
    t.index ["creator"], name: "visit_creator_fk"
    t.index ["indication_concept_id"], name: "visit_indication_concept_fk"
    t.index ["location_id"], name: "visit_location_fk"
    t.index ["patient_id"], name: "visit_patient_index"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["visit_type_id"], name: "visit_type_fk"
    t.index ["voided_by"], name: "visit_voided_by_fk"
  end

  create_table "visit_attribute", primary_key: "visit_attribute_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "visit_id", null: false
    t.integer "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "visit_attribute_attribute_type_id_fk"
    t.index ["changed_by"], name: "visit_attribute_changed_by_fk"
    t.index ["creator"], name: "visit_attribute_creator_fk"
    t.index ["uuid"], name: "uuid", unique: true
    t.index ["visit_id"], name: "visit_attribute_visit_fk"
    t.index ["voided_by"], name: "visit_attribute_voided_by_fk"
  end

  create_table "visit_attribute_type", primary_key: "visit_attribute_type_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.integer "min_occurs", null: false
    t.integer "max_occurs"
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "visit_attribute_type_changed_by_fk"
    t.index ["creator"], name: "visit_attribute_type_creator_fk"
    t.index ["retired_by"], name: "visit_attribute_type_retired_by_fk"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "visit_type", primary_key: "visit_type_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "uuid", limit: 38, null: false
    t.integer "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.integer "retired", limit: 1, default: 0, null: false
    t.integer "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "visit_type_changed_by"
    t.index ["creator"], name: "visit_type_creator"
    t.index ["retired_by"], name: "visit_type_retired_by"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "xforms_medical_history_field", primary_key: "field_id", id: :integer, default: nil, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "tabIndex"
  end

  create_table "xforms_person_repeat_attribute", primary_key: "person_repeat_attribute_id", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "person_id", default: 0, null: false
    t.string "value", limit: 50, default: "", null: false
    t.integer "person_attribute_type_id", default: 0, null: false
    t.integer "value_id", default: 0, null: false
    t.integer "value_id_type", default: 0, null: false
    t.integer "value_display_order", default: 0, null: false
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.integer "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["changed_by"], name: "repeat_attribute_changer"
    t.index ["creator"], name: "repeat_attribute_creator"
    t.index ["person_attribute_type_id"], name: "repeat_defines_attribute_type"
    t.index ["person_id"], name: "repeat_identifies_person"
    t.index ["voided_by"], name: "repeat_attribute_voider"
  end

  create_table "xforms_xform", primary_key: "form_id", id: :integer, default: nil, charset: "utf8", force: :cascade do |t|
    t.text "xform_xml", size: :long
    t.text "layout_xml", size: :long
    t.integer "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.integer "changed_by"
    t.datetime "date_changed", precision: nil
    t.text "locale_xml", size: :long
    t.text "javascript_src", size: :long
    t.index ["changed_by"], name: "user_who_last_changed_xform"
    t.index ["creator"], name: "user_who_created_xform"
    t.index ["form_id"], name: "form_with_which_xform_is_related"
  end

  add_foreign_key "allergy", "concept", column: "coded_allergen", primary_key: "concept_id", name: "allergy_coded_allergen_fk"
  add_foreign_key "allergy", "concept", column: "severity_concept_id", primary_key: "concept_id", name: "allergy_severity_concept_id_fk"
  add_foreign_key "allergy", "patient", primary_key: "patient_id", name: "allergy_patient_id_fk"
  add_foreign_key "allergy", "users", column: "changed_by", primary_key: "user_id", name: "allergy_changed_by_fk"
  add_foreign_key "allergy", "users", column: "creator", primary_key: "user_id", name: "allergy_creator_fk"
  add_foreign_key "allergy", "users", column: "voided_by", primary_key: "user_id", name: "allergy_voided_by_fk"
  add_foreign_key "allergy_reaction", "allergy", primary_key: "allergy_id", name: "allergy_reaction_allergy_id_fk"
  add_foreign_key "allergy_reaction", "concept", column: "reaction_concept_id", primary_key: "concept_id", name: "allergy_reaction_reaction_concept_id_fk"
  add_foreign_key "care_setting", "users", column: "changed_by", primary_key: "user_id", name: "care_setting_changed_by"
  add_foreign_key "care_setting", "users", column: "creator", primary_key: "user_id", name: "care_setting_creator"
  add_foreign_key "care_setting", "users", column: "retired_by", primary_key: "user_id", name: "care_setting_retired_by"
  add_foreign_key "cohort", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_cohort"
  add_foreign_key "cohort", "users", column: "creator", primary_key: "user_id", name: "cohort_creator"
  add_foreign_key "cohort", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_cohort"
  add_foreign_key "cohort_member", "cohort", primary_key: "cohort_id", name: "parent_cohort"
  add_foreign_key "cohort_member", "patient", primary_key: "patient_id", name: "member_patient"
  add_foreign_key "cohort_member", "users", column: "creator", primary_key: "user_id", name: "cohort_member_creator"
  add_foreign_key "concept", "concept_class", column: "class_id", primary_key: "concept_class_id", name: "concept_classes"
  add_foreign_key "concept", "concept_datatype", column: "datatype_id", primary_key: "concept_datatype_id", name: "concept_datatypes"
  add_foreign_key "concept", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_concept"
  add_foreign_key "concept", "users", column: "creator", primary_key: "user_id", name: "concept_creator"
  add_foreign_key "concept", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_concept"
  add_foreign_key "concept_answer", "concept", column: "answer_concept", primary_key: "concept_id", name: "answer"
  add_foreign_key "concept_answer", "concept", primary_key: "concept_id", name: "answers_for_concept"
  add_foreign_key "concept_answer", "drug", column: "answer_drug", primary_key: "drug_id", name: "answer_answer_drug_fk"
  add_foreign_key "concept_answer", "users", column: "creator", primary_key: "user_id", name: "answer_creator"
  add_foreign_key "concept_attribute", "concept", primary_key: "concept_id", name: "concept_attribute_concept_fk"
  add_foreign_key "concept_attribute", "concept_attribute_type", column: "attribute_type_id", primary_key: "concept_attribute_type_id", name: "concept_attribute_attribute_type_id_fk"
  add_foreign_key "concept_attribute", "users", column: "changed_by", primary_key: "user_id", name: "concept_attribute_changed_by_fk"
  add_foreign_key "concept_attribute", "users", column: "creator", primary_key: "user_id", name: "concept_attribute_creator_fk"
  add_foreign_key "concept_attribute", "users", column: "voided_by", primary_key: "user_id", name: "concept_attribute_voided_by_fk"
  add_foreign_key "concept_attribute_type", "users", column: "changed_by", primary_key: "user_id", name: "concept_attribute_type_changed_by_fk"
  add_foreign_key "concept_attribute_type", "users", column: "creator", primary_key: "user_id", name: "concept_attribute_type_creator_fk"
  add_foreign_key "concept_attribute_type", "users", column: "retired_by", primary_key: "user_id", name: "concept_attribute_type_retired_by_fk"
  add_foreign_key "concept_class", "users", column: "changed_by", primary_key: "user_id", name: "concept_class_changed_by"
  add_foreign_key "concept_class", "users", column: "creator", primary_key: "user_id", name: "concept_class_creator"
  add_foreign_key "concept_class", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_concept_class"
  add_foreign_key "concept_complex", "concept", primary_key: "concept_id", name: "concept_attributes"
  add_foreign_key "concept_datatype", "users", column: "creator", primary_key: "user_id", name: "concept_datatype_creator"
  add_foreign_key "concept_datatype", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_concept_datatype"
  add_foreign_key "concept_description", "concept", primary_key: "concept_id", name: "description_for_concept"
  add_foreign_key "concept_description", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_description"
  add_foreign_key "concept_description", "users", column: "creator", primary_key: "user_id", name: "user_who_created_description"
  add_foreign_key "concept_map_type", "users", column: "changed_by", primary_key: "user_id", name: "mapped_user_changed_concept_map_type"
  add_foreign_key "concept_map_type", "users", column: "creator", primary_key: "user_id", name: "mapped_user_creator_concept_map_type"
  add_foreign_key "concept_map_type", "users", column: "retired_by", primary_key: "user_id", name: "mapped_user_retired_concept_map_type"
  add_foreign_key "concept_name", "concept", primary_key: "concept_id", name: "name_for_concept"
  add_foreign_key "concept_name", "users", column: "changed_by", primary_key: "user_id", name: "concept_name_changed_by"
  add_foreign_key "concept_name", "users", column: "creator", primary_key: "user_id", name: "user_who_created_name"
  add_foreign_key "concept_name", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_this_name"
  add_foreign_key "concept_name_tag", "users", column: "changed_by", primary_key: "user_id", name: "concept_name_tag_changed_by"
  add_foreign_key "concept_name_tag_map", "concept_name", primary_key: "concept_name_id", name: "mapped_concept_name"
  add_foreign_key "concept_name_tag_map", "concept_name_tag", primary_key: "concept_name_tag_id", name: "mapped_concept_name_tag"
  add_foreign_key "concept_numeric", "concept", primary_key: "concept_id", name: "numeric_attributes"
  add_foreign_key "concept_proposal", "concept", column: "obs_concept_id", primary_key: "concept_id", name: "proposal_obs_concept_id"
  add_foreign_key "concept_proposal", "concept", primary_key: "concept_id", name: "concept_for_proposal"
  add_foreign_key "concept_proposal", "encounter", primary_key: "encounter_id", name: "encounter_for_proposal"
  add_foreign_key "concept_proposal", "obs", column: "obs_id", primary_key: "obs_id", name: "proposal_obs_id"
  add_foreign_key "concept_proposal", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_proposal"
  add_foreign_key "concept_proposal", "users", column: "creator", primary_key: "user_id", name: "user_who_created_proposal"
  add_foreign_key "concept_proposal_tag_map", "concept_name_tag", primary_key: "concept_name_tag_id", name: "mapped_concept_proposal_tag"
  add_foreign_key "concept_proposal_tag_map", "concept_proposal", primary_key: "concept_proposal_id", name: "mapped_concept_proposal"
  add_foreign_key "concept_reference_map", "concept", primary_key: "concept_id", name: "map_for_concept"
  add_foreign_key "concept_reference_map", "concept_map_type", primary_key: "concept_map_type_id", name: "mapped_concept_map_type"
  add_foreign_key "concept_reference_map", "concept_reference_term", primary_key: "concept_reference_term_id", name: "mapped_concept_reference_term"
  add_foreign_key "concept_reference_map", "users", column: "changed_by", primary_key: "user_id", name: "mapped_user_changed_ref_term"
  add_foreign_key "concept_reference_map", "users", column: "creator", primary_key: "user_id", name: "map_creator"
  add_foreign_key "concept_reference_source", "users", column: "changed_by", primary_key: "user_id", name: "concept_reference_source_changed_by"
  add_foreign_key "concept_reference_source", "users", column: "creator", primary_key: "user_id", name: "concept_source_creator"
  add_foreign_key "concept_reference_source", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_concept_source"
  add_foreign_key "concept_reference_term", "concept_reference_source", column: "concept_source_id", primary_key: "concept_source_id", name: "mapped_concept_source"
  add_foreign_key "concept_reference_term", "users", column: "changed_by", primary_key: "user_id", name: "mapped_user_changed"
  add_foreign_key "concept_reference_term", "users", column: "creator", primary_key: "user_id", name: "mapped_user_creator"
  add_foreign_key "concept_reference_term", "users", column: "retired_by", primary_key: "user_id", name: "mapped_user_retired"
  add_foreign_key "concept_reference_term_map", "concept_map_type", column: "a_is_to_b_id", primary_key: "concept_map_type_id", name: "mapped_concept_map_type_ref_term_map"
  add_foreign_key "concept_reference_term_map", "concept_reference_term", column: "term_a_id", primary_key: "concept_reference_term_id", name: "mapped_term_a"
  add_foreign_key "concept_reference_term_map", "concept_reference_term", column: "term_b_id", primary_key: "concept_reference_term_id", name: "mapped_term_b"
  add_foreign_key "concept_reference_term_map", "users", column: "changed_by", primary_key: "user_id", name: "mapped_user_changed_ref_term_map"
  add_foreign_key "concept_reference_term_map", "users", column: "creator", primary_key: "user_id", name: "mapped_user_creator_ref_term_map"
  add_foreign_key "concept_set", "concept", column: "concept_set", primary_key: "concept_id", name: "has_a"
  add_foreign_key "concept_set", "concept", primary_key: "concept_id", name: "is_a"
  add_foreign_key "concept_set", "users", column: "creator", primary_key: "user_id", name: "user_who_created"
  add_foreign_key "concept_state_conversion", "concept", primary_key: "concept_id", name: "concept_triggers_conversion"
  add_foreign_key "concept_state_conversion", "program_workflow", primary_key: "program_workflow_id", name: "conversion_involves_workflow"
  add_foreign_key "concept_state_conversion", "program_workflow_state", primary_key: "program_workflow_state_id", name: "conversion_to_state"
  add_foreign_key "concept_word", "concept", primary_key: "concept_id", name: "word_for"
  add_foreign_key "concept_word", "concept_name", primary_key: "concept_name_id", name: "word_for_name"
  add_foreign_key "conditions", "concept", column: "condition_coded", primary_key: "concept_id", name: "condition_condition_coded_fk"
  add_foreign_key "conditions", "concept_name", column: "condition_coded_name", primary_key: "concept_name_id", name: "condition_condition_coded_name_fk"
  add_foreign_key "conditions", "conditions", column: "previous_version", primary_key: "condition_id", name: "condition_previous_version_fk"
  add_foreign_key "conditions", "patient", primary_key: "patient_id", name: "condition_patient_fk"
  add_foreign_key "conditions", "users", column: "changed_by", primary_key: "user_id", name: "condition_changed_by_fk"
  add_foreign_key "conditions", "users", column: "creator", primary_key: "user_id", name: "condition_creator_fk"
  add_foreign_key "conditions", "users", column: "voided_by", primary_key: "user_id", name: "condition_voided_by_fk"
  add_foreign_key "drug", "concept", column: "dosage_form", primary_key: "concept_id", name: "dosage_form_concept"
  add_foreign_key "drug", "concept", column: "route", primary_key: "concept_id", name: "route_concept"
  add_foreign_key "drug", "concept", primary_key: "concept_id", name: "primary_drug_concept"
  add_foreign_key "drug", "users", column: "changed_by", primary_key: "user_id", name: "drug_changed_by"
  add_foreign_key "drug", "users", column: "creator", primary_key: "user_id", name: "drug_creator"
  add_foreign_key "drug", "users", column: "retired_by", primary_key: "user_id", name: "drug_retired_by"
  add_foreign_key "drug_ingredient", "concept", column: "ingredient_id", primary_key: "concept_id", name: "drug_ingredient_ingredient_id_fk"
  add_foreign_key "drug_ingredient", "concept", column: "units", primary_key: "concept_id", name: "drug_ingredient_units_fk"
  add_foreign_key "drug_ingredient", "drug", primary_key: "drug_id", name: "drug_ingredient_drug_id_fk"
  add_foreign_key "drug_order", "concept", column: "dose_units", primary_key: "concept_id", name: "drug_order_dose_units"
  add_foreign_key "drug_order", "concept", column: "duration_units", primary_key: "concept_id", name: "drug_order_duration_units_fk"
  add_foreign_key "drug_order", "concept", column: "quantity_units", primary_key: "concept_id", name: "drug_order_quantity_units"
  add_foreign_key "drug_order", "concept", column: "route", primary_key: "concept_id", name: "drug_order_route_fk"
  add_foreign_key "drug_order", "drug", column: "drug_inventory_id", primary_key: "drug_id", name: "inventory_item"
  add_foreign_key "drug_order", "order_frequency", column: "frequency", primary_key: "order_frequency_id", name: "drug_order_frequency_fk"
  add_foreign_key "drug_order", "orders", primary_key: "order_id", name: "extends_order"
  add_foreign_key "drug_reference_map", "concept_map_type", column: "concept_map_type", primary_key: "concept_map_type_id", name: "concept_map_type_for_drug_reference_map"
  add_foreign_key "drug_reference_map", "concept_reference_term", column: "term_id", primary_key: "concept_reference_term_id", name: "concept_reference_term_for_drug_reference_map"
  add_foreign_key "drug_reference_map", "drug", primary_key: "drug_id", name: "drug_for_drug_reference_map"
  add_foreign_key "drug_reference_map", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_drug_reference_map"
  add_foreign_key "drug_reference_map", "users", column: "creator", primary_key: "user_id", name: "drug_reference_map_creator"
  add_foreign_key "drug_reference_map", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_drug_reference_map"
  add_foreign_key "encounter", "encounter_type", column: "encounter_type", primary_key: "encounter_type_id", name: "encounter_type_id"
  add_foreign_key "encounter", "form", primary_key: "form_id", name: "encounter_form"
  add_foreign_key "encounter", "location", primary_key: "location_id", name: "encounter_location"
  add_foreign_key "encounter", "patient", primary_key: "patient_id", name: "encounter_patient", on_update: :cascade
  add_foreign_key "encounter", "users", column: "changed_by", primary_key: "user_id", name: "encounter_changed_by"
  add_foreign_key "encounter", "users", column: "creator", primary_key: "user_id", name: "encounter_ibfk_1"
  add_foreign_key "encounter", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_encounter"
  add_foreign_key "encounter", "visit", primary_key: "visit_id", name: "encounter_visit_id_fk"
  add_foreign_key "encounter_diagnosis", "concept", column: "diagnosis_coded", primary_key: "concept_id", name: "encounter_diagnosis_coded_fk"
  add_foreign_key "encounter_diagnosis", "concept_name", column: "diagnosis_coded_name", primary_key: "concept_name_id", name: "encounter_diagnosis_coded_name_fk"
  add_foreign_key "encounter_diagnosis", "conditions", primary_key: "condition_id", name: "encounter_diagnosis_condition_id_fk"
  add_foreign_key "encounter_diagnosis", "encounter", primary_key: "encounter_id", name: "encounter_diagnosis_encounter_id_fk"
  add_foreign_key "encounter_diagnosis", "patient", primary_key: "patient_id", name: "encounter_diagnosis_patient_fk"
  add_foreign_key "encounter_diagnosis", "patient", primary_key: "patient_id", name: "encounter_diagnosis_patient_id_fk"
  add_foreign_key "encounter_diagnosis", "users", column: "changed_by", primary_key: "user_id", name: "encounter_diagnosis_changed_by_fk"
  add_foreign_key "encounter_diagnosis", "users", column: "creator", primary_key: "user_id", name: "encounter_diagnosis_creator_fk"
  add_foreign_key "encounter_diagnosis", "users", column: "voided_by", primary_key: "user_id", name: "encounter_diagnosis_voided_by_fk"
  add_foreign_key "encounter_provider", "encounter", primary_key: "encounter_id", name: "encounter_id_fk"
  add_foreign_key "encounter_provider", "encounter_role", primary_key: "encounter_role_id", name: "encounter_role_id_fk"
  add_foreign_key "encounter_provider", "provider", primary_key: "provider_id", name: "provider_id_fk"
  add_foreign_key "encounter_provider", "users", column: "changed_by", primary_key: "user_id", name: "encounter_provider_changed_by"
  add_foreign_key "encounter_provider", "users", column: "creator", primary_key: "user_id", name: "encounter_provider_creator"
  add_foreign_key "encounter_provider", "users", column: "voided_by", primary_key: "user_id", name: "encounter_provider_voided_by"
  add_foreign_key "encounter_role", "users", column: "changed_by", primary_key: "user_id", name: "encounter_role_changed_by_fk"
  add_foreign_key "encounter_role", "users", column: "creator", primary_key: "user_id", name: "encounter_role_creator_fk"
  add_foreign_key "encounter_role", "users", column: "retired_by", primary_key: "user_id", name: "encounter_role_retired_by_fk"
  add_foreign_key "encounter_type", "privilege", column: "edit_privilege", primary_key: "privilege", name: "privilege_which_can_edit_encounter_type"
  add_foreign_key "encounter_type", "privilege", column: "view_privilege", primary_key: "privilege", name: "privilege_which_can_view_encounter_type"
  add_foreign_key "encounter_type", "users", column: "changed_by", primary_key: "user_id", name: "encounter_type_changed_by"
  add_foreign_key "encounter_type", "users", column: "creator", primary_key: "user_id", name: "user_who_created_type"
  add_foreign_key "encounter_type", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_encounter_type"
  add_foreign_key "field", "concept", primary_key: "concept_id", name: "concept_for_field"
  add_foreign_key "field", "field_type", column: "field_type", primary_key: "field_type_id", name: "type_of_field"
  add_foreign_key "field", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_field"
  add_foreign_key "field", "users", column: "creator", primary_key: "user_id", name: "user_who_created_field"
  add_foreign_key "field", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_field"
  add_foreign_key "field_answer", "concept", column: "answer_id", primary_key: "concept_id", name: "field_answer_concept"
  add_foreign_key "field_answer", "field", primary_key: "field_id", name: "answers_for_field"
  add_foreign_key "field_answer", "users", column: "creator", primary_key: "user_id", name: "user_who_created_field_answer"
  add_foreign_key "field_type", "users", column: "creator", primary_key: "user_id", name: "user_who_created_field_type"
  add_foreign_key "form", "encounter_type", column: "encounter_type", primary_key: "encounter_type_id", name: "form_encounter_type"
  add_foreign_key "form", "users", column: "changed_by", primary_key: "user_id", name: "user_who_last_changed_form"
  add_foreign_key "form", "users", column: "creator", primary_key: "user_id", name: "user_who_created_form"
  add_foreign_key "form", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_form"
  add_foreign_key "form_field", "field", primary_key: "field_id", name: "field_within_form"
  add_foreign_key "form_field", "form", primary_key: "form_id", name: "form_containing_field"
  add_foreign_key "form_field", "form_field", column: "parent_form_field", primary_key: "form_field_id", name: "form_field_hierarchy"
  add_foreign_key "form_field", "users", column: "changed_by", primary_key: "user_id", name: "user_who_last_changed_form_field"
  add_foreign_key "form_field", "users", column: "creator", primary_key: "user_id", name: "user_who_created_form_field"
  add_foreign_key "form_resource", "form", primary_key: "form_id", name: "form_resource_form_fk"
  add_foreign_key "form_resource", "users", column: "changed_by", primary_key: "user_id", name: "form_resource_changed_by"
  add_foreign_key "formentry_archive", "users", column: "creator", primary_key: "user_id", name: "User who created formentry_archive"
  add_foreign_key "formentry_error", "users", column: "creator", primary_key: "user_id", name: "User who created formentry_error"
  add_foreign_key "formentry_xsn", "form", primary_key: "form_id", name: "Form with which this xsn is related"
  add_foreign_key "formentry_xsn", "users", column: "archived_by", primary_key: "user_id", name: "User who archived formentry_xsn"
  add_foreign_key "formentry_xsn", "users", column: "creator", primary_key: "user_id", name: "User who created formentry_xsn"
  add_foreign_key "global_property", "users", column: "changed_by", primary_key: "user_id", name: "global_property_changed_by"
  add_foreign_key "hl7_in_queue", "hl7_source", column: "hl7_source", primary_key: "hl7_source_id", name: "hl7_source"
  add_foreign_key "hl7_source", "users", column: "creator", primary_key: "user_id", name: "creator"
  add_foreign_key "htmlformentry_html_form", "form", primary_key: "form_id", name: "Form with which this htmlform is related"
  add_foreign_key "htmlformentry_html_form", "users", column: "changed_by", primary_key: "user_id", name: "User who changed htmlformentry_htmlform"
  add_foreign_key "htmlformentry_html_form", "users", column: "creator", primary_key: "user_id", name: "User who created htmlformentry_htmlform"
  add_foreign_key "htmlformentry_html_form", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_html_form"
  add_foreign_key "location", "location", column: "parent_location", primary_key: "location_id", name: "parent_location"
  add_foreign_key "location", "users", column: "changed_by", primary_key: "user_id", name: "location_changed_by"
  add_foreign_key "location", "users", column: "creator", primary_key: "user_id", name: "user_who_created_location"
  add_foreign_key "location", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_location"
  add_foreign_key "location_attribute", "location", primary_key: "location_id", name: "location_attribute_location_fk"
  add_foreign_key "location_attribute", "location_attribute_type", column: "attribute_type_id", primary_key: "location_attribute_type_id", name: "location_attribute_attribute_type_id_fk"
  add_foreign_key "location_attribute", "users", column: "changed_by", primary_key: "user_id", name: "location_attribute_changed_by_fk"
  add_foreign_key "location_attribute", "users", column: "creator", primary_key: "user_id", name: "location_attribute_creator_fk"
  add_foreign_key "location_attribute", "users", column: "voided_by", primary_key: "user_id", name: "location_attribute_voided_by_fk"
  add_foreign_key "location_attribute_type", "users", column: "changed_by", primary_key: "user_id", name: "location_attribute_type_changed_by_fk"
  add_foreign_key "location_attribute_type", "users", column: "creator", primary_key: "user_id", name: "location_attribute_type_creator_fk"
  add_foreign_key "location_attribute_type", "users", column: "retired_by", primary_key: "user_id", name: "location_attribute_type_retired_by_fk"
  add_foreign_key "location_tag", "users", column: "changed_by", primary_key: "user_id", name: "location_tag_changed_by"
  add_foreign_key "location_tag", "users", column: "creator", primary_key: "user_id", name: "location_tag_creator"
  add_foreign_key "location_tag", "users", column: "retired_by", primary_key: "user_id", name: "location_tag_retired_by"
  add_foreign_key "location_tag_map", "location", primary_key: "location_id", name: "location_tag_map_location"
  add_foreign_key "location_tag_map", "location_tag", primary_key: "location_tag_id", name: "location_tag_map_tag"
  add_foreign_key "logic_rule_definition", "users", column: "changed_by", primary_key: "user_id", name: "changed_by for rule_definition"
  add_foreign_key "logic_rule_definition", "users", column: "creator", primary_key: "user_id", name: "creator for rule_definition"
  add_foreign_key "logic_rule_definition", "users", column: "retired_by", primary_key: "user_id", name: "retired_by for rule_definition"
  add_foreign_key "logic_rule_token", "person", column: "changed_by", primary_key: "person_id", name: "token_changed_by"
  add_foreign_key "logic_rule_token", "person", column: "creator", primary_key: "person_id", name: "token_creator"
  add_foreign_key "logic_rule_token_tag", "logic_rule_token", primary_key: "logic_rule_token_id", name: "token_tag"
  add_foreign_key "logic_token_registration", "users", column: "changed_by", primary_key: "user_id", name: "token_registration_changed_by"
  add_foreign_key "logic_token_registration", "users", column: "creator", primary_key: "user_id", name: "token_registration_creator"
  add_foreign_key "logic_token_registration_tag", "logic_token_registration", column: "token_registration_id", primary_key: "token_registration_id", name: "token_registration_tag"
  add_foreign_key "note", "encounter", primary_key: "encounter_id", name: "encounter_note"
  add_foreign_key "note", "note", column: "parent", primary_key: "note_id", name: "note_hierarchy"
  add_foreign_key "note", "obs", column: "obs_id", primary_key: "obs_id", name: "obs_note"
  add_foreign_key "note", "patient", primary_key: "patient_id", name: "patient_note", on_update: :cascade
  add_foreign_key "note", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_note"
  add_foreign_key "note", "users", column: "creator", primary_key: "user_id", name: "user_who_created_note"
  add_foreign_key "notification_alert", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_alert"
  add_foreign_key "notification_alert", "users", column: "creator", primary_key: "user_id", name: "alert_creator"
  add_foreign_key "notification_alert_recipient", "notification_alert", column: "alert_id", primary_key: "alert_id", name: "id_of_alert"
  add_foreign_key "notification_alert_recipient", "users", primary_key: "user_id", name: "alert_read_by_user"
  add_foreign_key "obs", "concept", column: "value_coded", primary_key: "concept_id", name: "answer_concept"
  add_foreign_key "obs", "concept", primary_key: "concept_id", name: "obs_concept"
  add_foreign_key "obs", "concept_name", column: "value_coded_name_id", primary_key: "concept_name_id", name: "obs_name_of_coded_value"
  add_foreign_key "obs", "drug", column: "value_drug", primary_key: "drug_id", name: "answer_concept_drug"
  add_foreign_key "obs", "encounter", primary_key: "encounter_id", name: "encounter_observations"
  add_foreign_key "obs", "location", primary_key: "location_id", name: "obs_location"
  add_foreign_key "obs", "obs", column: "obs_group_id", primary_key: "obs_id", name: "obs_grouping_id"
  add_foreign_key "obs", "obs", column: "previous_version", primary_key: "obs_id", name: "previous_version"
  add_foreign_key "obs", "orders", primary_key: "order_id", name: "obs_order"
  add_foreign_key "obs", "person", primary_key: "person_id", name: "person_obs", on_update: :cascade
  add_foreign_key "obs", "users", column: "creator", primary_key: "user_id", name: "obs_enterer"
  add_foreign_key "obs", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_obs"
  add_foreign_key "order_frequency", "concept", primary_key: "concept_id", name: "order_frequency_concept_id_fk"
  add_foreign_key "order_frequency", "users", column: "changed_by", primary_key: "user_id", name: "order_frequency_changed_by_fk"
  add_foreign_key "order_frequency", "users", column: "creator", primary_key: "user_id", name: "order_frequency_creator_fk"
  add_foreign_key "order_frequency", "users", column: "retired_by", primary_key: "user_id", name: "order_frequency_retired_by_fk"
  add_foreign_key "order_group", "encounter", primary_key: "encounter_id", name: "order_group_encounter_id_fk"
  add_foreign_key "order_group", "order_set", primary_key: "order_set_id", name: "order_group_set_id_fk"
  add_foreign_key "order_group", "patient", primary_key: "patient_id", name: "order_group_patient_id_fk"
  add_foreign_key "order_group", "users", column: "changed_by", primary_key: "user_id", name: "order_group_changed_by_fk"
  add_foreign_key "order_group", "users", column: "creator", primary_key: "user_id", name: "order_group_creator_fk"
  add_foreign_key "order_group", "users", column: "voided_by", primary_key: "user_id", name: "order_group_voided_by_fk"
  add_foreign_key "order_set", "users", column: "changed_by", primary_key: "user_id", name: "order_set_changed_by_fk"
  add_foreign_key "order_set", "users", column: "creator", primary_key: "user_id", name: "order_set_creator_fk"
  add_foreign_key "order_set", "users", column: "retired_by", primary_key: "user_id", name: "order_set_retired_by_fk"
  add_foreign_key "order_set_member", "concept", primary_key: "concept_id", name: "order_set_member_concept_id_fk"
  add_foreign_key "order_set_member", "order_set", primary_key: "order_set_id", name: "order_set_member_order_set_id_fk"
  add_foreign_key "order_set_member", "order_type", column: "order_type", primary_key: "order_type_id", name: "order_set_member_order_type_fk"
  add_foreign_key "order_set_member", "users", column: "changed_by", primary_key: "user_id", name: "order_set_member_changed_by_fk"
  add_foreign_key "order_set_member", "users", column: "creator", primary_key: "user_id", name: "order_set_member_creator_fk"
  add_foreign_key "order_set_member", "users", column: "retired_by", primary_key: "user_id", name: "order_set_member_retired_by_fk"
  add_foreign_key "order_type", "order_type", column: "parent", primary_key: "order_type_id", name: "order_type_parent_order_type"
  add_foreign_key "order_type", "users", column: "changed_by", primary_key: "user_id", name: "order_type_changed_by"
  add_foreign_key "order_type", "users", column: "creator", primary_key: "user_id", name: "type_created_by"
  add_foreign_key "order_type", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_order_type"
  add_foreign_key "order_type_class_map", "concept_class", primary_key: "concept_class_id", name: "fk_order_type_class_map_concept_class_concept_class_id"
  add_foreign_key "order_type_class_map", "order_type", primary_key: "order_type_id", name: "fk_order_type_order_type_id"
  add_foreign_key "orders", "care_setting", column: "care_setting", primary_key: "care_setting_id", name: "orders_care_setting"
  add_foreign_key "orders", "concept", column: "order_reason", primary_key: "concept_id", name: "discontinued_because"
  add_foreign_key "orders", "encounter", primary_key: "encounter_id", name: "orders_in_encounter"
  add_foreign_key "orders", "order_group", primary_key: "order_group_id", name: "orders_order_group_id_fk"
  add_foreign_key "orders", "order_type", primary_key: "order_type_id", name: "type_of_order"
  add_foreign_key "orders", "orders", column: "previous_order_id", primary_key: "order_id", name: "previous_order_id_order_id"
  add_foreign_key "orders", "patient", primary_key: "patient_id", name: "order_for_patient", on_update: :cascade
  add_foreign_key "orders", "provider", column: "orderer", primary_key: "provider_id", name: "fk_orderer_provider"
  add_foreign_key "orders", "users", column: "creator", primary_key: "user_id", name: "order_creator"
  add_foreign_key "orders", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_order"
  add_foreign_key "patient", "person", column: "patient_id", primary_key: "person_id", name: "person_id_for_patient", on_update: :cascade
  add_foreign_key "patient", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_pat"
  add_foreign_key "patient", "users", column: "creator", primary_key: "user_id", name: "user_who_created_patient"
  add_foreign_key "patient", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_patient"
  add_foreign_key "patient_identifier", "location", primary_key: "location_id", name: "patient_identifier_ibfk_2"
  add_foreign_key "patient_identifier", "patient", primary_key: "patient_id", name: "fk_patient_id_patient_identifier"
  add_foreign_key "patient_identifier", "patient", primary_key: "patient_id", name: "identifies_patient"
  add_foreign_key "patient_identifier", "patient_identifier_type", column: "identifier_type", primary_key: "patient_identifier_type_id", name: "defines_identifier_type"
  add_foreign_key "patient_identifier", "users", column: "changed_by", primary_key: "user_id", name: "patient_identifier_changed_by"
  add_foreign_key "patient_identifier", "users", column: "creator", primary_key: "user_id", name: "identifier_creator"
  add_foreign_key "patient_identifier", "users", column: "voided_by", primary_key: "user_id", name: "identifier_voider"
  add_foreign_key "patient_identifier_type", "users", column: "changed_by", primary_key: "user_id", name: "patient_identifier_type_changed_by"
  add_foreign_key "patient_identifier_type", "users", column: "creator", primary_key: "user_id", name: "type_creator"
  add_foreign_key "patient_identifier_type", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_patient_identifier_type"
  add_foreign_key "patient_program", "concept", column: "outcome_concept_id", primary_key: "concept_id", name: "patient_program_outcome_concept_id_fk"
  add_foreign_key "patient_program", "location", primary_key: "location_id", name: "patient_program_location_id"
  add_foreign_key "patient_program", "patient", primary_key: "patient_id", name: "patient_in_program", on_update: :cascade
  add_foreign_key "patient_program", "program", primary_key: "program_id", name: "program_for_patient"
  add_foreign_key "patient_program", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed"
  add_foreign_key "patient_program", "users", column: "creator", primary_key: "user_id", name: "patient_program_creator"
  add_foreign_key "patient_program", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_patient_program"
  add_foreign_key "patient_program_attribute", "patient_program", primary_key: "patient_program_id", name: "patient_program_attribute_programid_fk"
  add_foreign_key "patient_program_attribute", "program_attribute_type", column: "attribute_type_id", primary_key: "program_attribute_type_id", name: "patient_program_attribute_attributetype_fk"
  add_foreign_key "patient_program_attribute", "users", column: "changed_by", primary_key: "user_id", name: "patient_program_attribute_changed_by_fk"
  add_foreign_key "patient_program_attribute", "users", column: "creator", primary_key: "user_id", name: "patient_program_attribute_creator_fk"
  add_foreign_key "patient_program_attribute", "users", column: "voided_by", primary_key: "user_id", name: "patient_program_attribute_voided_by_fk"
  add_foreign_key "patient_state", "patient_program", primary_key: "patient_program_id", name: "patient_program_for_state"
  add_foreign_key "patient_state", "program_workflow_state", column: "state", primary_key: "program_workflow_state_id", name: "state_for_patient"
  add_foreign_key "patient_state", "users", column: "changed_by", primary_key: "user_id", name: "patient_state_changer"
  add_foreign_key "patient_state", "users", column: "creator", primary_key: "user_id", name: "patient_state_creator"
  add_foreign_key "patient_state", "users", column: "voided_by", primary_key: "user_id", name: "patient_state_voider"
  add_foreign_key "person", "concept", column: "cause_of_death", primary_key: "concept_id", name: "person_died_because"
  add_foreign_key "person", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_person"
  add_foreign_key "person", "users", column: "creator", primary_key: "user_id", name: "user_who_created_person"
  add_foreign_key "person", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_person"
  add_foreign_key "person_address", "person", primary_key: "person_id", name: "address_for_person", on_update: :cascade
  add_foreign_key "person_address", "users", column: "changed_by", primary_key: "user_id", name: "person_address_changed_by"
  add_foreign_key "person_address", "users", column: "creator", primary_key: "user_id", name: "patient_address_creator"
  add_foreign_key "person_address", "users", column: "voided_by", primary_key: "user_id", name: "patient_address_void"
  add_foreign_key "person_attribute", "person", primary_key: "person_id", name: "identifies_person"
  add_foreign_key "person_attribute", "person_attribute_type", primary_key: "person_attribute_type_id", name: "defines_attribute_type"
  add_foreign_key "person_attribute", "users", column: "changed_by", primary_key: "user_id", name: "attribute_changer"
  add_foreign_key "person_attribute", "users", column: "creator", primary_key: "user_id", name: "attribute_creator"
  add_foreign_key "person_attribute", "users", column: "voided_by", primary_key: "user_id", name: "attribute_voider"
  add_foreign_key "person_attribute_type", "privilege", column: "edit_privilege", primary_key: "privilege", name: "privilege_which_can_edit"
  add_foreign_key "person_attribute_type", "users", column: "changed_by", primary_key: "user_id", name: "attribute_type_changer"
  add_foreign_key "person_attribute_type", "users", column: "creator", primary_key: "user_id", name: "attribute_type_creator"
  add_foreign_key "person_attribute_type", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_person_attribute_type"
  add_foreign_key "person_merge_log", "person", column: "loser_person_id", primary_key: "person_id", name: "person_merge_log_loser"
  add_foreign_key "person_merge_log", "person", column: "winner_person_id", primary_key: "person_id", name: "person_merge_log_winner"
  add_foreign_key "person_merge_log", "users", column: "changed_by", primary_key: "user_id", name: "person_merge_log_changed_by_fk"
  add_foreign_key "person_merge_log", "users", column: "creator", primary_key: "user_id", name: "person_merge_log_creator"
  add_foreign_key "person_merge_log", "users", column: "voided_by", primary_key: "user_id", name: "person_merge_log_voided_by_fk"
  add_foreign_key "person_name", "person", primary_key: "person_id", name: "name for person", on_update: :cascade
  add_foreign_key "person_name", "users", column: "creator", primary_key: "user_id", name: "user_who_made_name"
  add_foreign_key "person_name", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_name"
  add_foreign_key "program", "concept", column: "outcomes_concept_id", primary_key: "concept_id", name: "program_outcomes_concept_id_fk"
  add_foreign_key "program", "concept", primary_key: "concept_id", name: "program_concept"
  add_foreign_key "program", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_program"
  add_foreign_key "program", "users", column: "creator", primary_key: "user_id", name: "program_creator"
  add_foreign_key "program_attribute_type", "users", column: "changed_by", primary_key: "user_id", name: "program_attribute_type_changed_by_fk"
  add_foreign_key "program_attribute_type", "users", column: "creator", primary_key: "user_id", name: "program_attribute_type_creator_fk"
  add_foreign_key "program_attribute_type", "users", column: "retired_by", primary_key: "user_id", name: "program_attribute_type_retired_by_fk"
  add_foreign_key "program_workflow", "concept", primary_key: "concept_id", name: "workflow_concept"
  add_foreign_key "program_workflow", "program", primary_key: "program_id", name: "program_for_workflow"
  add_foreign_key "program_workflow", "users", column: "changed_by", primary_key: "user_id", name: "workflow_changed_by"
  add_foreign_key "program_workflow", "users", column: "creator", primary_key: "user_id", name: "workflow_creator"
  add_foreign_key "program_workflow_state", "concept", primary_key: "concept_id", name: "state_concept"
  add_foreign_key "program_workflow_state", "program_workflow", primary_key: "program_workflow_id", name: "workflow_for_state"
  add_foreign_key "program_workflow_state", "users", column: "changed_by", primary_key: "user_id", name: "state_changed_by"
  add_foreign_key "program_workflow_state", "users", column: "creator", primary_key: "user_id", name: "state_creator"
  add_foreign_key "provider", "concept", column: "role_id", primary_key: "concept_id", name: "provider_role_id_fk"
  add_foreign_key "provider", "concept", column: "speciality_id", primary_key: "concept_id", name: "provider_speciality_id_fk"
  add_foreign_key "provider", "person", primary_key: "person_id", name: "provider_person_id_fk"
  add_foreign_key "provider", "users", column: "changed_by", primary_key: "user_id", name: "provider_changed_by_fk"
  add_foreign_key "provider", "users", column: "creator", primary_key: "user_id", name: "provider_creator_fk"
  add_foreign_key "provider", "users", column: "retired_by", primary_key: "user_id", name: "provider_retired_by_fk"
  add_foreign_key "provider_attribute", "provider", primary_key: "provider_id", name: "provider_attribute_provider_fk"
  add_foreign_key "provider_attribute", "provider_attribute_type", column: "attribute_type_id", primary_key: "provider_attribute_type_id", name: "provider_attribute_attribute_type_id_fk"
  add_foreign_key "provider_attribute", "users", column: "changed_by", primary_key: "user_id", name: "provider_attribute_changed_by_fk"
  add_foreign_key "provider_attribute", "users", column: "creator", primary_key: "user_id", name: "provider_attribute_creator_fk"
  add_foreign_key "provider_attribute", "users", column: "voided_by", primary_key: "user_id", name: "provider_attribute_voided_by_fk"
  add_foreign_key "provider_attribute_type", "users", column: "changed_by", primary_key: "user_id", name: "provider_attribute_type_changed_by_fk"
  add_foreign_key "provider_attribute_type", "users", column: "creator", primary_key: "user_id", name: "provider_attribute_type_creator_fk"
  add_foreign_key "provider_attribute_type", "users", column: "retired_by", primary_key: "user_id", name: "provider_attribute_type_retired_by_fk"
  add_foreign_key "relationship", "person", column: "person_a", primary_key: "person_id", name: "person_a_is_person"
  add_foreign_key "relationship", "person", column: "person_b", primary_key: "person_id", name: "person_b_is_person"
  add_foreign_key "relationship", "relationship_type", column: "relationship", primary_key: "relationship_type_id", name: "relationship_type_id"
  add_foreign_key "relationship", "users", column: "changed_by", primary_key: "user_id", name: "relationship_changed_by"
  add_foreign_key "relationship", "users", column: "creator", primary_key: "user_id", name: "relation_creator"
  add_foreign_key "relationship", "users", column: "voided_by", primary_key: "user_id", name: "relation_voider"
  add_foreign_key "relationship_type", "users", column: "changed_by", primary_key: "user_id", name: "relationship_type_changed_by"
  add_foreign_key "relationship_type", "users", column: "creator", primary_key: "user_id", name: "user_who_created_rel"
  add_foreign_key "relationship_type", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_relationship_type"
  add_foreign_key "report_object", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_report_object"
  add_foreign_key "report_object", "users", column: "creator", primary_key: "user_id", name: "report_object_creator"
  add_foreign_key "report_object", "users", column: "voided_by", primary_key: "user_id", name: "user_who_voided_report_object"
  add_foreign_key "reporting_report_design", "serialized_object", column: "report_definition_id", primary_key: "serialized_object_id", name: "report_definition_id for reporting_report_design"
  add_foreign_key "reporting_report_design", "users", column: "changed_by", primary_key: "user_id", name: "changed_by for reporting_report_design"
  add_foreign_key "reporting_report_design", "users", column: "creator", primary_key: "user_id", name: "creator for reporting_report_design"
  add_foreign_key "reporting_report_design", "users", column: "retired_by", primary_key: "user_id", name: "retired_by for reporting_report_design"
  add_foreign_key "reporting_report_design_resource", "reporting_report_design", column: "report_design_id", name: "report_design_id for reporting_report_design_resource"
  add_foreign_key "reporting_report_design_resource", "users", column: "changed_by", primary_key: "user_id", name: "changed_by for reporting_report_design_resource"
  add_foreign_key "reporting_report_design_resource", "users", column: "creator", primary_key: "user_id", name: "creator for reporting_report_design_resource"
  add_foreign_key "reporting_report_design_resource", "users", column: "retired_by", primary_key: "user_id", name: "retired_by for reporting_report_design_resource"
  add_foreign_key "reporting_report_request", "users", column: "requested_by", primary_key: "user_id", name: "requested_by for reporting_report_request"
  add_foreign_key "role_privilege", "privilege", column: "privilege", primary_key: "privilege", name: "privilege_definitions"
  add_foreign_key "role_privilege", "role", column: "role", primary_key: "role", name: "role_privilege"
  add_foreign_key "role_role", "role", column: "child_role", primary_key: "role", name: "inherited_role"
  add_foreign_key "role_role", "role", column: "parent_role", primary_key: "role", name: "parent_role"
  add_foreign_key "scheduler_task_config", "users", column: "changed_by", primary_key: "user_id", name: "scheduler_changer"
  add_foreign_key "scheduler_task_config", "users", column: "created_by", primary_key: "user_id", name: "scheduler_creator"
  add_foreign_key "scheduler_task_config_property", "scheduler_task_config", column: "task_config_id", primary_key: "task_config_id", name: "task_config_for_property"
  add_foreign_key "serialized_object", "users", column: "changed_by", primary_key: "user_id", name: "serialized_object_changed_by"
  add_foreign_key "serialized_object", "users", column: "creator", primary_key: "user_id", name: "serialized_object_creator"
  add_foreign_key "serialized_object", "users", column: "retired_by", primary_key: "user_id", name: "serialized_object_retired_by"
  add_foreign_key "test_order", "concept", column: "specimen_source", primary_key: "concept_id", name: "test_order_specimen_source_fk"
  add_foreign_key "test_order", "order_frequency", column: "frequency", primary_key: "order_frequency_id", name: "test_order_frequency_fk"
  add_foreign_key "test_order", "orders", primary_key: "order_id", name: "test_order_order_id_fk"
  add_foreign_key "user_property", "users", primary_key: "user_id", name: "user_property"
  add_foreign_key "user_role", "role", column: "role", primary_key: "role", name: "role_definitions"
  add_foreign_key "user_role", "users", primary_key: "user_id", name: "user_role"
  add_foreign_key "users", "person", primary_key: "person_id", name: "person_id_for_user"
  add_foreign_key "users", "users", column: "changed_by", primary_key: "user_id", name: "user_who_changed_user"
  add_foreign_key "users", "users", column: "creator", primary_key: "user_id", name: "user_creator"
  add_foreign_key "users", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_this_user"
  add_foreign_key "visit", "concept", column: "indication_concept_id", primary_key: "concept_id", name: "visit_indication_concept_fk"
  add_foreign_key "visit", "location", primary_key: "location_id", name: "visit_location_fk"
  add_foreign_key "visit", "patient", primary_key: "patient_id", name: "visit_patient_fk"
  add_foreign_key "visit", "users", column: "changed_by", primary_key: "user_id", name: "visit_changed_by_fk"
  add_foreign_key "visit", "users", column: "creator", primary_key: "user_id", name: "visit_creator_fk"
  add_foreign_key "visit", "users", column: "voided_by", primary_key: "user_id", name: "visit_voided_by_fk"
  add_foreign_key "visit", "visit_type", primary_key: "visit_type_id", name: "visit_type_fk"
  add_foreign_key "visit_attribute", "users", column: "changed_by", primary_key: "user_id", name: "visit_attribute_changed_by_fk"
  add_foreign_key "visit_attribute", "users", column: "creator", primary_key: "user_id", name: "visit_attribute_creator_fk"
  add_foreign_key "visit_attribute", "users", column: "voided_by", primary_key: "user_id", name: "visit_attribute_voided_by_fk"
  add_foreign_key "visit_attribute", "visit", primary_key: "visit_id", name: "visit_attribute_visit_fk"
  add_foreign_key "visit_attribute", "visit_attribute_type", column: "attribute_type_id", primary_key: "visit_attribute_type_id", name: "visit_attribute_attribute_type_id_fk"
  add_foreign_key "visit_attribute_type", "users", column: "changed_by", primary_key: "user_id", name: "visit_attribute_type_changed_by_fk"
  add_foreign_key "visit_attribute_type", "users", column: "creator", primary_key: "user_id", name: "visit_attribute_type_creator_fk"
  add_foreign_key "visit_attribute_type", "users", column: "retired_by", primary_key: "user_id", name: "visit_attribute_type_retired_by_fk"
  add_foreign_key "visit_type", "users", column: "changed_by", primary_key: "user_id", name: "visit_type_changed_by"
  add_foreign_key "visit_type", "users", column: "creator", primary_key: "user_id", name: "visit_type_creator"
  add_foreign_key "visit_type", "users", column: "retired_by", primary_key: "user_id", name: "visit_type_retired_by"
  add_foreign_key "xforms_person_repeat_attribute", "person", primary_key: "person_id", name: "repeat_identifies_person"
  add_foreign_key "xforms_person_repeat_attribute", "person_attribute_type", primary_key: "person_attribute_type_id", name: "repeat_defines_attribute_type"
  add_foreign_key "xforms_person_repeat_attribute", "users", column: "changed_by", primary_key: "user_id", name: "repeat_attribute_changer"
  add_foreign_key "xforms_person_repeat_attribute", "users", column: "creator", primary_key: "user_id", name: "repeat_attribute_creator"
  add_foreign_key "xforms_person_repeat_attribute", "users", column: "voided_by", primary_key: "user_id", name: "repeat_attribute_voider"
  add_foreign_key "xforms_xform", "users", column: "changed_by", primary_key: "user_id", name: "user_who_last_changed_xform"
  add_foreign_key "xforms_xform", "users", column: "creator", primary_key: "user_id", name: "user_who_created_xform"
end
