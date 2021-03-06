class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email.status = true
    @email.save
    respond_to do |f|
      f.html { redirect_to email_path(email.id)}
      f.js {}
    end
  end

  def update
    @email= Email.find(params[:id])
    @email.update(email_params)
    respond_to do |f|
      f.html {redirect_to root_path}
      f.js {}
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |f|
      f.html {redirect_to root_path}
      f.js {}
    end
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

  private

  def email_params
    params.permit(:object, :body, :status, :id)
  end
end
