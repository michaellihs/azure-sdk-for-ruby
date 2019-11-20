# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2019_05_01_preview
  module Models
    #
    # Describes the settings to produce a JPEG image from the input video.
    #
    class JpgLayer < Layer

      include MsRestAzure


      def initialize
        @odatatype = "#Microsoft.Media.JpgLayer"
      end

      attr_accessor :odatatype

      # @return [Integer] The compression quality of the JPEG output. Range is
      # from 0-100 and the default is 70.
      attr_accessor :quality


      #
      # Mapper for JpgLayer class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: '#Microsoft.Media.JpgLayer',
          type: {
            name: 'Composite',
            class_name: 'JpgLayer',
            model_properties: {
              width: {
                client_side_validation: true,
                required: false,
                serialized_name: 'width',
                type: {
                  name: 'String'
                }
              },
              height: {
                client_side_validation: true,
                required: false,
                serialized_name: 'height',
                type: {
                  name: 'String'
                }
              },
              label: {
                client_side_validation: true,
                required: false,
                serialized_name: 'label',
                type: {
                  name: 'String'
                }
              },
              odatatype: {
                client_side_validation: true,
                required: true,
                serialized_name: '@odata\\.type',
                type: {
                  name: 'String'
                }
              },
              quality: {
                client_side_validation: true,
                required: false,
                serialized_name: 'quality',
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end
