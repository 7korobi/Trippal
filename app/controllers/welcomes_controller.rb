class WelcomesController < ApplicationController
  expose(:welcomes){ Welcome.all }
  expose(:welcome)
  
  def landing
  end

  def thanks
  end

  def create
    if welcome.save
      redirect_to action: 'thanks'
    else
      redirect_to action: 'thanks'
    end
    WelcomeMailer.coming_soon(welcome).deliver
  end

  private
end

