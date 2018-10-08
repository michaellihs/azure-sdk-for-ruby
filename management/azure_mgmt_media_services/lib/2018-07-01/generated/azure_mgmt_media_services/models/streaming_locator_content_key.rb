# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2018_07_01
  module Models
    #
    # Class for content key in Streaming Locator
    #
    class StreamingLocatorContentKey

      include MsRestAzure

      # @return ID of Content Key
      attr_accessor :id

      # @return [StreamingLocatorContentKeyType] Encryption type of Content
      # Key. Possible values include: 'CommonEncryptionCenc',
      # 'CommonEncryptionCbcs', 'EnvelopeEncryption'
      attr_accessor :type

      # @return [String] Label of Content Key as specified in the Streaming
      # Policy
      attr_accessor :label_reference_in_streaming_policy

      # @return [String] Value of  of Content Key
      attr_accessor :value

      # @return [String] ContentKeyPolicy used by Content Key
      attr_accessor :policy_name

      # @return [Array<TrackSelection>] Tracks which use this Content Key
      attr_accessor :tracks


      #
      # Mapper for StreamingLocatorContentKey class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'StreamingLocatorContentKey',
          type: {
            name: 'Composite',
            class_name: 'StreamingLocatorContentKey',
            model_properties: {
              id: {
                client_side_validation: true,
                required: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'type',
                type: {
                  name: 'Enum',
                  module: 'StreamingLocatorContentKeyType'
                }
              },
              label_reference_in_streaming_policy: {
                client_side_validation: true,
                required: false,
                serialized_name: 'labelReferenceInStreamingPolicy',
                type: {
                  name: 'String'
                }
              },
              value: {
                client_side_validation: true,
                required: false,
                serialized_name: 'value',
                type: {
                  name: 'String'
                }
              },
              policy_name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'policyName',
                type: {
                  name: 'String'
                }
              },
              tracks: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'tracks',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'TrackSelectionElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'TrackSelection'
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
