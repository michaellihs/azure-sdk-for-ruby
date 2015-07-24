# Code generated by Microsoft (R) AutoRest Code Generator 0.11.0.0
# Changes may cause incorrect behavior and will be lost if the code is


module Azure::ARM::Resources
  #
  # DeploymentOperations
  #
  class DeploymentOperations
    #
    # Creates and initializes a new instance of the DeploymentOperations class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return reference to the ResourceManagementClient
    attr_reader :client

    #
    # Get a list of deployments operations.
    # @param resource_group_name1 [String] The name of the resource group. The
    # name is case insensitive.
    # @param deployment_name1 [String] The name of the deployment.
    # @param operation_id1 [String] Operation Id.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def get(resource_group_name1, deployment_name1, operation_id1, custom_headers = nil)
      fail ArgumentError, 'resource_group_name1 is nil' if resource_group_name1.nil?
      fail ArgumentError, 'deployment_name1 is nil' if deployment_name1.nil?
      fail ArgumentError, 'operation_id1 is nil' if operation_id1.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      # Construct URL
      path = "/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/deployments/{deploymentName}/operations/{operationId}"
      path['{resourceGroupName}'] = ERB::Util.url_encode(resource_group_name1)
      path['{deploymentName}'] = ERB::Util.url_encode(deployment_name1)
      path['{operationId}'] = ERB::Util.url_encode(operation_id1)
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
              parsed_response = Azure::ARM::Resources::Models::DeploymentOperation.deserialize_object(parsed_response)
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
    # Gets a list of deployments operations.
    # @param resource_group_name1 [String] The name of the resource group. The
    # name is case insensitive.
    # @param deployment_name1 [String] The name of the deployment.
    # @param top1 [Integer] Query parameters.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def list(resource_group_name1, deployment_name1, top1 = nil, custom_headers = nil)
      fail ArgumentError, 'resource_group_name1 is nil' if resource_group_name1.nil?
      fail ArgumentError, 'deployment_name1 is nil' if deployment_name1.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      # Construct URL
      path = "/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/deployments/{deploymentName}/operations"
      path['{resourceGroupName}'] = ERB::Util.url_encode(resource_group_name1)
      path['{deploymentName}'] = ERB::Util.url_encode(deployment_name1)
      path['{subscriptionId}'] = ERB::Util.url_encode(@client.subscription_id)
      url = URI.join(@client.base_url, path)
      properties = {}
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
              parsed_response = Azure::ARM::Resources::Models::DeploymentOperationsListResult.deserialize_object(parsed_response)
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
    # Gets a list of deployments operations.
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
              parsed_response = Azure::ARM::Resources::Models::DeploymentOperationsListResult.deserialize_object(parsed_response)
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
