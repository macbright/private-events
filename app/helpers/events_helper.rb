module EventsHelper
    def future_event?
        @future_event = false
        if @event.event_date.month > Date.today.month
            @future_event = true 
            
        elsif @event.event_date.month >= Date.today.month && @event.event_date.day >= Date.today.day && 
            @future_event = true
        end
        @future_event
    end
end
