# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2019_05_01_preview
  module Models
    #
    # Specifies the clip time as an absolute time position in the media file.
    # The absolute time can point to a different position depending on whether
    # the media file starts from a timestamp of zero or not.
    #
    class AbsoluteClipTime < ClipTime

      include MsRestAzure


      def initialize
        @odatatype = "#Microsoft.Media.AbsoluteClipTime"
      end

      attr_accessor :odatatype

      # @return [Duration] The time position on the timeline of the input
      # media. It is usually specified as an ISO8601 period. e.g PT30S for 30
      # seconds.
      attr_accessor :time


      #
      # Mapper for AbsoluteClipTime class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: '#Microsoft.Media.AbsoluteClipTime',
          type: {
            name: 'Composite',
            class_name: 'AbsoluteClipTime',
            model_properties: {
              odatatype: {
                client_side_validation: true,
                required: true,
                serialized_name: '@odata\\.type',
                type: {
                  name: 'String'
                }
              },
              time: {
                client_side_validation: true,
                required: true,
                serialized_name: 'time',
                type: {
                  name: 'TimeSpan'
                }
              }
            }
          }
        }
      end
    end
  end
end
