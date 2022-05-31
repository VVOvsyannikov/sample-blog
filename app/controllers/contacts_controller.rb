class ContactsController < ApplicationController
  def all
    @contacts = Contact.all
  end

  def new; end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_all_path
    else
      render action: 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
