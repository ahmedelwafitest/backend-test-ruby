class CustomAttributesForm
  include ActiveModel::Model

  def initialize(params={}, new_object, attributes, **validator)
    @new_object = new_object
    validator = validator[:validator] || ''
    generate_accessors_validator(@new_object.custom_attributes, attributes, validator )

    super(params)
  end

  def attributes
    @new_object.custom_attributes
  end

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private
  def generate_accessors_validator(custom_fields, fields, validator="")
    fields.each do |field|
      add_presence_validator(field.name) if field["#{validator}required"]
      define_singleton_method(field.name) do
        custom_fields[field.name]
      end
      define_singleton_method("#{field.name}=") do |value|
        custom_fields[field.name] = convert_value(field, value)
      end
    end
  end

  def add_presence_validator(attribute)
    singleton_class.instance_eval do
      validates_presence_of(attribute)
    end
  end

  def convert_value(field, value)
    if field.boolean?
      ActiveModel::Type::Boolean.new.cast(value)
    else
      value.nil? ? nil : value.to_s.strip
    end
  end

  def persist!
    @new_object.save
  end
end