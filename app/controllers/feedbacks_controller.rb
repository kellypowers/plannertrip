class FeedbacksController < ApplicationController 


    def new 
        @feedback = Feedback.new
        @event = Event.find_by_id(params[:event_id])
    end

    def create 
        
         @event = Event.find_by_id(params[:event_id])
        #@feedback = @event.feedbacks.build(feedback_params)
    end


    def edit 
        
        @event = Event.find_by_id(params[:event_id])
        @feedback = Feedback.find_by_id(params[:id])
    end

    def update
        #updates under event update
        # @event = Event.find_by_id(params[:event_id])
        # @feedback = Feedback.find_by_id(params[:id])
        # binding.pry
        # @event.feedbacks.update(feedback_params)
    end

    def destroy
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