ReturnValue = require 'nanocyte-component-return-value'

class PassThroughUnlessBlocked extends ReturnValue
  onEnvelope: (envelope) =>
    {data, message, config} = envelope
    nonce = config.nanocyte?.nonce
    return null if data.blocked? && data.blocked == nonce
    return message

module.exports = PassThroughUnlessBlocked
