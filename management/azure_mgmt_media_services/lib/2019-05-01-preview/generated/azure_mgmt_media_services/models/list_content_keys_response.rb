# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2019_05_01_preview
  module Models
    #
    # Class of response for listContentKeys action
    #
    class ListContentKeysResponse

      include MsRestAzure

      # @return [Array<StreamingLocatorContentKey>] ContentKeys used by current
      # Streaming Locator
      attr_accessor :content_keys


      #
      # Mapper for ListContentKeysResponse class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ListContentKeysResponse',
          type: {
            name: 'Composite',
            class_name: 'ListContentKeysResponse',
            model_properties: {
              content_keys: {
                client_side_validation: true,
                required: false,
                serialized_name: 'contentKeys',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StreamingLocatorContentKeyElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'StreamingLocatorContentKey'
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
