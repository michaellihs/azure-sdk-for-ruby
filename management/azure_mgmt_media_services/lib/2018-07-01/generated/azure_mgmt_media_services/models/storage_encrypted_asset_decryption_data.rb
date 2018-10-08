# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2018_07_01
  module Models
    #
    # Data needed to decrypt asset files encrypted with legacy storage
    # encryption.
    #
    class StorageEncryptedAssetDecryptionData

      include MsRestAzure

      # @return [Array<Integer>] The Asset File storage encryption key.
      attr_accessor :key

      # @return [Array<AssetFileEncryptionMetadata>] Asset File encryption
      # metadata.
      attr_accessor :asset_file_encryption_metadata


      #
      # Mapper for StorageEncryptedAssetDecryptionData class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'StorageEncryptedAssetDecryptionData',
          type: {
            name: 'Composite',
            class_name: 'StorageEncryptedAssetDecryptionData',
            model_properties: {
              key: {
                client_side_validation: true,
                required: false,
                serialized_name: 'key',
                type: {
                  name: 'ByteArray'
                }
              },
              asset_file_encryption_metadata: {
                client_side_validation: true,
                required: false,
                serialized_name: 'assetFileEncryptionMetadata',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'AssetFileEncryptionMetadataElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'AssetFileEncryptionMetadata'
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
