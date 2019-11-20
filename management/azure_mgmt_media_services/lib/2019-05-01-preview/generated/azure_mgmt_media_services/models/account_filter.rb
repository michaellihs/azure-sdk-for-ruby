# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2019_05_01_preview
  module Models
    #
    # An Account Filter.
    #
    class AccountFilter < ProxyResource

      include MsRestAzure

      # @return [PresentationTimeRange] The presentation time range.
      attr_accessor :presentation_time_range

      # @return [FirstQuality] The first quality.
      attr_accessor :first_quality

      # @return [Array<FilterTrackSelection>] The tracks selection conditions.
      attr_accessor :tracks


      #
      # Mapper for AccountFilter class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'AccountFilter',
          type: {
            name: 'Composite',
            class_name: 'AccountFilter',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'name',
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
                  name: 'String'
                }
              },
              presentation_time_range: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.presentationTimeRange',
                type: {
                  name: 'Composite',
                  class_name: 'PresentationTimeRange'
                }
              },
              first_quality: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.firstQuality',
                type: {
                  name: 'Composite',
                  class_name: 'FirstQuality'
                }
              },
              tracks: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.tracks',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'FilterTrackSelectionElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'FilterTrackSelection'
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
