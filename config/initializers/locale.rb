# frozen_string_literal: true

# Permitted locales available for the application
I18n.available_locales = ['pt-BR']
I18n.default_locale = 'pt-BR'
I18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml')]
I18n.locale = 'pt-BR'

I18n.reload!
