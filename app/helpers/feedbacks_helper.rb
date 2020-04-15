module FeedbacksHelper
  def updated_at(feedback)
    feedback.updated_at.strftime("%A, %b %e, at %l:%M %p")
  end

end