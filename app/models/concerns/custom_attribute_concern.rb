module CustomAttributeConcern
  def merge_attributes(all_attributes, custom_attributes)
    all_attributes.inject(ActiveSupport::HashWithIndifferentAccess.new) do |merged_attributes, attribute|
      merged_attributes[attribute.name] = custom_attributes[attribute.name]
      merged_attributes
    end
  end
end