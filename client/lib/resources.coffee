@resources = {}

resources.root = "resources/defaultRes/"

if cc.sys.isNative
  resources.root = "resources/nativeRes/"

resources.assets =
  engineImg: "#{resources.root}engine.png"