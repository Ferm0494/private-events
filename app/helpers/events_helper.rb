module EventsHelper
    def attending_already?(event)
        user = User.find(session[:id])
      return true  unless event.attendees.include? user
            false 
    end
end
