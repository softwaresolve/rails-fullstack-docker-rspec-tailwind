# frozen_string_literal: true

Grover.configure do |config|
  config.use_png_middleware = true
  config.use_jpeg_middleware = true
  config.use_pdf_middleware = false
  # config.options.executable_path = ENV['PUPPETEER_EXECUTABLE_PATH']
  # config.options.launch_args = ['--no-sandbox', '--disable-dev-shm-usage']
  config.options = {
    launch_args: ['--no-sandbox', '--disable-dev-shm-usage']
    # root_path: '/home/user/app'
  }
end
