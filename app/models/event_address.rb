class EventAddress < ApplicationRecord
    belongs_to :events
    belongs_to :addresses

end