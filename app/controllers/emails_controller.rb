class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(
      object: Faker::Company.buzzword,
      body: Faker::Lorem.paragraphs)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
      if @email.save
        flash[:notice] = "Email created"
        
      else
        redirect_to root_path
        flash[:notice] = "Please try again"
      end
    end
  end

end
