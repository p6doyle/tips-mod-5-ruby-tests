require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start
    i = 1
    # binding.pry
    while current <= date
      if current == date
        return true
      end

      if @period == 'monthly'
        current = @start.advance(months: @interval * i)
        i += 1

      elsif @period == 'weekly'
        current = current.advance(weeks: @interval)

      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end
    end

    return false
  end
end
