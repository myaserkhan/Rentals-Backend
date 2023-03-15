require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/users' do
    post 'Creates new user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string }
        },
        required: %w[name email]
      }

      response '201', 'User created successfully' do
        let(:user) do
          {
            name: 'Sajeel',
            email: 'sajeelzafar1995@gmail.com'
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) do
          {
            name: 'Sajeel'
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'user found' do
        let(:id) { create(:user).id }
        run_test!
      end

      response '404', 'Please enter correct username' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
