# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2019_05_01_preview
  module Models
    #
    # Describes the settings to produce a PNG image from the input video.
    #
    class PngLayer < Layer

      include MsRestAzure


      def initialize
        @odatatype = "#Microsoft.Media.PngLayer"
      end

      attr_accessor :odatatype


      #
      # Mapper for PngLayer class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: '#Microsoft.Media.PngLayer',
          type: {
            name: 'Composite',
            class_name: 'PngLayer',
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
              }
            }
          }
        }
      end
    end
  end
end
