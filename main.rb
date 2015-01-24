require 'gosu'
require_relative 'player'
require_relative 'laser'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "Stars Beyond Our Sky - v0.1"

    @background_image = Gosu::Image.new(self, "space.png", true)

    @player = Player.new(self)
    @player.warp(320, 240)
    @lasers = []
  end

  def update
    if button_down? Gosu::KbA or button_down? Gosu::KbLeft then
      @player.turn_left
    end
    if button_down? Gosu::KbD or button_down? Gosu::KbRight then
      @player.turn_right
    end
    if button_down? Gosu::KbW or button_down? Gosu::KbUp then
      @player.accelerate
    end
    @player.move
    @lasers.each do |laser|
      laser.move
    end
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0);
    @lasers.each do |laser|
      laser.draw
    end
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
    if id == Gosu::KbSpace then 
      @lasers << Laser.new(self,
                           @player.x + Gosu::offset_x(@player.angle+90, 25),
                           @player.y + Gosu::offset_y(@player.angle+90, 25), 
                           @player.angle)
    end
  end
end


window = GameWindow.new
window.show