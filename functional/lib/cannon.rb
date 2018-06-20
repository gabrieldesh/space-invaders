require 'gosu'
require_relative 'image_component'

module Cannon
  include ImageComponent

  attr_accessor :x

  STEP_MOVEMENT = 5
  MARGIN_BOTTOM = 100
  
  def new(window)
    ImageComponent.new window, "assets/cannon.png"
    width = ImageComponent.width(window)
    x = window.width / 2 - width / 2
    height = ImageComponent.height(window)
    y = window.height - MARGIN_BOTTOM
  end
  module_function :new

  def update 
    if left_key_pressed?
      move_left
    end
    if right_key_pressed?
      move_right
    end
  end

 private
  def left_key_pressed?
    Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
  end

  def right_key_pressed?
    Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
  end

  def move_left
    if @x > 0
      move :left, STEP_MOVEMENT
    end
  end

  def move_right
    if @x < @window.width - width
      move :right, STEP_MOVEMENT
    end
  end
end