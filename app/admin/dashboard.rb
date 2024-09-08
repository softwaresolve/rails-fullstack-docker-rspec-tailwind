# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    h3 'Upload de CSVs', class: 'self-center text-center'
    columns do
      column do
        panel I18n.t('active_admin.criterions') do
          form action: admin_dashboard_import_criterions_path,
               multipart: true,
               enctype: 'multipart/form-data',
               method: :post do |f|
            f.input name: 'authenticity_token', type: :hidden, value: form_authenticity_token.to_s
            f.input type: :file, name: 'file', accept: 'text/csv', as: :file, required: true
            f.input type: :submit, value: 'Importar'
          end
        end
      end
      column do
        panel I18n.t('active_admin.units') do
          form action: admin_dashboard_import_criterions_path,
               multipart: true,
               enctype: 'multipart/form-data',
               method: :post do |f|
            f.input name: 'authenticity_token', type: :hidden, value: form_authenticity_token.to_s
            f.input type: :file, name: 'file', accept: 'text/csv', as: :file, required: true
            f.input type: :submit
          end
        end
      end
    end
  end

  page_action :import_criterions, method: :post do
    total_rows = ::CriterionsImporter.import_csv(data: File.read(params[:file].path))
    flash[:success] = "Total de #{total_rows} linhas importadas"

    redirect_to admin_dashboard_path
  end

  page_action :import_building_units, method: :post do
    redirect_to admin_dashboard_path
  end
end
# rubocop:enable Metrics/BlockLength
