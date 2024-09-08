# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  CURRENT_RESOURCE_ACTIVE_KLASS = [
    'group flex items-center gap-2 rounded-lg border border-teal-100',
    'bg-teal-50 px-2.5 text-sm font-medium text-gray-900',
    'dark:border-transparent dark:bg-gray-700/75 dark:text-white'
  ].freeze

  RESOURCE_KLASS = [
    'group flex items-center gap-2 rounded-lg border border-transparent px-2.5',
    'text-sm font-medium text-gray-800 hover:bg-teal-50 hover:text-gray-900',
    'active:border-teal-100 dark:text-gray-200 dark:hover:bg-gray-700/75',
    'dark:hover:text-white dark:active:border-gray-600'
  ].freeze

  def current_page_klass(controller, action)
    actions = action.is_a?(Array) ? action : [action]
    currents = actions.select { |page| current_page?(controller:, action: page) }
    return CURRENT_RESOURCE_ACTIVE_KLASS.join(' ') if currents.count.positive?

    RESOURCE_KLASS.join(' ')
  end

  def pdf_image_tag(image, options = {})
    options[:src] = rails_blob_path(image, only_path: false)
    tag(:img, options)
  end

  def wicked_blob_path(active_storage_attachment)
    service = active_storage_attachment.service
    service_name = service.class.name
    case service_name
    when 'ActiveStorage::Service::DiskService'
      service.path_for(active_storage_attachment.blob.key)
    when 'ActiveStorage::Service::S3Service'
      active_storage_attachment.url
    else
      raise "Unsupported ActiveStorage service for WickedPDF integration: #{service_name}"
    end
  end
end
