module DataTypeEnumConcern
  extend ActiveSupport::Concern

  included do
    enum data_type: {text: 0, boolean: 1}
  end
end