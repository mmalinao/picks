module PickError
  class Base < StandardError
    attr_reader :message

    def initialize(message)
      @message = message
    end
  end

  class InvalidCommand < PickError::Base
    def initialize(message = "Invalid command")
      super
    end
  end

  class SportsTeamNotFound < PickError::Base
    def initialize(message = "Sports team not found")
      super
    end
  end

  class SportsTeamNotScheduled < PickError::Base
    def initialize(message = "Sports team not scheduled tonight")
      super
    end
  end
end
