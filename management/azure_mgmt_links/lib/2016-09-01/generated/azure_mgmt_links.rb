# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require 'uri'
require 'cgi'
require 'date'
require 'json'
require 'base64'
require 'erb'
require 'securerandom'
require 'time'
require 'timeliness'
require 'faraday'
require 'faraday-cookie_jar'
require 'concurrent'
require 'ms_rest'
require '2016-09-01/generated/azure_mgmt_links/module_definition'
require 'ms_rest_azure'

module Azure::Links::Mgmt::V2016_09_01
  autoload :Operations,                                         '2016-09-01/generated/azure_mgmt_links/operations.rb'
  autoload :ResourceLinks,                                      '2016-09-01/generated/azure_mgmt_links/resource_links.rb'
  autoload :ManagementLinkClient,                               '2016-09-01/generated/azure_mgmt_links/management_link_client.rb'

  module Models
    autoload :ResourceLinkResult,                                 '2016-09-01/generated/azure_mgmt_links/models/resource_link_result.rb'
    autoload :OperationDisplay,                                   '2016-09-01/generated/azure_mgmt_links/models/operation_display.rb'
    autoload :ResourceLinkProperties,                             '2016-09-01/generated/azure_mgmt_links/models/resource_link_properties.rb'
    autoload :Operation,                                          '2016-09-01/generated/azure_mgmt_links/models/operation.rb'
    autoload :ResourceLinkFilter,                                 '2016-09-01/generated/azure_mgmt_links/models/resource_link_filter.rb'
    autoload :OperationListResult,                                '2016-09-01/generated/azure_mgmt_links/models/operation_list_result.rb'
    autoload :ResourceLink,                                       '2016-09-01/generated/azure_mgmt_links/models/resource_link.rb'
    autoload :Filter,                                             '2016-09-01/generated/azure_mgmt_links/models/filter.rb'
  end
end
