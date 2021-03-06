# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::BotService::Mgmt::V2017_12_01_preview
  module Models
    #
    # The parameters to provide for the Microsoft Teams channel.
    #
    class SkypeChannelProperties

      include MsRestAzure

      # @return [Boolean] Enable messaging for Skype channel
      attr_accessor :enable_messaging

      # @return [Boolean] Enable media cards for Skype channel
      attr_accessor :enable_media_cards

      # @return [Boolean] Enable video for Skype channel
      attr_accessor :enable_video

      # @return [Boolean] Enable calling for Skype channel
      attr_accessor :enable_calling

      # @return [Boolean] Enable screen sharing for Skype channel
      attr_accessor :enable_screen_sharing

      # @return [Boolean] Enable groups for Skype channel
      attr_accessor :enable_groups

      # @return [String] Group mode for Skype channel
      attr_accessor :groups_mode

      # @return [String] Calling web hook for Skype channel
      attr_accessor :calling_web_hook

      # @return [Boolean] Whether this channel is enabled for the bot
      attr_accessor :is_enabled


      #
      # Mapper for SkypeChannelProperties class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'SkypeChannelProperties',
          type: {
            name: 'Composite',
            class_name: 'SkypeChannelProperties',
            model_properties: {
              enable_messaging: {
                client_side_validation: true,
                required: false,
                serialized_name: 'enableMessaging',
                type: {
                  name: 'Boolean'
                }
              },
              enable_media_cards: {
                client_side_validation: true,
                required: false,
                serialized_name: 'enableMediaCards',
                type: {
                  name: 'Boolean'
                }
              },
              enable_video: {
                client_side_validation: true,
                required: false,
                serialized_name: 'enableVideo',
                type: {
                  name: 'Boolean'
                }
              },
              enable_calling: {
                client_side_validation: true,
                required: false,
                serialized_name: 'enableCalling',
                type: {
                  name: 'Boolean'
                }
              },
              enable_screen_sharing: {
                client_side_validation: true,
                required: false,
                serialized_name: 'enableScreenSharing',
                type: {
                  name: 'Boolean'
                }
              },
              enable_groups: {
                client_side_validation: true,
                required: false,
                serialized_name: 'enableGroups',
                type: {
                  name: 'Boolean'
                }
              },
              groups_mode: {
                client_side_validation: true,
                required: false,
                serialized_name: 'groupsMode',
                type: {
                  name: 'String'
                }
              },
              calling_web_hook: {
                client_side_validation: true,
                required: false,
                serialized_name: 'callingWebHook',
                type: {
                  name: 'String'
                }
              },
              is_enabled: {
                client_side_validation: true,
                required: true,
                serialized_name: 'isEnabled',
                type: {
                  name: 'Boolean'
                }
              }
            }
          }
        }
      end
    end
  end
end
