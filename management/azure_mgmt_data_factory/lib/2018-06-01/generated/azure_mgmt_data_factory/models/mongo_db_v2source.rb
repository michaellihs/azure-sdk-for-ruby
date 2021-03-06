# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::DataFactory::Mgmt::V2018_06_01
  module Models
    #
    # A copy activity source for a MongoDB database.
    #
    class MongoDbV2Source < CopySource

      include MsRestAzure


      def initialize
        @type = "MongoDbV2Source"
      end

      attr_accessor :type

      # @return Specifies selection filter using query operators. To return all
      # documents in a collection, omit this parameter or pass an empty
      # document ({}). Type: string (or Expression with resultType string).
      attr_accessor :filter

      # @return [MongoDbCursorMethodsProperties] Cursor methods for Mongodb
      # query
      attr_accessor :cursor_methods

      # @return Specifies the number of documents to return in each batch of
      # the response from MongoDB instance. In most cases, modifying the batch
      # size will not affect the user or the application. This property�s main
      # purpose is to avoid hit the limitation of response size. Type: integer
      # (or Expression with resultType integer).
      attr_accessor :batch_size


      #
      # Mapper for MongoDbV2Source class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'MongoDbV2Source',
          type: {
            name: 'Composite',
            class_name: 'MongoDbV2Source',
            model_properties: {
              additional_properties: {
                client_side_validation: true,
                required: false,
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ObjectElementType',
                      type: {
                        name: 'Object'
                      }
                  }
                }
              },
              source_retry_count: {
                client_side_validation: true,
                required: false,
                serialized_name: 'sourceRetryCount',
                type: {
                  name: 'Object'
                }
              },
              source_retry_wait: {
                client_side_validation: true,
                required: false,
                serialized_name: 'sourceRetryWait',
                type: {
                  name: 'Object'
                }
              },
              max_concurrent_connections: {
                client_side_validation: true,
                required: false,
                serialized_name: 'maxConcurrentConnections',
                type: {
                  name: 'Object'
                }
              },
              type: {
                client_side_validation: true,
                required: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              filter: {
                client_side_validation: true,
                required: false,
                serialized_name: 'filter',
                type: {
                  name: 'Object'
                }
              },
              cursor_methods: {
                client_side_validation: true,
                required: false,
                serialized_name: 'cursorMethods',
                type: {
                  name: 'Composite',
                  class_name: 'MongoDbCursorMethodsProperties'
                }
              },
              batch_size: {
                client_side_validation: true,
                required: false,
                serialized_name: 'batchSize',
                type: {
                  name: 'Object'
                }
              }
            }
          }
        }
      end
    end
  end
end
