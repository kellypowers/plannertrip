class FeedbacksController < ApplicationController 


    def new 
        @feedback = Feedback.new
        @event = Event.find_by_id(params[:event_id])
    end

    def create 
        binding.pry
         @event = Event.find_by_id(params[:event_id])
        # #@event = current_user.events.build(event_params)
        # @feedback = @event.feedbacks.build(feedback_params)
    end


    def edit 
        #binding.pry
        @event = Event.find_by_id(params[:event_id])
        @feedback = Feedback.find_by_id(params[:id])
    end

    def update
        # @event = Event.find_by_id(params[:event_id])
        # @feedback = Feedback.find_by_id(params[:id])
        # binding.pry
        # @event.feedbacks.update(feedback_params)
    end

    def destroy
        #raise params.inspect
        event = Event.find_by_id(params[:event_id])
        feedback = event.feedbacks.find_by_id(params[:id])
        feedback.destroy
        redirect_to event_path(event)
    end

    private

    def feedback_params
        params.require(:feedback).permit(:content, :rating)
    end



end