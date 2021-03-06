# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::CognitiveServices::NewsSearch::V1_0
  module Models
    #
    # Model object.
    #
    #
    class TrendingTopics < Answer

      include MsRestAzure


      def initialize
        @_type = "TrendingTopics"
      end

      attr_accessor :_type

      # @return [Array<NewsTopic>] A list of trending news topics on Bing
      attr_accessor :value


      #
      # Mapper for TrendingTopics class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'TrendingTopics',
          type: {
            name: 'Composite',
            class_name: 'TrendingTopics',
            model_properties: {
              _type: {
                client_side_validation: true,
                required: true,
                serialized_name: '_type',
                type: {
                  name: 'String'
                }
              },
              id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              web_search_url: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'webSearchUrl',
                type: {
                  name: 'String'
                }
              },
              follow_up_queries: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'followUpQueries',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'QueryElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'Query'
                      }
                  }
                }
              },
              value: {
                client_side_validation: true,
                required: true,
                serialized_name: 'value',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'NewsTopicElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'NewsTopic'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
