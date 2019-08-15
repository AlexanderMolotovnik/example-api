class UserSerializer < ActiveModel::Serializer
  attributes  :id, :name, :surname, :email, :token, :full_name, :phone_number

  def full_name
    "#{object.name} #{object.surname}"
  end
end
