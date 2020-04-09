class FeedbacksController < ApplicationController 


    def new 
        @feedback = Feedback.new
        @event = Event.find_by_id(params[:event_id])
    end

    def create 
        @event = Event.find_by_id(params[:event_id])
        #@event = current_user.events.build(event_params)
        @feedback = @event.feedbacks.build(feedback_params)
    end


    def edit 
    end

    def update
    end

    def destroy
    end

    private

    def feedback_params
        params.require(:feedback).permit(:content, :rating)
    end



end