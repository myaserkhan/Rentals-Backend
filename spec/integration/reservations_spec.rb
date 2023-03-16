require 'swagger_helper'
# rubocop: disable Metrics/BlockLength
describe 'Reservations API' do
  path '/api/v1/users/{user_id}/reservations' do
    post 'New reservation' do
      tags 'Reservations'
      consumes 'application/json', 'application/xml'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          city_name: { type: :string }, car_id: { type: :integer },
          date: { type: :string, format: :date, description: 'The date field is in YYYY-MM-DD format' }
        },
        required: %w[city_name date car_id]
      }

      response '201', 'Reservation created successfully' do
        let(:user_id) { '1' }
        let(:reservation) do
          {
            city_name: 'Lahore', date: '2023-11-03', car_id: 5
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user_id) { '1' }
        let(:reservation) do
          {
            city_name: 'Lahore'
          }
        end
        run_test!
      end
    end

    get 'Retrieves all reservations' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response '200', 'List of reservations found' do
        let(:user_id) { '1' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations/{id}' do
    get 'Retrieves a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      let(:user_id) { '1' }

      response '200', 'Reservation found' do
        let(:id) { create(:reservation).id }
        run_test!
      end

      response '404', 'Reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Deletes a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      let(:user_id) { '1' }

      response '204', 'Reservation deleted successfully' do
        let(:id) { create(:reservation).id }
        run_test!
      end

      response '404', 'Reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
# rubocop: enable Metrics/BlockLength
