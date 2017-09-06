def report_altitude_change(current_altitude, previous_altitude)
  change = current_altitude.to_meters - previous_altitude.to_meters
  puts change
end

require 'forwardable'

class Meters
  extend Forwardable
  def_delegators :@value, :to_s, :to_int, :to_i
  def initialize(value)
    @value = value
  end

  def to_meters
    self
  end

  def -(other)
    self.class.new(value - other.value)
  end

  protected

  attr_reader :value
end

current_altitude = Meters.new(220)
previous_altitude = Meters.new(108)
report_altitude_change current_altitude, previous_altitude  # 控制输入的类型
report_altitude_change current_altitude, 320