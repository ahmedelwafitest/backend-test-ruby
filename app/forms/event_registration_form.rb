class EventRegistrationForm < CustomAttributesForm

  def initialize(user_id, event_id, params={})
    event = Event.find(event_id)
    event_registration = event.event_registrations.new(user_id: user_id)
    event_attributes = event.event_attributes

    super(params, event_registration, event_attributes)
  end

end