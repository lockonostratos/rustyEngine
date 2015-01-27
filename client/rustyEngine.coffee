Session.setDefault('counter', 0)

Template.hello.helpers
  counter: -> Session.get('counter')

Template.hello.events
  'click button': -> Session.set('counter', Session.get('counter') + 1)

Template.hello.rendered = ->
  cc.game.onStart = ->
    cc.LoaderScene.preload [], ->
      myScene = cc.Scene.extend
        onEnter: ->
          @_super()
          size = cc.director.getWinSize()
          sprite = cc.Sprite.create(resources.assets.engineImg)
          sprite.setAnchorPoint cc.p(0.5, 0.5)
          sprite.setPosition cc.p(size.width / 2, size.height / 2)
#          sprite.setScale(0.8)
          this.addChild(sprite, 0)

#          spriteAction = cc.MoveTo.create(1, cc.p(100, 100))
          spriteAction = cc.JumpTo.create(2, cc.p(100, 100), 100, 5)
          spriteAction = cc.JumpBy.create(2, cc.p(-400, 200), 100, 5)
          sprite.runAction(spriteAction)

          label = cc.LabelTTF.create("This is rustyEngine!", "Arial", 20)
          label.setPosition cc.p(size.width / 2, (size.height / 2) - 80)
          @addChild(label, 1)

#          node = ccs.csLoader.createNode("resources/character/jones.csd")
#          node_action = ccs.actionTimelineCache.createAction("resources/character/jones.csd")
#          node.runAction(node_action)
#          node.attr
#            scale: 0.6
#            x: 130
#            y: 10
#
#          node_action.gotoFrameAndPlay(0, 40, true)
#          @addChild(node)

      cc.director.runScene(new myScene())
    , @

  cc.game.run("gameCanvas")