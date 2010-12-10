# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_demo_cart_session',
  :secret      => '55a601a8a0bf18ddb62eae9ce44b9da7ca5df0c9dcace73fe06a916d4eee05b6730af1673a444929c1f81cc5b6686a159ca9d4b7b620f96cdca33df6b5a02dbf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
