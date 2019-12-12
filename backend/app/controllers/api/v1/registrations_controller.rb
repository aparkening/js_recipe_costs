class Api::V1::RegistrationsController < Devise::SessionsController
  respond_to :json

  # Add additional functionality to Devise default new registration
  def create
    begin
      super
    rescue ActiveRecord::RecordInvalid => e
      render_resource(e.record)
    rescue ActiveRecord::RecordNotUnique => e
      err = OpenStruct.new(errors: { user: 'Already Exists' })
      validation_error(err)
    end
  end

end
