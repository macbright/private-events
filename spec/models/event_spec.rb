# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = Event.new(title: 'Example Event',
                       description: 'example',
                       location: 'online',
                       event_date: Date.today,
                       creator_id: 1)
  end

  context 'Validation Test' do
    it 'ensure that title is present' do
      @event.title = ''
      expect(@event.valid?).to eql(false)
    end

    it 'ensure that description is present' do
      @event.description = ''
      expect(@event.valid?).to eql(false)
    end

    it 'ensure that location is present' do
      @event.location = ''
      expect(@event.valid?).to eql(false)
    end

    it 'ensure that event_date is present' do
      @event.event_date = ''
      expect(@event.valid?).to eql(false)
    end

    it 'ensure that the created event is saved' do
      @valid_user = User.create(name: 'valid user',
                                email: 'valid_user@abc.com')

      @event = @valid_user.events.build(title: 'Example Event',
                                        description: 'example',
                                        location: 'online',
                                        event_date: Date.today)

      expect(@event.valid?).to eql(true)
    end
  end
end
