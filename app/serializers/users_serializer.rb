class UsersSerializer < ActiveModel::Serializer
  attributes  :id, :name, :surname, :email
end
