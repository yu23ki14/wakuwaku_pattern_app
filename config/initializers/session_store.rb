# Be sure to restart your server when you modify this file.
Rails.application.config.session_store :cookie_store, key: '_patternapp_session', expire_after: 1.month, secure: Rails.env.production?