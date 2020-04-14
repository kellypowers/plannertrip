class FeedbacksController < ApplicationController 
    before_action :set_event

    def new 
        @feedback = @event.feedbacks.build
    end

    def create 
        @feedback = @event.feedbacks.build(feedback_params)
        @feedback.user_id = current_user.id
        if @feedback.save
            redirect_to @event
        else
            render :new
        end
    end

    def edit 
        @feedback = Feedback.find_by_id(params[:id])
    end


    def update
        @feedback = Feedback.find_by_id(params[:id])
        if @feedback.user == current_user
                if @feedback.update(feedback_params)
                    flash[:message] =  "Update completed" 
                    redirect_to event_path(@event)
                else 
                    flash[:message] = "Unable to update"
                end
        else
            flash[:message] = "You can only update your own comments."
            redirect_to event_path(@event)
        end
    end

    def destroy
        feedback = @event.feedbacks.find_by_id(params[:id])
        feedback.destroy
        redirect_to event_path(@event)
    end

    private

    def feedback_params
        params.require(:feedback).permit(:content, :rating)
    end

    def set_event
        @event = Event.find(params[:event_id])
    end



end