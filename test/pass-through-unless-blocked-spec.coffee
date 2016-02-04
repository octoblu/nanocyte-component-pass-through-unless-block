ReturnValue = require 'nanocyte-component-return-value'
PassThroughUnlessBlocked = require '../'

describe 'PassThroughUnlessBlocked', ->
  beforeEach ->
    @sut = new PassThroughUnlessBlocked

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when unblocked', ->
      beforeEach ->
        envelope =
          config: {}
          data: {}
          message: 'anything'

        @message = @sut.onEnvelope envelope

      it 'should return the message', ->
        expect(@message).to.deep.equal 'anything'

    describe 'when blocked', ->
      beforeEach ->
        envelope =
          config:
            nanocyte:
              nonce: 'i-am-a-nonce'
          data:
            blocked: 'i-am-a-nonce'
          message: 'anything'

        @message = @sut.onEnvelope envelope

      it 'should return the message', ->
        expect(@message).not.to.exist
