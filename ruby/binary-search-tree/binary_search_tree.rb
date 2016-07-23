require 'forwardable'

class Bst
  class Node
    attr_reader :data, :left, :right

    def initialize(data)
      @left = nil
      @right = nil
      @data = data
    end

    def insert(val)
      if val <= data
       insert_on_left(val)
      else
        insert_on_right(val)
      end
    end

    def to_array
      array = []
      array += left_array
      array << data
      array += right_array
      array
    end

    private

    attr_writer :left, :right

    [:left, :right].each do |side|
      define_method "insert_on_#{side}" do |val|
        if send(side).nil?
          send("#{side}=", Node.new(val))
        else
          send(side).insert val
        end
      end

      define_method "#{side}_array" do
        send(side)&.to_array || []
      end
    end
  end
  extend Forwardable
  def_delegators :root, :left, :right, :data, :insert, :to_array
  def_delegators :to_array, :each

  VERSION = 1

  attr_reader :root

  def initialize(initial_value)
    @root = Node.new initial_value
  end
end