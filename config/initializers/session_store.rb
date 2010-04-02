# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_funerals_session',
  :secret      => '7f92149489395381fa2fe634daa35c8149b72bcacce310f36f7ec56bb8b7a0724e4aa09c879a63b37c3018e382e3d17e62f624772cf0d782ddb70a0b1ff6466c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
