# Controler da versao padrao atual da API
class Api::V2::ContactsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = current_api_user.contacts.sorted(:name, :asc)

    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = current_api_user.contacts.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: api_contact_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = current_api_user.contacts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :cpf, :telephone, :address, :cep, :pos)
    end
end
