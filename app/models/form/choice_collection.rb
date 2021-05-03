 class Form::ChoiceCollection
  
     include ActiveModel::Model
     include ActiveModel::Conversion
     extend ActiveModel::Naming
     extend ActiveModel::Translation
     include ActiveModel::AttributeMethods
     include ActiveModel::Validations

     CHOICE_NUM = 3 
     attr_accessor :collection
  
     def initialize(attributes = [])
       self.collection = CHOICE_NUM.times.map{ Choice.new } unless collection.present?
     end
  
     def persisted?
       false
     end
 end
