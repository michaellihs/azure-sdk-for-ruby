# Code generated by Microsoft (R) AutoRest Code Generator 0.11.0.0
# Changes may cause incorrect behavior and will be lost if the code is


module Azure::ARM::Resources
  #
  # ResourceGroups
  #
  class ResourceGroups
    #
    # Creates and initializes a new instance of the ResourceGroups class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return reference to the ResourceManagementClient
    attr_reader :client

    #
    # Get all of the resources under a subscription.
    # @param resource_group_name1 [String] Query parameters. If null is passed
    # returns all resource groups.
    # @param filter1 [GenericResourceFilter] The filter to apply on the operation.
    # @param top1 [Integer] Query parameters. If null is passed returns all
    # resource groups.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def list_resources(resource_group_name1, filter1 = nil, top1 = nil, custom_headers = nil)
      fail ArgumentError, 'resource_group_name1 is nil' if resource_group_name1.nil?
      filter1.validate unless filter1.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      # Construct URL
      path = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/resources"
      path['{resourceGroupName}'] = ERB::Util.url_encode(resource_group_name1)
      path['{subscriptionId}'] = ERB::Util.url_encode(@client.subscription_id)
      url = URI.join(@client.base_url, path)
      properties = {}
      properties['$filter'] = ERB::Util.url_encode(filter1.to_s) unless filter1.nil?
      properties['$top'] = ERB::Util.url_encode(top1.to_s) unless top1.nil?
      properties['api-version'] = ERB::Util.url_encode(@client.api_version.to_s) unless @client.api_version.nil?
      properties.reject!{ |key, value| value.nil? }
      url.query = properties.map{ |key, value| "#{key}=#{value}" }.compact.join('&')
      fail URI::Error unless url.to_s =~ /\A#{URI::regexp}\z/

      # Create HTTP transport objects
      http_request = Net::HTTP::Get.new(url.request_uri)

      # Set Headers
      http_request['x-ms-client-request-id'] = SecureRandom.uuid
      http_request["accept-language"] = @client.accept_language

      unless custom_headers.nil?
        custom_headers.each do |key, value|
          http_request[key] = value
        end
      end

      # Send Request
      promise = Concurrent::Promise.new { @client.make_http_request(http_request, url) }

      promise = promise.then do |http_response|
        status_code = http_response.code.to_i
        response_content = http_response.body
        unless (status_code == 200)
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationException.new(http_request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(http_request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = JSON.load(response_content) unless response_content.to_s.empty?
            if (parsed_response)
              parsed_response = Azure::ARM::Resources::Models::ResourceListResult.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new("Error occured in deserializing the response", e.message, e.backtrace, response_content)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Checks whether resource group exists.
    # @param resource_group_name1 [String] The name of the resource group to
    # check. The name is case insensitive.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def check_existence(resource_group_name1, custom_headers = nil)
      fail ArgumentError, 'resource_group_name1 is nil' if resource_group_name1.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      # Construct URL
      path = "/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}"
      path['{resourceGroupName}'] = ERB::Util.url_encode(resource_group_name1)
      path['{subscriptionId}'] = ERB::Util.url_encode(@client.subscription_id)
      url = URI.join(@client.base_url, path)
      properties = {}
      properties['api-version'] = ERB::Util.url_encode(@client.api_version.to_s) unless @client.api_version.nil?
      properties.reject!{ |key, value| value.nil? }
      url.query = properties.map{ |key, value| "#{key}=#{value}" }.compact.join('&')
      fail URI::Error unless url.to_s =~ /\A#{URI::regexp}\z/

      # Create HTTP transport objects
      http_request = Net::HTTP::Head.new(url.request_uri)

      # Set Headers
      http_request['x-ms-client-request-id'] = SecureRandom.uuid
      http_request["accept-language"] = @client.accept_language

      unless custom_headers.nil?
        custom_headers.each do |key, value|
          http_request[key] = value
        end
      end

      # Send Request
      promise = Concurrent::Promise.new { @client.make_http_request(http_request, url) }

      promise = promise.then do |http_response|
        status_code = http_response.code.to_i
        response_content = http_response.body
        unless (status_code == 404 || status_code == 204)
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationException.new(http_request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(http_request, http_response)
        result.body = (status_code == 204)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Create a resource group.
    # @param resource_group_name1 [String] The name of the resource group to be
    # created or updated.
    # @param parameters1 [ResourceGroup] Parameters supplied to the create or
    # update resource group service operation.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def create_or_update(resource_group_name1, parameters1, custom_headers = nil)
      fail ArgumentError, 'resource_group_name1 is nil' if resource_group_name1.nil?
      fail ArgumentError, 'parameters1 is nil' if parameters1.nil?
      parameters1.validate unless parameters1.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      # Construct URL
      path = "/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}"
      path['{resourceGroupName}'] = ERB::Util.url_encode(resource_group_name1)
      path['{subscriptionId}'] = ERB::Util.url_encode(@client.subscription_id)
      url = URI.join(@client.base_url, path)
      properties = {}
      properties['api-version'] = ERB::Util.url_encode(@client.api_version.to_s) unless @client.api_version.nil?
      properties.reject!{ |key, value| value.nil? }
      url.query = properties.map{ |key, value| "#{key}=#{value}" }.compact.join('&')
      fail URI::Error unless url.to_s =~ /\A#{URI::regexp}\z/

      # Create HTTP transport objects
      http_request = Net::HTTP::Put.new(url.request_uri)

      # Set Headers
      http_request['x-ms-client-request-id'] = SecureRandom.uuid
      http_request["accept-language"] = @client.accept_language

      unless custom_headers.nil?
        custom_headers.each do |key, value|
          http_request[key] = value
        end
      end

      # Serialize Request
      http_request.add_field('Content-Type', 'application/json')
      if (parameters1)
        parameters1 = Azure::ARM::Resources::Models::ResourceGroup.serialize_object(parameters1)
      end
      request_content = parameters1
      http_request.body = JSON.generate(request_content, quirks_mode: true)

      # Send Request
      promise = Concurrent::Promise.new { @client.make_http_request(http_request, url) }

      promise = promise.then do |http_response|
        status_code = http_response.code.to_i
        response_content = http_response.body
        unless (status_code == 201 || status_code == 200)
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationException.new(http_request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(http_request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = JSON.load(response_content) unless response_content.to_s.empty?
            if (parsed_response)
              parsed_response = Azure::ARM::Resources::Models::ResourceGroupExtended.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new("Error occured in deserializing the response", e.message, e.backtrace, response_content)
          end
        end
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = JSON.load(response_content) unless response_content.to_s.empty?
            if (parsed_response)
              parsed_response = Azure::ARM::Resources::Models::ResourceGroupExtended.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new("Error occured in deserializing the response", e.message, e.backtrace, response_content)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Begin deleting resource group.To determine whether the operation has
    # finished processing the request, call GetLongRunningOperationStatus.
    # @param resource_group_name1 [String] The name of the resource group to be
    # deleted. The name is case insensitive.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [TODO: add type] TODO: add text
    #
    def delete(resource_group_name1, custom_headers = nil)
      # Send request
      response = begin_delete(resource_group_name1, custom_headers = nil).value!

      # Defining deserialization method.
      deserialize_method = lambda do |parsed_response|
      end

      # Waiting for response.
      return @client.get_post_or_delete_operation_result(response, nil, deserialize_method)
    end

    #
    # Begin deleting resource group.To determine whether the operation has
    # finished processing the request, call GetLongRunningOperationStatus.
    # @param resource_group_name1 [String] The name of the resource group to be
    # deleted. The name is case insensitive.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def begin_delete(resource_group_name1, custom_headers = nil)
      fail ArgumentError, 'resource_group_name1 is nil' if resource_group_name1.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      # Construct URL
      path = "/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}"
      path['{resourceGroupName}'] = ERB::Util.url_encode(resource_group_name1)
      path['{subscriptionId}'] = ERB::Util.url_encode(@client.subscription_id)
      url = URI.join(@client.base_url, path)
      properties = {}
      properties['api-version'] = ERB::Util.url_encode(@client.api_version.to_s) unless @client.api_version.nil?
      properties.reject!{ |key, value| value.nil? }
      url.query = properties.map{ |key, value| "#{key}=#{value}" }.compact.join('&')
      fail URI::Error unless url.to_s =~ /\A#{URI::regexp}\z/

      # Create HTTP transport objects
      http_request = Net::HTTP::Delete.new(url.request_uri)

      # Set Headers
      http_request['x-ms-client-request-id'] = SecureRandom.uuid
      http_request["accept-language"] = @client.accept_language

      unless custom_headers.nil?
        custom_headers.each do |key, value|
          http_request[key] = value
        end
      end

      # Send Request
      promise = Concurrent::Promise.new { @client.make_http_request(http_request, url) }

      promise = promise.then do |http_response|
        status_code = http_response.code.to_i
        response_content = http_response.body
        unless (status_code == 202 || status_code == 200)
          fail MsRest::HttpOperationException.new(http_request, http_response)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(http_request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Get a resource group.
    # @param resource_group_name1 [String] The name of the resource group to get.
    # The name is case insensitive.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def get(resource_group_name1, custom_headers = nil)
      fail ArgumentError, 'resource_group_name1 is nil' if resource_group_name1.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      # Construct URL
      path = "/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}"
      path['{resourceGroupName}'] = ERB::Util.url_encode(resource_group_name1)
      path['{subscriptionId}'] = ERB::Util.url_encode(@client.subscription_id)
      url = URI.join(@client.base_url, path)
      properties = {}
      properties['api-version'] = ERB::Util.url_encode(@client.api_version.to_s) unless @client.api_version.nil?
      properties.reject!{ |key, value| value.nil? }
      url.query = properties.map{ |key, value| "#{key}=#{value}" }.compact.join('&')
      fail URI::Error unless url.to_s =~ /\A#{URI::regexp}\z/

      # Create HTTP transport objects
      http_request = Net::HTTP::Get.new(url.request_uri)

      # Set Headers
      http_request['x-ms-client-request-id'] = SecureRandom.uuid
      http_request["accept-language"] = @client.accept_language

      unless custom_headers.nil?
        custom_headers.each do |key, value|
          http_request[key] = value
        end
      end

      # Send Request
      promise = Concurrent::Promise.new { @client.make_http_request(http_request, url) }

      promise = promise.then do |http_response|
        status_code = http_response.code.to_i
        response_content = http_response.body
        unless (status_code == 200)
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationException.new(http_request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(http_request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = JSON.load(response_content) unless response_content.to_s.empty?
            if (parsed_response)
              parsed_response = Azure::ARM::Resources::Models::ResourceGroupExtended.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new("Error occured in deserializing the response", e.message, e.backtrace, response_content)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Resource groups can be updated through a simple PATCH operation to a group
    # address. The format of the request is the same as that for creating a
    # resource groups, though if a field is unspecified current value will be
    # carried over.
    # @param resource_group_name1 [String] The name of the resource group to be
    # created or updated. The name is case insensitive.
    # @param parameters1 [ResourceGroup] Parameters supplied to the update state
    # resource group service operation.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def patch(resource_group_name1, parameters1, custom_headers = nil)
      fail ArgumentError, 'resource_group_name1 is nil' if resource_group_name1.nil?
      fail ArgumentError, 'parameters1 is nil' if parameters1.nil?
      parameters1.validate unless parameters1.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      # Construct URL
      path = "/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}"
      path['{resourceGroupName}'] = ERB::Util.url_encode(resource_group_name1)
      path['{subscriptionId}'] = ERB::Util.url_encode(@client.subscription_id)
      url = URI.join(@client.base_url, path)
      properties = {}
      properties['api-version'] = ERB::Util.url_encode(@client.api_version.to_s) unless @client.api_version.nil?
      properties.reject!{ |key, value| value.nil? }
      url.query = properties.map{ |key, value| "#{key}=#{value}" }.compact.join('&')
      fail URI::Error unless url.to_s =~ /\A#{URI::regexp}\z/

      # Create HTTP transport objects
      http_request = Net::HTTP::Patch.new(url.request_uri)

      # Set Headers
      http_request['x-ms-client-request-id'] = SecureRandom.uuid
      http_request["accept-language"] = @client.accept_language

      unless custom_headers.nil?
        custom_headers.each do |key, value|
          http_request[key] = value
        end
      end

      # Serialize Request
      http_request.add_field('Content-Type', 'application/json')
      if (parameters1)
        parameters1 = Azure::ARM::Resources::Models::ResourceGroup.serialize_object(parameters1)
      end
      request_content = parameters1
      http_request.body = JSON.generate(request_content, quirks_mode: true)

      # Send Request
      promise = Concurrent::Promise.new { @client.make_http_request(http_request, url) }

      promise = promise.then do |http_response|
        status_code = http_response.code.to_i
        response_content = http_response.body
        unless (status_code == 200)
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationException.new(http_request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(http_request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = JSON.load(response_content) unless response_content.to_s.empty?
            if (parsed_response)
              parsed_response = Azure::ARM::Resources::Models::ResourceGroupExtended.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new("Error occured in deserializing the response", e.message, e.backtrace, response_content)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets a collection of resource groups.
    # @param filter1 [ResourceGroupExtendedFilter] The filter to apply on the
    # operation.
    # @param top1 [Integer] Query parameters. If null is passed returns all
    # resource groups.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def list(filter1 = nil, top1 = nil, custom_headers = nil)
      filter1.validate unless filter1.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      # Construct URL
      path = "/subscriptions/{subscriptionId}/resourcegroups"
      path['{subscriptionId}'] = ERB::Util.url_encode(@client.subscription_id)
      url = URI.join(@client.base_url, path)
      properties = {}
      properties['$filter'] = ERB::Util.url_encode(filter1.to_s) unless filter1.nil?
      properties['$top'] = ERB::Util.url_encode(top1.to_s) unless top1.nil?
      properties['api-version'] = ERB::Util.url_encode(@client.api_version.to_s) unless @client.api_version.nil?
      properties.reject!{ |key, value| value.nil? }
      url.query = properties.map{ |key, value| "#{key}=#{value}" }.compact.join('&')
      fail URI::Error unless url.to_s =~ /\A#{URI::regexp}\z/

      # Create HTTP transport objects
      http_request = Net::HTTP::Get.new(url.request_uri)

      # Set Headers
      http_request['x-ms-client-request-id'] = SecureRandom.uuid
      http_request["accept-language"] = @client.accept_language

      unless custom_headers.nil?
        custom_headers.each do |key, value|
          http_request[key] = value
        end
      end

      # Send Request
      promise = Concurrent::Promise.new { @client.make_http_request(http_request, url) }

      promise = promise.then do |http_response|
        status_code = http_response.code.to_i
        response_content = http_response.body
        unless (status_code == 200)
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationException.new(http_request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(http_request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = JSON.load(response_content) unless response_content.to_s.empty?
            if (parsed_response)
              parsed_response = Azure::ARM::Resources::Models::ResourceGroupListResult.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new("Error occured in deserializing the response", e.message, e.backtrace, response_content)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Get all of the resources under a subscription.
    # @param next_page_link1 [String] NextLink from the previous successful call
    # to List operation.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def list_resources_next(next_page_link1, custom_headers = nil)
      fail ArgumentError, 'next_page_link1 is nil' if next_page_link1.nil?
      # Construct URL
      path = "{nextLink}"
      path['{nextLink}'] = next_page_link1
      url = URI.parse(path)
      properties = {}
      properties.reject!{ |key, value| value.nil? }
      url.query = properties.map{ |key, value| "#{key}=#{value}" }.compact.join('&')
      fail URI::Error unless url.to_s =~ /\A#{URI::regexp}\z/

      # Create HTTP transport objects
      http_request = Net::HTTP::Get.new(url.request_uri)

      # Set Headers
      http_request['x-ms-client-request-id'] = SecureRandom.uuid
      http_request["accept-language"] = @client.accept_language

      unless custom_headers.nil?
        custom_headers.each do |key, value|
          http_request[key] = value
        end
      end

      # Send Request
      promise = Concurrent::Promise.new { @client.make_http_request(http_request, url) }

      promise = promise.then do |http_response|
        status_code = http_response.code.to_i
        response_content = http_response.body
        unless (status_code == 200)
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationException.new(http_request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(http_request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = JSON.load(response_content) unless response_content.to_s.empty?
            if (parsed_response)
              parsed_response = Azure::ARM::Resources::Models::ResourceListResult.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new("Error occured in deserializing the response", e.message, e.backtrace, response_content)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets a collection of resource groups.
    # @param next_page_link1 [String] NextLink from the previous successful call
    # to List operation.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def list_next(next_page_link1, custom_headers = nil)
      fail ArgumentError, 'next_page_link1 is nil' if next_page_link1.nil?
      # Construct URL
      path = "{nextLink}"
      path['{nextLink}'] = next_page_link1
      url = URI.parse(path)
      properties = {}
      properties.reject!{ |key, value| value.nil? }
      url.query = properties.map{ |key, value| "#{key}=#{value}" }.compact.join('&')
      fail URI::Error unless url.to_s =~ /\A#{URI::regexp}\z/

      # Create HTTP transport objects
      http_request = Net::HTTP::Get.new(url.request_uri)

      # Set Headers
      http_request['x-ms-client-request-id'] = SecureRandom.uuid
      http_request["accept-language"] = @client.accept_language

      unless custom_headers.nil?
        custom_headers.each do |key, value|
          http_request[key] = value
        end
      end

      # Send Request
      promise = Concurrent::Promise.new { @client.make_http_request(http_request, url) }

      promise = promise.then do |http_response|
        status_code = http_response.code.to_i
        response_content = http_response.body
        unless (status_code == 200)
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationException.new(http_request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(http_request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = JSON.load(response_content) unless response_content.to_s.empty?
            if (parsed_response)
              parsed_response = Azure::ARM::Resources::Models::ResourceGroupListResult.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new("Error occured in deserializing the response", e.message, e.backtrace, response_content)
          end
        end

        result
      end

      promise.execute
    end

  end
end
