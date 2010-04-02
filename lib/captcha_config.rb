Captcha::Config.new(
  # Used for filename cipher
  :password => 'something-unique',
  # Captcha colors
  :colors => {
    :background => '#FFFFFF',
    :font => '#080288'
  },
  # Number of captcha images to generate
  :count => RAILS_ENV == 'production' ? 500 : 10,
  # Where to write captchas
  :destination => "#{RAILS_ROOT}/public/images/captchas",
  # Generate new batch every day
  :generate_every => 24 * 60 * 60
)
