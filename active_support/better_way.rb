require 'active_support'

module B
  extend ActiveSupport::Concern

  def say_yes
    puts 'say instance'
  end

  module ClassMethods
    def say_yes
      puts 'say class'
    end
  end
end

class A
  include B
end

A.new.say_yes # say instance
A.say_yes # say class