class Visit < VoidableRecord
  self.table_name = 'visit'
  self.primary_key = 'visit_id'
  
  belongs_to :patient, optional: false
  belongs_to :visit_type, optional: false
  belongs_to :indication, class_name: 'Concept', optional: true
  belongs_to :location
  
  has_many :encounters, -> { order(encounter_datetime: :desc, encounter_id: :desc) }
  
  validates :date_started, presence: true
  
  def voided_encounters
    encounters.where(voided: true)
  end
  
  def add_encounter(encounter)
    if encounter
      encounter.visit = self
      encounters << encounter
    end
  end
end

