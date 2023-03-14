require 'swagger_helper'

describe 'Cars API' do
    path '/api/v1/cars' do

        post 'Creates new car' do
            tags 'Cars'
            consumes 'application/json', 'application/xml'
            parameter name: :car, in: :body, schema: {
                type: :object,
                properties: {
                    name: {type: :string},
                    description: {type: :string},
                    price: {type: :number, format: :float},
                    duration: {type: :integer},
                    imgurl: {type: :string},
                    brand: {type: :string}
                },
                required: [ 'name', 'description', 'price', 'duration', 'imgurl', 'brand' ]
            }

            response '201', 'Car created successfully' do
                let(:car) { {
                    name: "Mehran",
                    description: "Affordable car",
                    price: 1500,
                    duration: 3,
                    imgurl: "https://cache2.pakwheels.com/system/car_generation_pictures/2873/original/Suzuki_Mehran_2012.jpg?1444111663",
                    brand: "Suzuki"
                } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:car){{
                    name: 'Mehran'
                }}
                run_test!
            end
        end

        get 'Retrieves all cars' do
            tags 'Cars'
            produces 'application/json'
            parameter name: :car, in: :body, type: :string

            response '200', 'List of cars found' do
                run_test!
            end
        end
    end

    path '/api/v1/cars/{id}' do
        get 'Retrieves a car' do
            tags 'Cars'
            produces 'application/json'
            parameter name: :id, in: :path, type: :string

            response '200', 'car found' do
                let(:id) {create(:car).id}
                run_test!
            end

            response '404', 'car not found' do
                let(:id) {'invalid'}
                run_test!
            end
        end

        delete 'Deletes a car' do
            tags 'Cars'
            produces 'application/json'
            parameter name: :id, in: :path, type: :string

            response '204', 'Car deleted successfully' do
                let(:id) {create(:car).id}
                run_test!
            end
            response '404', 'car not found' do
                let(:id) {'invalid'}
                run_test!
            end
        end
    end
end