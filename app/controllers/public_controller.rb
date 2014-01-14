class PublicController < ApplicationController
  
  def index
  end
  
  def services
  end
  
  def contact
    @email = params[:email] if params[:email]
    @message = params[:msg] if params[:msg]
    @name = params[:name] if params[:name]
    if request.post?    
      unless (@email.blank? or @name.blank? or @message.blank?)
        if emails_are_valid?(@email)
          if Notification.deliver_enquiry_notification(@email, @name, @message)
           flash[:notice] = "Thanks, #{@name} for your enquiry. We will get back to you as soon as possible"
           redirect_to :action => :contact, :anchor => 'errorExplanation'
          end
        else
          flash.now[:notice] = "Given email address doesn't appear to be valid"
          render :action => :contact, :anchor => 'errorExplanation'
        end
      else
        flash.now[:notice] = "Please, enter details in all fields"
        render :action => :contact, :anchor => 'errorExplanation'
      end
    end
  end
      
  def database
  end
      
  def framework
  end
      
  def profile
  end
      
  def agile
  end
      
  def portfolio
  end

  def rails
  end
      
  def vb
  end
      
  private

  def emails_are_valid?(emails)
       regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
       !!emails.match(regex)
  end
      
end
