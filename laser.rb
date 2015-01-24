class Laser
  def initialize(window, x, y, angle)
    @image = Gosu::Image.new(window, "laser.png", false)
    Gosu::Sample.new(window, "pew.mp3").play(0.5)
    @x = x
    @y = y
    @angle = angle
    speed = 25
    @vel_x = Gosu::offset_x(angle, speed)
    @vel_y = Gosu::offset_y(angle, speed)
  end

  def move
    @x += @vel_x
    @y += @vel_y
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end