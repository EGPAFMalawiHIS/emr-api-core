require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/api/v1/users' do
    get 'Get all non-retired Users' do
      tags 'Users'
      produces 'application/json'
      parameter name: :q, in: :query, type: :string, description: 'Query parameter'

      response '200', 'Success' do
        let(:q) { 'admin' }

        schema type: :object, properties: {
          results: {
            type: :array,
            items: {
              type: :object,
              properties: {
                uuid: { type: :string },
                display: { type: :string },
                username: { type: :string },
                systemId: { type: :string },
                person: {
                  type: :object,
                  properties: {
                    uuid: { type: :string },
                    display: { type: :string },
                    links: {
                      type: :array,
                      items: {
                        type: :object,
                        properties: {
                          rel: { type: :string },
                          uri: { type: :string }
                        },
                        required: ['rel', 'uri']
                      }
                    }
                  },
                  required: ['uuid', 'display', 'links']
                },
                privileges: { type: :array },
                roles: {
                  type: :array,
                  items: {
                    type: :object,
                    properties: {
                      uuid: { type: :string },
                      display: { type: :string },
                      links: {
                        type: :array,
                        items: {
                          type: :object,
                          properties: {
                            rel: { type: :string },
                            uri: { type: :string }
                          },
                          required: ['rel', 'uri']
                        }
                      }
                    },
                    required: ['uuid', 'display', 'links']
                  }
                },
                retired: { type: :boolean },
                links: {
                  type: :array,
                  items: {
                    type: :object,
                    properties: {
                      rel: { type: :string },
                      uri: { type: :string }
                    },
                    required: ['rel', 'uri']
                  }
                },
                resourceVersion: { type: :string }
              },
              required: ['uuid', 'display', 'username', 'systemId', 'person', 'privileges', 'roles', 'retired', 'links', 'resourceVersion']
            }
          }
        }, required: ['results']

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['results'].size).to eq(1)
          expect(data['results'][0]['username']).to eq('admin')
          expect(data['results'][0]['retired']).to be_falsey
          # Add more assertions as needed
        end
      end
    end
  end
end
