require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"ViewController":[function(require,module,exports){
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

module.exports = (function(superClass) {
  extend(exports, superClass);

  function exports(options) {
    var autoInitial, backButtons, btn, i, len, transitions;
    if (options == null) {
      options = {};
    }
    if (options.width == null) {
      options.width = Screen.width;
    }
    if (options.height == null) {
      options.height = Screen.height;
    }
    if (options.clip == null) {
      options.clip = true;
    }
    if (options.initialViewName == null) {
      options.initialViewName = 'initialView';
    }
    if (options.backButtonName == null) {
      options.backButtonName = 'backButton';
    }
    if (options.animationOptions == null) {
      options.animationOptions = {
        curve: "cubic-bezier(0.19, 1, 0.22, 1)",
        time: .7
      };
    }
    if (options.backgroundColor == null) {
      options.backgroundColor = "black";
    }
    if (options.scroll == null) {
      options.scroll = false;
    }
    if (options.autoLink == null) {
      options.autoLink = true;
    }
    exports.__super__.constructor.call(this, options);
    this.history = [];
    this.onChange("subLayers", (function(_this) {
      return function(changeList) {
        var c, children, i, len, scrollComponent, view;
        view = changeList.added[0];
        if (view != null) {
          view.clip = true;
          view.on(Events.Click, function() {});
          if (_this.scroll) {
            children = view.children;
            scrollComponent = new ScrollComponent({
              name: "scrollComponent",
              width: _this.width,
              height: _this.height,
              parent: view
            });
            scrollComponent.content.backgroundColor = "";
            if (view.width <= _this.width) {
              scrollComponent.scrollHorizontal = false;
            }
            if (view.height <= _this.height) {
              scrollComponent.scrollVertical = false;
            }
            for (i = 0, len = children.length; i < len; i++) {
              c = children[i];
              c.parent = scrollComponent.content;
            }
            view.scrollComponent = scrollComponent;
            return view.size = {
              width: _this.width,
              height: _this.height
            };
          }
        }
      };
    })(this));
    transitions = {
      switchInstant: {},
      fadeIn: {
        newView: {
          from: {
            opacity: 0
          },
          to: {
            opacity: 1
          }
        }
      },
      zoomIn: {
        newView: {
          from: {
            scale: 0.8,
            opacity: 0
          },
          to: {
            scale: 1,
            opacity: 1
          }
        }
      },
      zoomOut: {
        oldView: {
          to: {
            scale: 0.8,
            opacity: 0
          }
        },
        newView: {
          to: {}
        }
      },
      slideInUp: {
        newView: {
          from: {
            y: this.height
          },
          to: {
            y: 0
          }
        }
      },
      slideInRight: {
        newView: {
          from: {
            x: this.width
          },
          to: {
            x: 0
          }
        }
      },
      slideInDown: {
        newView: {
          from: {
            maxY: 0
          },
          to: {
            y: 0
          }
        }
      },
      slideInLeft: {
        newView: {
          from: {
            maxX: 0
          },
          to: {
            maxX: this.width
          }
        }
      },
      moveInUp: {
        oldView: {
          to: {
            y: -this.height
          }
        },
        newView: {
          from: {
            y: this.height
          },
          to: {
            y: 0
          }
        }
      },
      moveInRight: {
        oldView: {
          to: {
            maxX: 0
          }
        },
        newView: {
          from: {
            x: this.width
          },
          to: {
            x: 0
          }
        }
      },
      moveInDown: {
        oldView: {
          to: {
            y: this.height
          }
        },
        newView: {
          from: {
            y: -this.height
          },
          to: {
            y: 0
          }
        }
      },
      moveInLeft: {
        oldView: {
          to: {
            x: this.width
          }
        },
        newView: {
          from: {
            maxX: 0
          },
          to: {
            x: 0
          }
        }
      },
      pushInRight: {
        oldView: {
          to: {
            x: -(this.width / 5),
            brightness: 70
          }
        },
        newView: {
          from: {
            x: this.width
          },
          to: {
            x: 0
          }
        }
      },
      pushInLeft: {
        oldView: {
          to: {
            x: this.width / 5,
            brightness: 70
          }
        },
        newView: {
          from: {
            x: -this.width
          },
          to: {
            x: 0
          }
        }
      },
      pushOutRight: {
        oldView: {
          to: {
            x: this.width
          }
        },
        newView: {
          from: {
            x: -(this.width / 5),
            brightness: 70
          },
          to: {
            x: 0,
            brightness: 100
          }
        }
      },
      pushOutLeft: {
        oldView: {
          to: {
            maxX: 0
          }
        },
        newView: {
          from: {
            x: this.width / 5,
            brightness: 70
          },
          to: {
            x: 0,
            brightness: 100
          }
        }
      },
      slideOutUp: {
        oldView: {
          to: {
            maxY: 0
          }
        },
        newView: {
          to: {}
        }
      },
      slideOutRight: {
        oldView: {
          to: {
            x: this.width
          }
        },
        newView: {
          to: {}
        }
      },
      slideOutDown: {
        oldView: {
          to: {
            y: this.height
          }
        },
        newView: {
          to: {}
        }
      },
      slideOutLeft: {
        oldView: {
          to: {
            maxX: 0
          }
        },
        newView: {
          to: {}
        }
      }
    };
    transitions.slideIn = transitions.slideInRight;
    transitions.slideOut = transitions.slideOutRight;
    transitions.pushIn = transitions.pushInRight;
    transitions.pushOut = transitions.pushOutRight;
    Events.ViewWillSwitch = "viewWillSwitch";
    Events.ViewDidSwitch = "viewDidSwitch";
    Layer.prototype.onViewWillSwitch = function(cb) {
      return this.on(Events.ViewWillSwitch, cb);
    };
    Layer.prototype.onViewDidSwitch = function(cb) {
      return this.on(Events.ViewDidSwitch, cb);
    };
    _.each(transitions, (function(_this) {
      return function(animProps, name) {
        var btn, i, layers, len, viewController;
        if (options.autoLink) {
          layers = Framer.CurrentContext._layers;
          for (i = 0, len = layers.length; i < len; i++) {
            btn = layers[i];
            if (_.includes(btn.name, name)) {
              viewController = _this;
              btn.onClick(function() {
                var anim, linkName;
                anim = this.name.split('_')[0];
                linkName = this.name.replace(anim + '_', '');
                linkName = linkName.replace(/\d+/g, '');
                return viewController[anim](_.find(layers, function(l) {
                  return l.name === linkName;
                }));
              });
            }
          }
        }
        return _this[name] = function(newView, animationOptions) {
          var animObj, hook, incoming, outgoing, ref, ref1, ref2, ref3, ref4, ref5, ref6;
          if (animationOptions == null) {
            animationOptions = _this.animationOptions;
          }
          if (newView === _this.currentView) {
            return;
          }
          newView.parent = _this;
          newView.sendToBack();
          newView.point = {
            x: 0,
            y: 0
          };
          newView.opacity = 1;
          newView.scale = 1;
          newView.brightness = 100;
          if ((ref = _this.currentView) != null) {
            ref.point = {
              x: 0,
              y: 0
            };
          }
          if ((ref1 = _this.currentView) != null) {
            ref1.props = (ref2 = animProps.oldView) != null ? ref2.from : void 0;
          }
          animObj = _.extend({
            properties: (ref3 = animProps.oldView) != null ? ref3.to : void 0
          }, animationOptions);
          _.defaults(animObj, {
            properties: {}
          });
          outgoing = (ref4 = _this.currentView) != null ? ref4.animate(animObj) : void 0;
          newView.props = (ref5 = animProps.newView) != null ? ref5.from : void 0;
          incoming = newView.animate(_.extend({
            properties: (ref6 = animProps.newView) != null ? ref6.to : void 0
          }, animationOptions));
          if (_.includes(name, 'Out')) {
            newView.placeBehind(_this.currentView);
            outgoing.on(Events.AnimationEnd, function() {
              return _this.currentView.bringToFront();
            });
          } else {
            newView.placeBefore(_this.currentView);
          }
          _this.emit(Events.ViewWillSwitch, _this.currentView, newView);
          _this.saveCurrentViewToHistory(name, outgoing, incoming);
          _this.currentView = newView;
          _this.emit("change:previousView", _this.previousView);
          _this.emit("change:currentView", _this.currentView);
          if (incoming.isAnimating) {
            hook = incoming;
          } else {
            hook = outgoing;
          }
          return hook != null ? hook.on(Events.AnimationEnd, function() {
            return _this.emit(Events.ViewDidSwitch, _this.previousView, _this.currentView);
          }) : void 0;
        };
      };
    })(this));
    if (options.initialViewName != null) {
      autoInitial = _.find(Framer.CurrentContext._layers, function(l) {
        return l.name === options.initialViewName;
      });
      if (autoInitial != null) {
        this.switchInstant(autoInitial);
      }
    }
    if (options.initialView != null) {
      this.switchInstant(options.initialView);
    }
    if (options.backButtonName != null) {
      backButtons = _.filter(Framer.CurrentContext._layers, function(l) {
        return _.includes(l.name, options.backButtonName);
      });
      for (i = 0, len = backButtons.length; i < len; i++) {
        btn = backButtons[i];
        btn.onClick((function(_this) {
          return function() {
            return _this.back();
          };
        })(this));
      }
    }
  }

  exports.define("previousView", {
    get: function() {
      return this.history[0].view;
    }
  });

  exports.prototype.saveCurrentViewToHistory = function(name, outgoingAnimation, incomingAnimation) {
    return this.history.unshift({
      view: this.currentView,
      animationName: name,
      incomingAnimation: incomingAnimation,
      outgoingAnimation: outgoingAnimation
    });
  };

  exports.prototype.back = function() {
    var backIn, moveOut, previous;
    previous = this.history[0];
    if (previous.view != null) {
      if (_.includes(previous.animationName, 'Out')) {
        previous.view.bringToFront();
      }
      backIn = previous.outgoingAnimation.reverse();
      moveOut = previous.incomingAnimation.reverse();
      backIn.start();
      moveOut.start();
      this.currentView = previous.view;
      this.history.shift();
      return moveOut.on(Events.AnimationEnd, (function(_this) {
        return function() {
          return _this.currentView.bringToFront();
        };
      })(this));
    }
  };

  return exports;

})(Layer);


},{}],"ViewNavigationController":[function(require,module,exports){
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.ViewNavigationController = (function(superClass) {
  var ANIMATION_OPTIONS, BACKBUTTON_VIEW_NAME, BACK_BUTTON_FRAME, DEBUG_MODE, DIR, INITIAL_VIEW_NAME, PUSH;

  extend(ViewNavigationController, superClass);

  INITIAL_VIEW_NAME = "initialView";

  BACKBUTTON_VIEW_NAME = "vnc-backButton";

  ANIMATION_OPTIONS = {
    time: 0.3,
    curve: "ease-in-out"
  };

  BACK_BUTTON_FRAME = {
    x: 0,
    y: 40,
    width: 88,
    height: 88
  };

  PUSH = {
    UP: "pushUp",
    DOWN: "pushDown",
    LEFT: "pushLeft",
    RIGHT: "pushRight",
    CENTER: "pushCenter"
  };

  DIR = {
    UP: "up",
    DOWN: "down",
    LEFT: "left",
    RIGHT: "right"
  };

  DEBUG_MODE = false;

  function ViewNavigationController(options) {
    var base, base1, base2, base3;
    this.options = options != null ? options : {};
    this.views = this.history = this.initialView = this.currentView = this.previousView = this.initialViewName = null;
    if ((base = this.options).width == null) {
      base.width = Screen.width;
    }
    if ((base1 = this.options).height == null) {
      base1.height = Screen.height;
    }
    if ((base2 = this.options).clip == null) {
      base2.clip = true;
    }
    if ((base3 = this.options).backgroundColor == null) {
      base3.backgroundColor = "#999";
    }
    ViewNavigationController.__super__.constructor.call(this, this.options);
    this.views = [];
    this.history = [];
    this.animationOptions = this.options.animationOptions || ANIMATION_OPTIONS;
    this.initialViewName = this.options.initialViewName || INITIAL_VIEW_NAME;
    this.backButtonFrame = this.options.backButtonFrame || BACK_BUTTON_FRAME;
    this.debugMode = this.options.debugMode != null ? this.options.debugMode : DEBUG_MODE;
    this.on("change:subLayers", function(changeList) {
      return Utils.delay(0, (function(_this) {
        return function() {
          var i, len, ref, results, subLayer;
          ref = changeList.added;
          results = [];
          for (i = 0, len = ref.length; i < len; i++) {
            subLayer = ref[i];
            results.push(_this.addView(subLayer, true));
          }
          return results;
        };
      })(this));
    });
  }

  ViewNavigationController.prototype.addView = function(view, viaInternalChangeEvent) {
    var obj, vncHeight, vncWidth;
    vncWidth = this.options.width;
    vncHeight = this.options.height;
    view.states.add((
      obj = {},
      obj["" + PUSH.UP] = {
        x: 0,
        y: -vncHeight
      },
      obj["" + PUSH.LEFT] = {
        x: -vncWidth,
        y: 0
      },
      obj["" + PUSH.CENTER] = {
        x: 0,
        y: 0
      },
      obj["" + PUSH.RIGHT] = {
        x: vncWidth,
        y: 0
      },
      obj["" + PUSH.DOWN] = {
        x: 0,
        y: vncHeight
      },
      obj
    ));
    view.states.animationOptions = this.animationOptions;
    if (view.name === this.initialViewName) {
      this.initialView = view;
      this.currentView = view;
      view.states.switchInstant(PUSH.CENTER);
      this.history.push(view);
    } else {
      view.states.switchInstant(PUSH.RIGHT);
    }
    if (!(view.superLayer === this || viaInternalChangeEvent)) {
      view.superLayer = this;
    }
    if (view.name !== this.initialViewName) {
      this._applyBackButton(view);
    }
    return this.views.push(view);
  };

  ViewNavigationController.prototype.transition = function(view, direction, switchInstant, preventHistory) {
    if (direction == null) {
      direction = DIR.RIGHT;
    }
    if (switchInstant == null) {
      switchInstant = false;
    }
    if (preventHistory == null) {
      preventHistory = false;
    }
    if (view === this.currentView) {
      return false;
    }
    if (direction === DIR.RIGHT) {
      view.states.switchInstant(PUSH.RIGHT);
      this.currentView.states["switch"](PUSH.LEFT);
    } else if (direction === DIR.DOWN) {
      view.states.switchInstant(PUSH.DOWN);
      this.currentView.states["switch"](PUSH.UP);
    } else if (direction === DIR.LEFT) {
      view.states.switchInstant(PUSH.LEFT);
      this.currentView.states["switch"](PUSH.RIGHT);
    } else if (direction === DIR.UP) {
      view.states.switchInstant(PUSH.UP);
      this.currentView.states["switch"](PUSH.DOWN);
    } else {
      view.states.switchInstant(PUSH.CENTER);
      this.currentView.states.switchInstant(PUSH.LEFT);
    }
    view.states["switch"](PUSH.CENTER);
    this.previousView = this.currentView;
    this.previousView.custom = {
      lastTransition: direction
    };
    this.currentView = view;
    if (preventHistory === false) {
      this.history.push(this.previousView);
    }
    return this.emit("change:view");
  };

  ViewNavigationController.prototype.removeBackButton = function(view) {
    return Utils.delay(0.1, (function(_this) {
      return function() {
        return view.subLayersByName(BACKBUTTON_VIEW_NAME)[0].visible = false;
      };
    })(this));
  };

  ViewNavigationController.prototype.back = function() {
    var direction, lastTransition, lastView, oppositeTransition, preventHistory, switchInstant;
    lastView = this._getLastHistoryItem();
    lastTransition = lastView.custom.lastTransition;
    oppositeTransition = this._getOppositeDirection(lastTransition);
    this.transition(lastView, direction = oppositeTransition, switchInstant = false, preventHistory = true);
    return this.history.pop();
  };

  ViewNavigationController.prototype._getLastHistoryItem = function() {
    return this.history[this.history.length - 1];
  };

  ViewNavigationController.prototype._applyBackButton = function(view, frame) {
    if (frame == null) {
      frame = this.backButtonFrame;
    }
    return Utils.delay(0, (function(_this) {
      return function() {
        var backButton;
        if (view.backButton !== false) {
          backButton = new Layer({
            name: BACKBUTTON_VIEW_NAME,
            width: 80,
            height: 80,
            superLayer: view
          });
          if (_this.debugMode === false) {
            backButton.backgroundColor = "transparent";
          }
          backButton.frame = frame;
          return backButton.on(Events.Click, function() {
            return _this.back();
          });
        }
      };
    })(this));
  };

  ViewNavigationController.prototype._getOppositeDirection = function(initialDirection) {
    if (initialDirection === DIR.UP) {
      return DIR.DOWN;
    } else if (initialDirection === DIR.DOWN) {
      return DIR.UP;
    } else if (initialDirection === DIR.RIGHT) {
      return DIR.LEFT;
    } else if (initialDirection === DIR.LEFT) {
      return DIR.RIGHT;
    } else {
      return DIR.LEFT;
    }
  };

  return ViewNavigationController;

})(Layer);


/*

USAGE EXAMPLE 1 - Define InitialViewName

initialViewKey = "view1"

vnc = new ViewNavigationController
	initialViewName: initialViewKey

view1 = new Layer
	name: initialViewKey
	width:  Screen.width
	height: Screen.height
	backgroundColor: "red"
	parent: vnc
 */


/*

USAGE EXAMPLE 2 - Use default initialViewName "initialView"

vnc = new ViewNavigationController

view1 = new Layer
	name: "initialView"
	width:  Screen.width
	height: Screen.height
	backgroundColor: "red"
	parent: vnc

view2 = new Layer
	width:  Screen.width
	height: Screen.height
	backgroundColor: "green"
	parent: vnc

view1.onClick ->
	vnc.transition view2

view2.onClick ->
	vnc.back()
 */


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}],"navigationComponent":[function(require,module,exports){
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.NavigationComponent = (function(superClass) {
  var _ANIMATION_CURVE, _ANIMATION_TIME, _LEFT_PADDING, navigationComponentsCounter;

  extend(NavigationComponent, superClass);

  _ANIMATION_TIME = 0.4;

  _ANIMATION_CURVE = "cubic-bezier(.6, .1, .3, 1)";

  _LEFT_PADDING = Framer.Device.deviceType.indexOf("iphone-6plus") === -1 ? 46 : 69;

  Events.NavigationWillPush = "navigationWillPush";

  Events.NavigationDidPush = "navigationDidPush";

  Events.NavigationWillPop = "navigationWillPop";

  Events.NavigationDidPop = "navigationDidPop";

  navigationComponentsCounter = 1;

  function NavigationComponent(options) {
    var backArrow, base, base1, base2, base3, base4, leftLayer, titleLayer;
    this.options = options != null ? options : {};
    if (!this.options.rootLayer) {
      throw new Error("Can't initialize NavigationComponent: parameter 'rootLayer' is required.");
      return;
    }
    if ((base = this.options).width == null) {
      base.width = Screen.width;
    }
    if ((base1 = this.options).height == null) {
      base1.height = Screen.height;
    }
    if ((base2 = this.options).clip == null) {
      base2.clip = true;
    }
    if ((base3 = this.options).backgroundColor == null) {
      base3.backgroundColor = "transparent";
    }
    if ((base4 = this.options).name == null) {
      base4.name = "Navigation Component " + navigationComponentsCounter;
    }
    NavigationComponent.__super__.constructor.call(this, this.options);
    navigationComponentsCounter++;
    this.navigationLayers = [];
    this.headerLayer = null;
    this.animationTime = this.options.animationTime || _ANIMATION_TIME;
    this.animationCurve = this.options.animationCurve || _ANIMATION_CURVE;
    this.animationPush = this.options.animationPush || this._defaultAnimationPush;
    this.animationPop = this.options.animationPop || this._defaultAnimationPop;
    this.currentLayerIndex = -1;
    this.lock = false;
    this.customHeader = false;
    if (this.options.headerLayer) {
      this.headerLayer = this.options.headerLayer;
      this.addSubLayer(this.headerLayer);
      this.customHeader = true;
    } else {
      this.headerLayer = new Layer({
        superLayer: this,
        name: "Header Layer",
        width: this.width,
        height: 88,
        clip: false,
        backgroundColor: "rgba(248, 248, 248, 0.9)"
      });
      this.headerLayer.style["background-image"] = "linear-gradient(0deg, rgb(200, 199, 204), rgb(200, 199, 204) 50%, transparent 50%)";
      this.headerLayer.style["background-size"] = "100% 1px";
      this.headerLayer.style["background-repeat"] = "no-repeat";
      this.headerLayer.style["background-position"] = "bottom";
      titleLayer = new Layer({
        superLayer: this.headerLayer,
        name: "Title Layer",
        width: this.headerLayer.width / 2,
        height: this.headerLayer.height,
        backgroundColor: ""
      });
      titleLayer.centerX();
      titleLayer.style = {
        "font-size": "34px",
        "color": "black",
        "line-height": this.headerLayer.height + "px",
        "font-weight": "500",
        "text-align": "center",
        "font-family": "'Helvetica Neue', Helvetica, Arial, sans-serif",
        "white-space": "nowrap",
        "height": this.headerLayer.height + "px"
      };
      leftLayer = new Layer({
        superLayer: this.headerLayer,
        name: "Left Layer",
        width: 140,
        height: this.headerLayer.height,
        backgroundColor: "",
        opacity: 0,
        x: _LEFT_PADDING
      });
      leftLayer.style = {
        "font-size": "34px",
        "color": "rgb(21, 125, 251)",
        "line-height": this.headerLayer.height + "px",
        "font-weight": "300",
        "text-align": "left",
        "font-family": "'Helvetica Neue', Helvetica, Arial, sans-serif",
        "white-space": "nowrap",
        "height": this.headerLayer.height + "px"
      };
      leftLayer.on(Events.Click, (function(_this) {
        return function() {
          return _this.pop();
        };
      })(this));
      backArrow = new Layer({
        superLayer: this.headerLayer,
        name: "Back Arrow",
        originX: 0,
        originY: 0,
        backgroundColor: "",
        opacity: 0,
        html: "<svg version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' width='46px' height='88px' viewBox='0 0 46 88' enable-background='new 0 0 46 88' xml:space='preserve'> <polygon fill='#157DFB' points='36.51,64.51 40.61,60.4 24.2,44 40.61,27.59 36.51,23.49 20.1,39.9 16,44 20.1,48.1 20.1,48.1 '/> </svg>"
      });
      backArrow.on(Events.Click, (function(_this) {
        return function() {
          return _this.pop();
        };
      })(this));
      this.headerLayer.titleLayer = titleLayer;
      this.headerLayer.backArrow = backArrow;
      this.headerLayer.leftLayer = leftLayer;
      if (Framer.Device.deviceType.indexOf("iphone-6plus") >= 0) {
        this.headerLayer.height = 132;
        titleLayer.height = 132;
        titleLayer.style["font-size"] = "48px";
        titleLayer.style["line-height"] = titleLayer.height + "px";
        leftLayer.height = 132;
        leftLayer.style["font-size"] = "48px";
        leftLayer.style["line-height"] = titleLayer.height + "px";
        leftLayer.width = leftLayer.width * 1.5;
        backArrow.scale = 1.5;
      }
    }
    if (this.options.rootLayer) {
      this.navigationLayers = [this.options.rootLayer];
      this.currentLayerIndex = 0;
      this.addSubLayer(this.options.rootLayer);
      this.headerLayer.bringToFront();
      if (this.options.rootLayer.title && this.headerLayer.titleLayer) {
        this.headerLayer.titleLayer.html = "<div style=\"overflow: hidden; text-overflow: ellipsis\">" + this.options.rootLayer.title + "</div>";
      }
    }
  }

  NavigationComponent.prototype.push = function(layer) {
    var currentLayer, nextLayer;
    if (!this.lock) {
      this.emit(Events.NavigationWillPush, {
        navigationLayer: this,
        currentLayer: currentLayer,
        nextLayer: nextLayer
      });
      this.lock = true;
      this.navigationLayers.push(layer);
      this.addSubLayer(layer);
      if (this.headerLayer) {
        this.headerLayer.bringToFront();
      }
      currentLayer = this.navigationLayers[this.currentLayerIndex];
      nextLayer = layer;
      if (typeof currentLayer.layerWillDisappear === "function") {
        currentLayer.layerWillDisappear();
      }
      if (typeof nextLayer.layerWillAppear === "function") {
        nextLayer.layerWillAppear();
      }
      this.currentLayerIndex++;
      this.animationPush(currentLayer, nextLayer);
      this._defaultHeaderAnimationPush(currentLayer, nextLayer);
      return Utils.delay(this.animationTime, (function(_this) {
        return function() {
          currentLayer.visible = false;
          _this.lock = false;
          return _this.emit(Events.NavigationDidPush, {
            navigationLayer: _this,
            currentLayer: currentLayer,
            nextLayer: nextLayer
          });
        };
      })(this));
    } else {
      return layer.destroy();
    }
  };

  NavigationComponent.prototype.pop = function() {
    return this.popToLayerAtIndex(this.currentLayerIndex - 1);
  };

  NavigationComponent.prototype.popToRootLayer = function() {
    return this.popToLayerAtIndex(0);
  };

  NavigationComponent.prototype.popToLayerAtIndex = function(index) {
    var currentLayer, nextLayer;
    if (!this.lock) {
      this.lock = true;
      if (this.currentLayerIndex > 0 && ((0 <= index && index <= this.navigationLayers.length))) {
        this.emit(Events.NavigationWillPop, {
          navigationLayer: this,
          index: index,
          currentLayer: currentLayer,
          nextLayer: nextLayer
        });
        currentLayer = this.navigationLayers[this.currentLayerIndex];
        nextLayer = this.navigationLayers[index];
        nextLayer.visible = true;
        if (typeof currentLayer.layerWillDisappear === "function") {
          currentLayer.layerWillDisappear();
        }
        if (typeof nextLayer.layerWillAppear === "function") {
          nextLayer.layerWillAppear();
        }
        this.animationPop(currentLayer, nextLayer);
        this._defaultHeaderAnimationPop(currentLayer, nextLayer, index);
        return Utils.delay(this.animationTime, (function(_this) {
          return function() {
            var i, indexToBeDeleted, layerToBeDeleted, ref, ref1;
            for (indexToBeDeleted = i = ref = _this.navigationLayers.length - 1, ref1 = index + 1; ref <= ref1 ? i <= ref1 : i >= ref1; indexToBeDeleted = ref <= ref1 ? ++i : --i) {
              layerToBeDeleted = _this.navigationLayers[indexToBeDeleted];
              layerToBeDeleted.destroy();
              _this.navigationLayers.pop();
            }
            _this.currentLayerIndex = index;
            _this.lock = false;
            return _this.emit(Events.NavigationDidPop, {
              navigationLayer: _this,
              index: index,
              currentLayer: currentLayer,
              nextLayer: nextLayer
            });
          };
        })(this));
      } else {
        return this.lock = false;
      }
    }
  };

  NavigationComponent.prototype._animateHeaderSubLayer = function(subLayerName, fromLayer, toLayer, newTitle, currentToX, newFromX) {
    var headerSubLayer, newHeaderSubLayer, newHeaderSubLayerAnimation, origSubLayerX;
    if (this.headerLayer[subLayerName]) {
      headerSubLayer = this.headerLayer[subLayerName];
      origSubLayerX = headerSubLayer.x;
      headerSubLayer.animate({
        properties: {
          opacity: 0,
          x: currentToX
        },
        curve: _ANIMATION_CURVE,
        time: _ANIMATION_TIME
      });
      if (newTitle !== void 0) {
        newHeaderSubLayer = headerSubLayer.copy();
        newHeaderSubLayer.style = headerSubLayer.style;
        this.headerLayer.addSubLayer(newHeaderSubLayer);
        newHeaderSubLayer.name = "tmp " + subLayerName;
        newHeaderSubLayer.x = newFromX;
        newHeaderSubLayer.opacity = 0;
        newHeaderSubLayer.html = "<div style=\"overflow: hidden; text-overflow: ellipsis\">" + newTitle + "</div>";
        newHeaderSubLayerAnimation = new Animation({
          layer: newHeaderSubLayer,
          properties: {
            opacity: 1,
            x: origSubLayerX
          },
          curve: _ANIMATION_CURVE,
          time: _ANIMATION_TIME
        });
        newHeaderSubLayerAnimation.start();
        return newHeaderSubLayerAnimation.on("end", function() {
          headerSubLayer.html = newHeaderSubLayer.html;
          headerSubLayer.opacity = 1;
          headerSubLayer.x = origSubLayerX;
          return newHeaderSubLayer.destroy();
        });
      }
    }
  };

  NavigationComponent.prototype._defaultHeaderAnimationPush = function(fromLayer, toLayer) {
    if (this.headerLayer && !this.customHeader) {
      this._animateHeaderSubLayer("titleLayer", fromLayer, toLayer, toLayer.title, -_LEFT_PADDING, this.headerLayer.width);
      this._animateHeaderSubLayer("leftLayer", fromLayer, toLayer, fromLayer.title, -this.headerLayer.width / 2, this.headerLayer.width / 2);
      if (this.headerLayer.backArrow) {
        return this.headerLayer.backArrow.animate({
          properties: {
            opacity: 1
          },
          curve: _ANIMATION_CURVE,
          time: _ANIMATION_TIME
        });
      }
    }
  };

  NavigationComponent.prototype._defaultHeaderAnimationPop = function(fromLayer, toLayer, index) {
    var newLeftLayerTitle;
    if (this.headerLayer && !this.customHeader) {
      this._animateHeaderSubLayer("titleLayer", fromLayer, toLayer, toLayer.title, this.headerLayer.width, 0);
      newLeftLayerTitle = "";
      if (this.navigationLayers[index - 1] && this.navigationLayers[index - 1].title) {
        newLeftLayerTitle = this.navigationLayers[index - 1].title;
      } else {
        if (this.headerLayer.backArrow) {
          this.headerLayer.backArrow.animate({
            properties: {
              opacity: 0
            },
            curve: _ANIMATION_CURVE,
            time: _ANIMATION_TIME
          });
        }
      }
      return this._animateHeaderSubLayer("leftLayer", fromLayer, toLayer, newLeftLayerTitle, this.headerLayer.width / 2, -this.headerLayer.width / 2);
    }
  };

  NavigationComponent.prototype._defaultAnimationPush = function(fromLayer, toLayer) {
    var shadowLayer;
    shadowLayer = new Layer({
      superLayer: fromLayer,
      width: fromLayer.width,
      height: fromLayer.height,
      name: "shadowLayer",
      backgroundColor: "black",
      opacity: 0
    });
    shadowLayer.animate({
      properties: {
        opacity: 0.2
      },
      curve: _ANIMATION_CURVE,
      time: _ANIMATION_TIME
    });
    fromLayer.animate({
      properties: {
        x: -this.width * 0.25
      },
      curve: _ANIMATION_CURVE,
      time: _ANIMATION_TIME
    });
    toLayer.shadowColor = "rgba(0,0,0,0.2)";
    toLayer.shadowX = -10;
    toLayer.shadowBlur = 14;
    toLayer.x = this.width + (-toLayer.shadowX);
    return toLayer.animate({
      properties: {
        x: 0
      },
      curve: _ANIMATION_CURVE,
      time: _ANIMATION_TIME
    });
  };

  NavigationComponent.prototype._defaultAnimationPop = function(fromLayer, toLayer) {
    var shadowLayer, shadowLayerAnimation;
    fromLayer.animate({
      properties: {
        x: this.width + (-fromLayer.shadowX)
      },
      curve: _ANIMATION_CURVE,
      time: _ANIMATION_TIME
    });
    toLayer.animate({
      properties: {
        x: 0
      },
      curve: _ANIMATION_CURVE,
      time: _ANIMATION_TIME
    });
    shadowLayer = toLayer.subLayersByName("shadowLayer")[0];
    shadowLayerAnimation = new Animation({
      layer: shadowLayer,
      properties: {
        opacity: 0
      },
      curve: _ANIMATION_CURVE,
      time: _ANIMATION_TIME
    });
    shadowLayerAnimation.start();
    return shadowLayerAnimation.on("end", function() {
      return shadowLayer.destroy();
    });
  };

  return NavigationComponent;

})(Layer);


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL1ZhbXNpL1ZhbXNpL3dvcmsvRnJhbWVyL1ZpbWFuYS9WaW1hbmFfRGVtb19uZXcuZnJhbWVyL21vZHVsZXMvbmF2aWdhdGlvbkNvbXBvbmVudC5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy9WYW1zaS9WYW1zaS93b3JrL0ZyYW1lci9WaW1hbmEvVmltYW5hX0RlbW9fbmV3LmZyYW1lci9tb2R1bGVzL215TW9kdWxlLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL1ZhbXNpL1ZhbXNpL3dvcmsvRnJhbWVyL1ZpbWFuYS9WaW1hbmFfRGVtb19uZXcuZnJhbWVyL21vZHVsZXMvVmlld05hdmlnYXRpb25Db250cm9sbGVyLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL1ZhbXNpL1ZhbXNpL3dvcmsvRnJhbWVyL1ZpbWFuYS9WaW1hbmFfRGVtb19uZXcuZnJhbWVyL21vZHVsZXMvVmlld0NvbnRyb2xsZXIuY29mZmVlIiwibm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyJdLCJzb3VyY2VzQ29udGVudCI6WyJjbGFzcyBleHBvcnRzLk5hdmlnYXRpb25Db21wb25lbnQgZXh0ZW5kcyBMYXllclxuXHRcblx0I2lPUyBhbmltYXRpb24gY29uc3RhbnRzXG5cdF9BTklNQVRJT05fVElNRSBcdFx0XHQ9IDAuNFxuXHRfQU5JTUFUSU9OX0NVUlZFIFx0XHRcdD0gXCJjdWJpYy1iZXppZXIoLjYsIC4xLCAuMywgMSlcIlxuXHRfTEVGVF9QQURESU5HIFx0XHRcdFx0PSBpZiBGcmFtZXIuRGV2aWNlLmRldmljZVR5cGUuaW5kZXhPZihcImlwaG9uZS02cGx1c1wiKSBpcyAtMSB0aGVuIDQ2IGVsc2UgNjlcblx0XG5cdCNDdXN0b20gZXZlbnRzXG5cdEV2ZW50cy5OYXZpZ2F0aW9uV2lsbFB1c2ggXHQ9IFwibmF2aWdhdGlvbldpbGxQdXNoXCJcblx0RXZlbnRzLk5hdmlnYXRpb25EaWRQdXNoIFx0PSBcIm5hdmlnYXRpb25EaWRQdXNoXCJcblx0RXZlbnRzLk5hdmlnYXRpb25XaWxsUG9wIFx0PSBcIm5hdmlnYXRpb25XaWxsUG9wXCJcblx0RXZlbnRzLk5hdmlnYXRpb25EaWRQb3AgXHQ9IFwibmF2aWdhdGlvbkRpZFBvcFwiXG5cdFxuXHQjIFNoYXJlZCBjbGFzcyB2YXJpYWJsZXNcdFx0XG5cdG5hdmlnYXRpb25Db21wb25lbnRzQ291bnRlciA9IDFcblx0XG5cdCMgUHVibGljIGNvbnN0cnVjdG9yXG5cdGNvbnN0cnVjdG9yOiAoQG9wdGlvbnM9e30pIC0+XG5cblx0XHQjIENoZWNrIHJlcXVpcmVkIHBhcmFtc1xuXHRcdGlmIG5vdCBAb3B0aW9ucy5yb290TGF5ZXJcblx0XHRcdHRocm93IG5ldyBFcnJvcihcIkNhbid0IGluaXRpYWxpemUgTmF2aWdhdGlvbkNvbXBvbmVudDogcGFyYW1ldGVyICdyb290TGF5ZXInIGlzIHJlcXVpcmVkLlwiKVxuXHRcdFx0cmV0dXJuXG5cblx0XHRAb3B0aW9ucy53aWR0aCAgICAgICAgICAgPz0gU2NyZWVuLndpZHRoXG5cdFx0QG9wdGlvbnMuaGVpZ2h0ICAgICAgICAgID89IFNjcmVlbi5oZWlnaHRcblx0XHRAb3B0aW9ucy5jbGlwICAgICAgICAgICAgPz0gdHJ1ZVxuXHRcdEBvcHRpb25zLmJhY2tncm91bmRDb2xvciA/PSBcInRyYW5zcGFyZW50XCJcblx0XHRAb3B0aW9ucy5uYW1lIFx0XHRcdCA/PSBcIk5hdmlnYXRpb24gQ29tcG9uZW50IFwiICsgbmF2aWdhdGlvbkNvbXBvbmVudHNDb3VudGVyXG5cblx0XHRzdXBlciBAb3B0aW9uc1xuXHRcdFxuXHRcdG5hdmlnYXRpb25Db21wb25lbnRzQ291bnRlcisrXG5cblx0XHRAbmF2aWdhdGlvbkxheWVycyAgID0gW11cblx0XHRAaGVhZGVyTGF5ZXIgXHRcdD0gbnVsbFxuXHRcdEBhbmltYXRpb25UaW1lIFx0XHQ9IEBvcHRpb25zLmFuaW1hdGlvblRpbWUgb3IgX0FOSU1BVElPTl9USU1FXG5cdFx0QGFuaW1hdGlvbkN1cnZlXHRcdD0gQG9wdGlvbnMuYW5pbWF0aW9uQ3VydmUgb3IgX0FOSU1BVElPTl9DVVJWRVxuXHRcdEBhbmltYXRpb25QdXNoIFx0XHQ9IEBvcHRpb25zLmFuaW1hdGlvblB1c2ggb3IgQF9kZWZhdWx0QW5pbWF0aW9uUHVzaFxuXHRcdEBhbmltYXRpb25Qb3BcdFx0PSBAb3B0aW9ucy5hbmltYXRpb25Qb3Agb3IgQF9kZWZhdWx0QW5pbWF0aW9uUG9wXG5cdFx0QGN1cnJlbnRMYXllckluZGV4IFx0PSAtMVxuXHRcdEBsb2NrIFx0XHRcdFx0PSBmYWxzZVxuXHRcdEBjdXN0b21IZWFkZXIgXHRcdD0gZmFsc2Vcblx0XHRcblx0XHRpZiBAb3B0aW9ucy5oZWFkZXJMYXllclxuXHRcdFx0QGhlYWRlckxheWVyID0gQG9wdGlvbnMuaGVhZGVyTGF5ZXJcblx0XHRcdEBhZGRTdWJMYXllcihAaGVhZGVyTGF5ZXIpXG5cdFx0XHRAY3VzdG9tSGVhZGVyID0gdHJ1ZVxuXHRcdGVsc2UgIyBEZWZhdWx0IGlPUzcgaGVhZGVyXG5cdFx0XHRAaGVhZGVyTGF5ZXIgPSBuZXcgTGF5ZXJcblx0XHRcdFx0c3VwZXJMYXllcjogQFxuXHRcdFx0XHRuYW1lOiBcIkhlYWRlciBMYXllclwiXG5cdFx0XHRcdHdpZHRoOiBAd2lkdGhcblx0XHRcdFx0aGVpZ2h0OiA4OFxuXHRcdFx0XHRjbGlwOiBmYWxzZVxuXHRcdFx0XHRiYWNrZ3JvdW5kQ29sb3I6IFwicmdiYSgyNDgsIDI0OCwgMjQ4LCAwLjkpXCJcblx0XHRcdEBoZWFkZXJMYXllci5zdHlsZVtcImJhY2tncm91bmQtaW1hZ2VcIl0gPSBcImxpbmVhci1ncmFkaWVudCgwZGVnLCByZ2IoMjAwLCAxOTksIDIwNCksIHJnYigyMDAsIDE5OSwgMjA0KSA1MCUsIHRyYW5zcGFyZW50IDUwJSlcIlxuXHRcdFx0QGhlYWRlckxheWVyLnN0eWxlW1wiYmFja2dyb3VuZC1zaXplXCJdID0gXCIxMDAlIDFweFwiXG5cdFx0XHRAaGVhZGVyTGF5ZXIuc3R5bGVbXCJiYWNrZ3JvdW5kLXJlcGVhdFwiXSA9IFwibm8tcmVwZWF0XCJcblx0XHRcdEBoZWFkZXJMYXllci5zdHlsZVtcImJhY2tncm91bmQtcG9zaXRpb25cIl0gPSBcImJvdHRvbVwiXG5cdFx0XHRcblx0XHRcdHRpdGxlTGF5ZXIgPSBuZXcgTGF5ZXJcblx0XHRcdFx0c3VwZXJMYXllcjogQGhlYWRlckxheWVyXG5cdFx0XHRcdG5hbWU6IFwiVGl0bGUgTGF5ZXJcIlxuXHRcdFx0XHR3aWR0aDogQGhlYWRlckxheWVyLndpZHRoIC8gMlxuXHRcdFx0XHRoZWlnaHQ6IEBoZWFkZXJMYXllci5oZWlnaHRcblx0XHRcdFx0YmFja2dyb3VuZENvbG9yOiBcIlwiXG5cdFx0XHR0aXRsZUxheWVyLmNlbnRlclgoKVxuXHRcdFx0dGl0bGVMYXllci5zdHlsZSA9XG5cdFx0XHRcdFwiZm9udC1zaXplXCIgOiBcIjM0cHhcIlxuXHRcdFx0XHRcImNvbG9yXCIgOiBcImJsYWNrXCJcblx0XHRcdFx0XCJsaW5lLWhlaWdodFwiIDogQGhlYWRlckxheWVyLmhlaWdodCArIFwicHhcIlxuXHRcdFx0XHRcImZvbnQtd2VpZ2h0XCIgOiBcIjUwMFwiXG5cdFx0XHRcdFwidGV4dC1hbGlnblwiIDogXCJjZW50ZXJcIlxuXHRcdFx0XHRcImZvbnQtZmFtaWx5XCI6IFwiJ0hlbHZldGljYSBOZXVlJywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZlwiXG5cdFx0XHRcdFwid2hpdGUtc3BhY2VcIjogXCJub3dyYXBcIlxuXHRcdFx0XHRcImhlaWdodFwiIDogQGhlYWRlckxheWVyLmhlaWdodCArIFwicHhcIlxuXG5cdFx0XHRsZWZ0TGF5ZXIgPSBuZXcgTGF5ZXJcblx0XHRcdFx0c3VwZXJMYXllcjogQGhlYWRlckxheWVyXG5cdFx0XHRcdG5hbWU6IFwiTGVmdCBMYXllclwiXG5cdFx0XHRcdHdpZHRoOiAxNDBcblx0XHRcdFx0aGVpZ2h0OiBAaGVhZGVyTGF5ZXIuaGVpZ2h0XG5cdFx0XHRcdGJhY2tncm91bmRDb2xvcjogXCJcIlxuXHRcdFx0XHRvcGFjaXR5OiAwXG5cdFx0XHRcdHg6IF9MRUZUX1BBRERJTkdcblx0XHRcdGxlZnRMYXllci5zdHlsZSA9XG5cdFx0XHRcdFwiZm9udC1zaXplXCIgOiBcIjM0cHhcIlxuXHRcdFx0XHRcImNvbG9yXCIgOiBcInJnYigyMSwgMTI1LCAyNTEpXCJcblx0XHRcdFx0XCJsaW5lLWhlaWdodFwiIDogQGhlYWRlckxheWVyLmhlaWdodCArIFwicHhcIlxuXHRcdFx0XHRcImZvbnQtd2VpZ2h0XCIgOiBcIjMwMFwiXG5cdFx0XHRcdFwidGV4dC1hbGlnblwiIDogXCJsZWZ0XCJcblx0XHRcdFx0XCJmb250LWZhbWlseVwiOiBcIidIZWx2ZXRpY2EgTmV1ZScsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWZcIlxuXHRcdFx0XHRcIndoaXRlLXNwYWNlXCI6IFwibm93cmFwXCJcblx0XHRcdFx0XCJoZWlnaHRcIiA6IEBoZWFkZXJMYXllci5oZWlnaHQgKyBcInB4XCJcblx0XHRcdGxlZnRMYXllci5vbiBFdmVudHMuQ2xpY2ssID0+XG5cdFx0XHRcdEBwb3AoKVxuXG5cdFx0XHRiYWNrQXJyb3cgPSBuZXcgTGF5ZXJcblx0XHRcdFx0c3VwZXJMYXllcjogQGhlYWRlckxheWVyXG5cdFx0XHRcdG5hbWU6IFwiQmFjayBBcnJvd1wiXG5cdFx0XHRcdG9yaWdpblg6IDBcblx0XHRcdFx0b3JpZ2luWTogMFxuXHRcdFx0XHRiYWNrZ3JvdW5kQ29sb3I6IFwiXCJcblx0XHRcdFx0b3BhY2l0eTogMFxuXHRcdFx0XHRodG1sOiBcIjxzdmcgdmVyc2lvbj0nMS4xJyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHhtbG5zOnhsaW5rPSdodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rJyB4PScwcHgnIHk9JzBweCcgd2lkdGg9JzQ2cHgnIGhlaWdodD0nODhweCcgdmlld0JveD0nMCAwIDQ2IDg4JyBlbmFibGUtYmFja2dyb3VuZD0nbmV3IDAgMCA0NiA4OCcgeG1sOnNwYWNlPSdwcmVzZXJ2ZSc+IDxwb2x5Z29uIGZpbGw9JyMxNTdERkInIHBvaW50cz0nMzYuNTEsNjQuNTEgNDAuNjEsNjAuNCAyNC4yLDQ0IDQwLjYxLDI3LjU5IDM2LjUxLDIzLjQ5IDIwLjEsMzkuOSAxNiw0NCAyMC4xLDQ4LjEgMjAuMSw0OC4xICcvPiA8L3N2Zz5cIlxuXHRcdFx0YmFja0Fycm93Lm9uIEV2ZW50cy5DbGljaywgPT5cblx0XHRcdFx0QHBvcCgpXG5cdFx0XHRcblx0XHRcdEBoZWFkZXJMYXllci50aXRsZUxheWVyID0gdGl0bGVMYXllclxuXHRcdFx0QGhlYWRlckxheWVyLmJhY2tBcnJvdyA9IGJhY2tBcnJvd1xuXHRcdFx0QGhlYWRlckxheWVyLmxlZnRMYXllciA9IGxlZnRMYXllclxuXHRcdFx0XG5cdFx0XHRpZiBGcmFtZXIuRGV2aWNlLmRldmljZVR5cGUuaW5kZXhPZihcImlwaG9uZS02cGx1c1wiKSA+PSAwXG5cdFx0XHRcdEBoZWFkZXJMYXllci5oZWlnaHQgPSAxMzJcblx0XHRcdFx0dGl0bGVMYXllci5oZWlnaHQgPSAxMzJcblx0XHRcdFx0dGl0bGVMYXllci5zdHlsZVtcImZvbnQtc2l6ZVwiXSA9IFwiNDhweFwiXG5cdFx0XHRcdHRpdGxlTGF5ZXIuc3R5bGVbXCJsaW5lLWhlaWdodFwiXSA9IHRpdGxlTGF5ZXIuaGVpZ2h0ICsgXCJweFwiXG5cdFx0XHRcdGxlZnRMYXllci5oZWlnaHQgPSAxMzJcblx0XHRcdFx0bGVmdExheWVyLnN0eWxlW1wiZm9udC1zaXplXCJdID0gXCI0OHB4XCJcblx0XHRcdFx0bGVmdExheWVyLnN0eWxlW1wibGluZS1oZWlnaHRcIl0gPSB0aXRsZUxheWVyLmhlaWdodCArIFwicHhcIlxuXHRcdFx0XHRsZWZ0TGF5ZXIud2lkdGggPSBsZWZ0TGF5ZXIud2lkdGggKiAxLjVcblx0XHRcdFx0YmFja0Fycm93LnNjYWxlID0gMS41XG5cdFx0XHRcdFxuXHRcdGlmIEBvcHRpb25zLnJvb3RMYXllclxuXHRcdFx0QG5hdmlnYXRpb25MYXllcnMgPSBbQG9wdGlvbnMucm9vdExheWVyXVxuXHRcdFx0QGN1cnJlbnRMYXllckluZGV4ID0gMFxuXHRcdFx0QGFkZFN1YkxheWVyKEBvcHRpb25zLnJvb3RMYXllcilcblx0XHRcdEBoZWFkZXJMYXllci5icmluZ1RvRnJvbnQoKVxuXHRcdFx0aWYgQG9wdGlvbnMucm9vdExheWVyLnRpdGxlIGFuZCBAaGVhZGVyTGF5ZXIudGl0bGVMYXllclxuXHRcdFx0XHRAaGVhZGVyTGF5ZXIudGl0bGVMYXllci5odG1sID0gXCI8ZGl2IHN0eWxlPVxcXCJvdmVyZmxvdzogaGlkZGVuOyB0ZXh0LW92ZXJmbG93OiBlbGxpcHNpc1xcXCI+XCIgKyBAb3B0aW9ucy5yb290TGF5ZXIudGl0bGUgKyBcIjwvZGl2PlwiXG5cblx0IyBQdWJsaWMgbWV0aG9kc1xuXHRwdXNoOiAobGF5ZXIpIC0+XG5cdFx0aWYgbm90IEBsb2NrXG5cdFx0XHRAZW1pdChFdmVudHMuTmF2aWdhdGlvbldpbGxQdXNoLCB7bmF2aWdhdGlvbkxheWVyOiBALCBjdXJyZW50TGF5ZXI6IGN1cnJlbnRMYXllciwgbmV4dExheWVyOiBuZXh0TGF5ZXJ9KVxuXHRcdFx0QGxvY2sgPSB0cnVlXG5cdFx0XHRAbmF2aWdhdGlvbkxheWVycy5wdXNoKGxheWVyKVxuXHRcdFx0QGFkZFN1YkxheWVyKGxheWVyKVxuXHRcdFx0aWYgQGhlYWRlckxheWVyXG5cdFx0XHRcdEBoZWFkZXJMYXllci5icmluZ1RvRnJvbnQoKVxuXHRcdFx0Y3VycmVudExheWVyID0gQG5hdmlnYXRpb25MYXllcnNbQGN1cnJlbnRMYXllckluZGV4XVxuXHRcdFx0bmV4dExheWVyID0gbGF5ZXJcblx0XHRcdGlmIHR5cGVvZiBjdXJyZW50TGF5ZXIubGF5ZXJXaWxsRGlzYXBwZWFyIGlzIFwiZnVuY3Rpb25cIlxuXHRcdFx0XHRjdXJyZW50TGF5ZXIubGF5ZXJXaWxsRGlzYXBwZWFyKClcblx0XHRcdGlmIHR5cGVvZiBuZXh0TGF5ZXIubGF5ZXJXaWxsQXBwZWFyIGlzIFwiZnVuY3Rpb25cIlxuXHRcdFx0XHRuZXh0TGF5ZXIubGF5ZXJXaWxsQXBwZWFyKClcblx0XHRcdEBjdXJyZW50TGF5ZXJJbmRleCsrXG5cdFx0XHRAYW5pbWF0aW9uUHVzaChjdXJyZW50TGF5ZXIsIG5leHRMYXllcilcblx0XHRcdEBfZGVmYXVsdEhlYWRlckFuaW1hdGlvblB1c2goY3VycmVudExheWVyLCBuZXh0TGF5ZXIpXG5cdFx0XHRVdGlscy5kZWxheSBAYW5pbWF0aW9uVGltZSwgPT5cblx0XHRcdFx0Y3VycmVudExheWVyLnZpc2libGUgPSBmYWxzZVxuXHRcdFx0XHRAbG9jayA9IGZhbHNlXG5cdFx0XHRcdEBlbWl0KEV2ZW50cy5OYXZpZ2F0aW9uRGlkUHVzaCwge25hdmlnYXRpb25MYXllcjogQCwgY3VycmVudExheWVyOiBjdXJyZW50TGF5ZXIsIG5leHRMYXllcjogbmV4dExheWVyfSlcblx0XHRlbHNlXG5cdFx0XHQjIElmIHRoZXJlIHdhcyBhIHRyYW5zaXRpb25pbmcgZ29pbmcgb24sIGp1c3QgcmVtb3ZlIHRoZSBuZXcgbGF5ZXJcblx0XHRcdGxheWVyLmRlc3Ryb3koKVxuXHRcdFxuXHRwb3A6IC0+XG5cdFx0QHBvcFRvTGF5ZXJBdEluZGV4KEBjdXJyZW50TGF5ZXJJbmRleCAtIDEpXG5cblx0cG9wVG9Sb290TGF5ZXI6IC0+XG5cdFx0QHBvcFRvTGF5ZXJBdEluZGV4KDApXG5cblx0cG9wVG9MYXllckF0SW5kZXg6IChpbmRleCkgLT5cblx0XHRpZiBub3QgQGxvY2tcblx0XHRcdEBsb2NrID0gdHJ1ZVxuXHRcdFx0aWYgQGN1cnJlbnRMYXllckluZGV4ID4gMCBhbmQgKDAgPD0gaW5kZXggPD0gQG5hdmlnYXRpb25MYXllcnMubGVuZ3RoKVxuXHRcdFx0XHRAZW1pdChFdmVudHMuTmF2aWdhdGlvbldpbGxQb3AsIHtuYXZpZ2F0aW9uTGF5ZXI6IEAsIGluZGV4OiBpbmRleCwgY3VycmVudExheWVyOiBjdXJyZW50TGF5ZXIsIG5leHRMYXllcjogbmV4dExheWVyfSlcblx0XHRcdFx0Y3VycmVudExheWVyID0gQG5hdmlnYXRpb25MYXllcnNbQGN1cnJlbnRMYXllckluZGV4XVxuXHRcdFx0XHRuZXh0TGF5ZXIgPSBAbmF2aWdhdGlvbkxheWVyc1tpbmRleF1cblx0XHRcdFx0bmV4dExheWVyLnZpc2libGUgPSB0cnVlXG5cdFx0XHRcdGlmIHR5cGVvZiBjdXJyZW50TGF5ZXIubGF5ZXJXaWxsRGlzYXBwZWFyIGlzIFwiZnVuY3Rpb25cIlxuXHRcdFx0XHRcdGN1cnJlbnRMYXllci5sYXllcldpbGxEaXNhcHBlYXIoKVxuXHRcdFx0XHRpZiB0eXBlb2YgbmV4dExheWVyLmxheWVyV2lsbEFwcGVhciBpcyBcImZ1bmN0aW9uXCJcblx0XHRcdFx0XHRuZXh0TGF5ZXIubGF5ZXJXaWxsQXBwZWFyKClcblx0XHRcdFx0QGFuaW1hdGlvblBvcChjdXJyZW50TGF5ZXIsIG5leHRMYXllcilcblx0XHRcdFx0QF9kZWZhdWx0SGVhZGVyQW5pbWF0aW9uUG9wKGN1cnJlbnRMYXllciwgbmV4dExheWVyLCBpbmRleClcblx0XHRcdFx0VXRpbHMuZGVsYXkgQGFuaW1hdGlvblRpbWUsID0+XG5cdFx0XHRcdFx0Zm9yIGluZGV4VG9CZURlbGV0ZWQgaW4gW0BuYXZpZ2F0aW9uTGF5ZXJzLmxlbmd0aC0xLi5pbmRleCsxXVxuXHRcdFx0XHRcdFx0bGF5ZXJUb0JlRGVsZXRlZCA9IEBuYXZpZ2F0aW9uTGF5ZXJzW2luZGV4VG9CZURlbGV0ZWRdXG5cdFx0XHRcdFx0XHRsYXllclRvQmVEZWxldGVkLmRlc3Ryb3koKVxuXHRcdFx0XHRcdFx0QG5hdmlnYXRpb25MYXllcnMucG9wKClcblx0XHRcdFx0XHRAY3VycmVudExheWVySW5kZXggPSBpbmRleFxuXHRcdFx0XHRcdEBsb2NrID0gZmFsc2Vcblx0XHRcdFx0XHRAZW1pdChFdmVudHMuTmF2aWdhdGlvbkRpZFBvcCwge25hdmlnYXRpb25MYXllcjogQCwgaW5kZXg6IGluZGV4LCBjdXJyZW50TGF5ZXI6IGN1cnJlbnRMYXllciwgbmV4dExheWVyOiBuZXh0TGF5ZXJ9KVxuXHRcdFx0ZWxzZVxuXHRcdFx0XHRAbG9jayA9IGZhbHNlXG5cblx0IyBQcml2YXRlIG1ldGhvZHNcblxuXHRfYW5pbWF0ZUhlYWRlclN1YkxheWVyOiAoc3ViTGF5ZXJOYW1lLCBmcm9tTGF5ZXIsIHRvTGF5ZXIsIG5ld1RpdGxlLCBjdXJyZW50VG9YLCBuZXdGcm9tWCkgLT5cblx0XHRpZiBAaGVhZGVyTGF5ZXJbc3ViTGF5ZXJOYW1lXVxuXHRcdFx0aGVhZGVyU3ViTGF5ZXIgPSBAaGVhZGVyTGF5ZXJbc3ViTGF5ZXJOYW1lXVxuXHRcdFx0b3JpZ1N1YkxheWVyWCA9IGhlYWRlclN1YkxheWVyLnhcblx0XHRcdFx0XG5cdFx0XHQjIEFuaW1hdGUgY3VycmVudCBzdWJsYXllclxuXHRcdFx0aGVhZGVyU3ViTGF5ZXIuYW5pbWF0ZVxuXHRcdFx0XHRwcm9wZXJ0aWVzOlxuXHRcdFx0XHRcdG9wYWNpdHk6IDBcblx0XHRcdFx0XHR4OiBjdXJyZW50VG9YXG5cdFx0XHRcdGN1cnZlOiBfQU5JTUFUSU9OX0NVUlZFXG5cdFx0XHRcdHRpbWU6IF9BTklNQVRJT05fVElNRVxuXHRcdFx0XG5cdFx0XHQjQ3JlYXRlIG5ldyBsYXllciB0byBhbmltYXRlXG5cdFx0XHRpZiBuZXdUaXRsZSBpc250IHVuZGVmaW5lZFxuXHRcdFx0XHRuZXdIZWFkZXJTdWJMYXllciA9IGhlYWRlclN1YkxheWVyLmNvcHkoKVxuXHRcdFx0XHRuZXdIZWFkZXJTdWJMYXllci5zdHlsZSA9IGhlYWRlclN1YkxheWVyLnN0eWxlXG5cdFx0XHRcdEBoZWFkZXJMYXllci5hZGRTdWJMYXllcihuZXdIZWFkZXJTdWJMYXllcilcblx0XHRcdFx0bmV3SGVhZGVyU3ViTGF5ZXIubmFtZSA9IFwidG1wIFwiICsgc3ViTGF5ZXJOYW1lXG5cdFx0XHRcdG5ld0hlYWRlclN1YkxheWVyLnggPSBuZXdGcm9tWFxuXHRcdFx0XHRuZXdIZWFkZXJTdWJMYXllci5vcGFjaXR5ID0gMFxuXHRcdFx0XHRuZXdIZWFkZXJTdWJMYXllci5odG1sID0gXCI8ZGl2IHN0eWxlPVxcXCJvdmVyZmxvdzogaGlkZGVuOyB0ZXh0LW92ZXJmbG93OiBlbGxpcHNpc1xcXCI+XCIgKyBuZXdUaXRsZSArIFwiPC9kaXY+XCJcblx0XHRcdFx0bmV3SGVhZGVyU3ViTGF5ZXJBbmltYXRpb24gPSBuZXcgQW5pbWF0aW9uXG5cdFx0XHRcdFx0bGF5ZXI6IG5ld0hlYWRlclN1YkxheWVyXG5cdFx0XHRcdFx0cHJvcGVydGllczpcblx0XHRcdFx0XHRcdG9wYWNpdHk6IDFcblx0XHRcdFx0XHRcdHg6IG9yaWdTdWJMYXllclhcblx0XHRcdFx0XHRjdXJ2ZTogX0FOSU1BVElPTl9DVVJWRVxuXHRcdFx0XHRcdHRpbWU6IF9BTklNQVRJT05fVElNRVxuXHRcdFx0XHRuZXdIZWFkZXJTdWJMYXllckFuaW1hdGlvbi5zdGFydCgpXG5cdFx0XHRcdG5ld0hlYWRlclN1YkxheWVyQW5pbWF0aW9uLm9uIFwiZW5kXCIsIC0+XG5cdFx0XHRcdFx0aGVhZGVyU3ViTGF5ZXIuaHRtbCA9IG5ld0hlYWRlclN1YkxheWVyLmh0bWxcblx0XHRcdFx0XHRoZWFkZXJTdWJMYXllci5vcGFjaXR5ID0gMVxuXHRcdFx0XHRcdGhlYWRlclN1YkxheWVyLnggPSBvcmlnU3ViTGF5ZXJYXG5cdFx0XHRcdFx0bmV3SGVhZGVyU3ViTGF5ZXIuZGVzdHJveSgpXG5cblx0X2RlZmF1bHRIZWFkZXJBbmltYXRpb25QdXNoOiAoZnJvbUxheWVyLCB0b0xheWVyKS0+XG5cdFx0aWYgQGhlYWRlckxheWVyIGFuZCBub3QgQGN1c3RvbUhlYWRlclxuXHRcdFx0XG5cdFx0XHRAX2FuaW1hdGVIZWFkZXJTdWJMYXllcihcInRpdGxlTGF5ZXJcIiwgZnJvbUxheWVyLCB0b0xheWVyLCB0b0xheWVyLnRpdGxlLCAtX0xFRlRfUEFERElORywgQGhlYWRlckxheWVyLndpZHRoKVxuXG5cdFx0XHRAX2FuaW1hdGVIZWFkZXJTdWJMYXllcihcImxlZnRMYXllclwiLCBmcm9tTGF5ZXIsIHRvTGF5ZXIsIGZyb21MYXllci50aXRsZSwgLSBAaGVhZGVyTGF5ZXIud2lkdGggLyAyLCBAaGVhZGVyTGF5ZXIud2lkdGggLyAyKVxuXG5cdFx0XHRpZiBAaGVhZGVyTGF5ZXIuYmFja0Fycm93XG5cdFx0XHRcdEBoZWFkZXJMYXllci5iYWNrQXJyb3cuYW5pbWF0ZVxuXHRcdFx0XHRcdHByb3BlcnRpZXM6XG5cdFx0XHRcdFx0XHRvcGFjaXR5OiAxXG5cdFx0XHRcdFx0Y3VydmU6IF9BTklNQVRJT05fQ1VSVkVcblx0XHRcdFx0XHR0aW1lOiBfQU5JTUFUSU9OX1RJTUVcblxuXHRfZGVmYXVsdEhlYWRlckFuaW1hdGlvblBvcDogKGZyb21MYXllciwgdG9MYXllciwgaW5kZXgpLT5cblx0XHQjQW5pbWF0ZSBoZWFkZXJcblx0XHRpZiBAaGVhZGVyTGF5ZXIgYW5kIG5vdCBAY3VzdG9tSGVhZGVyXG5cblx0XHRcdEBfYW5pbWF0ZUhlYWRlclN1YkxheWVyKFwidGl0bGVMYXllclwiLCBmcm9tTGF5ZXIsIHRvTGF5ZXIsIHRvTGF5ZXIudGl0bGUsIEBoZWFkZXJMYXllci53aWR0aCwgMClcblx0XHRcdFxuXHRcdFx0bmV3TGVmdExheWVyVGl0bGUgPSBcIlwiXG5cdFx0XHRpZiBAbmF2aWdhdGlvbkxheWVyc1tpbmRleCAtIDFdIGFuZCBAbmF2aWdhdGlvbkxheWVyc1tpbmRleCAtIDFdLnRpdGxlXG5cdFx0XHRcdG5ld0xlZnRMYXllclRpdGxlID0gQG5hdmlnYXRpb25MYXllcnNbaW5kZXggLSAxXS50aXRsZVxuXHRcdFx0ZWxzZSBcblx0XHRcdFx0aWYgQGhlYWRlckxheWVyLmJhY2tBcnJvd1xuXHRcdFx0XHRcdEBoZWFkZXJMYXllci5iYWNrQXJyb3cuYW5pbWF0ZVxuXHRcdFx0XHRcdFx0cHJvcGVydGllczpcblx0XHRcdFx0XHRcdFx0b3BhY2l0eTogMFxuXHRcdFx0XHRcdFx0Y3VydmU6IF9BTklNQVRJT05fQ1VSVkVcblx0XHRcdFx0XHRcdHRpbWU6IF9BTklNQVRJT05fVElNRVxuXHRcdFx0QF9hbmltYXRlSGVhZGVyU3ViTGF5ZXIoXCJsZWZ0TGF5ZXJcIiwgZnJvbUxheWVyLCB0b0xheWVyLCBuZXdMZWZ0TGF5ZXJUaXRsZSwgQGhlYWRlckxheWVyLndpZHRoIC8gMiwgLUBoZWFkZXJMYXllci53aWR0aCAvIDIpXG5cdFx0XHRcblxuXHRfZGVmYXVsdEFuaW1hdGlvblB1c2g6IChmcm9tTGF5ZXIsIHRvTGF5ZXIpIC0+XG5cdFx0c2hhZG93TGF5ZXIgPSBuZXcgTGF5ZXJcblx0XHRcdHN1cGVyTGF5ZXI6IGZyb21MYXllclxuXHRcdFx0d2lkdGg6IGZyb21MYXllci53aWR0aFxuXHRcdFx0aGVpZ2h0OiBmcm9tTGF5ZXIuaGVpZ2h0XG5cdFx0XHRuYW1lOiBcInNoYWRvd0xheWVyXCJcblx0XHRcdGJhY2tncm91bmRDb2xvcjogXCJibGFja1wiXG5cdFx0XHRvcGFjaXR5OiAwXG5cdFx0c2hhZG93TGF5ZXIuYW5pbWF0ZVxuXHRcdFx0cHJvcGVydGllczpcblx0XHRcdFx0b3BhY2l0eTogMC4yXG5cdFx0XHRjdXJ2ZTogX0FOSU1BVElPTl9DVVJWRVxuXHRcdFx0dGltZTogX0FOSU1BVElPTl9USU1FXG5cdFx0ZnJvbUxheWVyLmFuaW1hdGVcblx0XHRcdHByb3BlcnRpZXM6XG5cdFx0XHRcdHg6IC1Ad2lkdGggKiAwLjI1XG5cdFx0XHRjdXJ2ZTogX0FOSU1BVElPTl9DVVJWRVxuXHRcdFx0dGltZTogX0FOSU1BVElPTl9USU1FXG5cdFx0dG9MYXllci5zaGFkb3dDb2xvciA9IFwicmdiYSgwLDAsMCwwLjIpXCJcblx0XHR0b0xheWVyLnNoYWRvd1ggPSAtMTBcblx0XHR0b0xheWVyLnNoYWRvd0JsdXIgPSAxNFxuXHRcdHRvTGF5ZXIueCA9IEB3aWR0aCArICgtdG9MYXllci5zaGFkb3dYKVxuXHRcdHRvTGF5ZXIuYW5pbWF0ZVxuXHRcdFx0cHJvcGVydGllczpcblx0XHRcdFx0eDogMFxuXHRcdFx0Y3VydmU6IF9BTklNQVRJT05fQ1VSVkVcblx0XHRcdHRpbWU6IF9BTklNQVRJT05fVElNRVxuXG5cdFx0XHRcblx0X2RlZmF1bHRBbmltYXRpb25Qb3A6IChmcm9tTGF5ZXIsIHRvTGF5ZXIpIC0+XG5cdFx0ZnJvbUxheWVyLmFuaW1hdGVcblx0XHRcdHByb3BlcnRpZXM6XG5cdFx0XHRcdHg6IEB3aWR0aCArICgtZnJvbUxheWVyLnNoYWRvd1gpXG5cdFx0XHRjdXJ2ZTogX0FOSU1BVElPTl9DVVJWRVxuXHRcdFx0dGltZTogX0FOSU1BVElPTl9USU1FXG5cdFx0dG9MYXllci5hbmltYXRlXG5cdFx0XHRwcm9wZXJ0aWVzOlxuXHRcdFx0XHR4OiAwXG5cdFx0XHRjdXJ2ZTogX0FOSU1BVElPTl9DVVJWRVxuXHRcdFx0dGltZTogX0FOSU1BVElPTl9USU1FXG5cdFx0c2hhZG93TGF5ZXIgPSB0b0xheWVyLnN1YkxheWVyc0J5TmFtZShcInNoYWRvd0xheWVyXCIpWzBdXG5cdFx0c2hhZG93TGF5ZXJBbmltYXRpb24gPSBuZXcgQW5pbWF0aW9uXG5cdFx0XHRsYXllcjogc2hhZG93TGF5ZXJcblx0XHRcdHByb3BlcnRpZXM6XG5cdFx0XHRcdG9wYWNpdHk6IDBcblx0XHRcdGN1cnZlOiBfQU5JTUFUSU9OX0NVUlZFXG5cdFx0XHR0aW1lOiBfQU5JTUFUSU9OX1RJTUVcblx0XHRzaGFkb3dMYXllckFuaW1hdGlvbi5zdGFydCgpXG5cdFx0c2hhZG93TGF5ZXJBbmltYXRpb24ub24gXCJlbmRcIiwgLT5cblx0XHRcdHNoYWRvd0xheWVyLmRlc3Ryb3koKVxuXHRcdFxuIiwiIyBBZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRvIHlvdXIgcHJvamVjdCBpbiBGcmFtZXIgU3R1ZGlvLiBcbiMgbXlNb2R1bGUgPSByZXF1aXJlIFwibXlNb2R1bGVcIlxuIyBSZWZlcmVuY2UgdGhlIGNvbnRlbnRzIGJ5IG5hbWUsIGxpa2UgbXlNb2R1bGUubXlGdW5jdGlvbigpIG9yIG15TW9kdWxlLm15VmFyXG5cbmV4cG9ydHMubXlWYXIgPSBcIm15VmFyaWFibGVcIlxuXG5leHBvcnRzLm15RnVuY3Rpb24gPSAtPlxuXHRwcmludCBcIm15RnVuY3Rpb24gaXMgcnVubmluZ1wiXG5cbmV4cG9ydHMubXlBcnJheSA9IFsxLCAyLCAzXSIsImNsYXNzIGV4cG9ydHMuVmlld05hdmlnYXRpb25Db250cm9sbGVyIGV4dGVuZHMgTGF5ZXJcblxuXHQjIFNldHVwIENsYXNzIENvbnN0YW50c1xuXHRJTklUSUFMX1ZJRVdfTkFNRSA9IFwiaW5pdGlhbFZpZXdcIlxuXG5cdEJBQ0tCVVRUT05fVklFV19OQU1FID0gXCJ2bmMtYmFja0J1dHRvblwiXG5cblx0QU5JTUFUSU9OX09QVElPTlMgPSBcblx0XHR0aW1lOiAwLjNcblx0XHRjdXJ2ZTogXCJlYXNlLWluLW91dFwiXG5cblx0QkFDS19CVVRUT05fRlJBTUUgPSBcblx0XHR4OiAwXG5cdFx0eTogNDBcblx0XHR3aWR0aDogODhcblx0XHRoZWlnaHQ6IDg4XG5cblx0UFVTSCA9XG5cdFx0VVA6ICAgICBcInB1c2hVcFwiXG5cdFx0RE9XTjogICBcInB1c2hEb3duXCJcblx0XHRMRUZUOiAgIFwicHVzaExlZnRcIlxuXHRcdFJJR0hUOiAgXCJwdXNoUmlnaHRcIlxuXHRcdENFTlRFUjogXCJwdXNoQ2VudGVyXCJcblxuXHRESVIgPVxuXHRcdFVQOiAgICBcInVwXCJcblx0XHRET1dOOiAgXCJkb3duXCJcblx0XHRMRUZUOiAgXCJsZWZ0XCJcblx0XHRSSUdIVDogXCJyaWdodFwiXG5cblx0REVCVUdfTU9ERSA9IGZhbHNlXG5cblx0IyBTZXR1cCBJbnN0YW5jZSBhbmQgSW5zdGFuY2UgVmFyaWFibGVzXG5cdGNvbnN0cnVjdG9yOiAoQG9wdGlvbnM9e30pIC0+XG5cblx0XHRAdmlld3MgPSBAaGlzdG9yeSA9IEBpbml0aWFsVmlldyA9IEBjdXJyZW50VmlldyA9IEBwcmV2aW91c1ZpZXcgPSBAaW5pdGlhbFZpZXdOYW1lID0gbnVsbFxuXHRcdEBvcHRpb25zLndpZHRoICAgICAgICAgICA/PSBTY3JlZW4ud2lkdGhcblx0XHRAb3B0aW9ucy5oZWlnaHQgICAgICAgICAgPz0gU2NyZWVuLmhlaWdodFxuXHRcdEBvcHRpb25zLmNsaXAgICAgICAgICAgICA/PSB0cnVlXG5cdFx0QG9wdGlvbnMuYmFja2dyb3VuZENvbG9yID89IFwiIzk5OVwiXG5cblx0XHRzdXBlciBAb3B0aW9uc1xuXG5cdFx0QHZpZXdzICAgPSBbXVxuXHRcdEBoaXN0b3J5ID0gW11cblx0XHRAYW5pbWF0aW9uT3B0aW9ucyA9IEBvcHRpb25zLmFuaW1hdGlvbk9wdGlvbnMgb3IgQU5JTUFUSU9OX09QVElPTlNcblx0XHRAaW5pdGlhbFZpZXdOYW1lICA9IEBvcHRpb25zLmluaXRpYWxWaWV3TmFtZSAgb3IgSU5JVElBTF9WSUVXX05BTUVcblx0XHRAYmFja0J1dHRvbkZyYW1lICA9IEBvcHRpb25zLmJhY2tCdXR0b25GcmFtZSAgb3IgQkFDS19CVVRUT05fRlJBTUVcblxuXHRcdEBkZWJ1Z01vZGUgPSBpZiBAb3B0aW9ucy5kZWJ1Z01vZGU/IHRoZW4gQG9wdGlvbnMuZGVidWdNb2RlIGVsc2UgREVCVUdfTU9ERVxuXG5cdFx0QC5vbiBcImNoYW5nZTpzdWJMYXllcnNcIiwgKGNoYW5nZUxpc3QpIC0+XG5cdFx0XHRVdGlscy5kZWxheSAwLCA9PlxuXHRcdFx0XHRAYWRkVmlldyBzdWJMYXllciwgdHJ1ZSBmb3Igc3ViTGF5ZXIgaW4gY2hhbmdlTGlzdC5hZGRlZFxuXG5cdGFkZFZpZXc6ICh2aWV3LCB2aWFJbnRlcm5hbENoYW5nZUV2ZW50KSAtPlxuXG5cdFx0dm5jV2lkdGggID0gQG9wdGlvbnMud2lkdGhcblx0XHR2bmNIZWlnaHQgPSBAb3B0aW9ucy5oZWlnaHRcblxuXHRcdHZpZXcuc3RhdGVzLmFkZFxuXHRcdFx0XCIjeyBQVVNILlVQIH1cIjpcblx0XHRcdFx0eDogMFxuXHRcdFx0XHR5OiAtdm5jSGVpZ2h0XG5cdFx0XHRcIiN7IFBVU0guTEVGVCB9XCI6XG5cdFx0XHRcdHg6IC12bmNXaWR0aFxuXHRcdFx0XHR5OiAwXG5cdFx0XHRcIiN7IFBVU0guQ0VOVEVSIH1cIjpcblx0XHRcdFx0eDogMFxuXHRcdFx0XHR5OiAwXG5cdFx0XHRcIiN7IFBVU0guUklHSFQgfVwiOlxuXHRcdFx0XHR4OiB2bmNXaWR0aFxuXHRcdFx0XHR5OiAwXG5cdFx0XHRcIiN7IFBVU0guRE9XTiB9XCI6XG5cdFx0XHRcdHg6IDBcblx0XHRcdFx0eTogdm5jSGVpZ2h0XG5cblx0XHR2aWV3LnN0YXRlcy5hbmltYXRpb25PcHRpb25zID0gQGFuaW1hdGlvbk9wdGlvbnNcblxuXHRcdGlmIHZpZXcubmFtZSBpcyBAaW5pdGlhbFZpZXdOYW1lXG5cdFx0XHRAaW5pdGlhbFZpZXcgPSB2aWV3XG5cdFx0XHRAY3VycmVudFZpZXcgPSB2aWV3XG5cdFx0XHR2aWV3LnN0YXRlcy5zd2l0Y2hJbnN0YW50IFBVU0guQ0VOVEVSXG5cdFx0XHRAaGlzdG9yeS5wdXNoIHZpZXdcblx0XHRlbHNlXG5cdFx0XHR2aWV3LnN0YXRlcy5zd2l0Y2hJbnN0YW50IFBVU0guUklHSFRcblxuXHRcdHVubGVzcyB2aWV3LnN1cGVyTGF5ZXIgaXMgQCBvciB2aWFJbnRlcm5hbENoYW5nZUV2ZW50XG5cdFx0XHR2aWV3LnN1cGVyTGF5ZXIgPSBAXG5cblx0XHRAX2FwcGx5QmFja0J1dHRvbiB2aWV3IHVubGVzcyB2aWV3Lm5hbWUgaXMgQGluaXRpYWxWaWV3TmFtZVxuXG5cdFx0QHZpZXdzLnB1c2ggdmlld1xuXG5cdHRyYW5zaXRpb246ICh2aWV3LCBkaXJlY3Rpb24gPSBESVIuUklHSFQsIHN3aXRjaEluc3RhbnQgPSBmYWxzZSwgcHJldmVudEhpc3RvcnkgPSBmYWxzZSkgLT5cblxuXHRcdHJldHVybiBmYWxzZSBpZiB2aWV3IGlzIEBjdXJyZW50Vmlld1xuXG5cdFx0IyBTZXR1cCBWaWV3cyBmb3IgdGhlIHRyYW5zaXRpb25cblx0XHRpZiBkaXJlY3Rpb24gaXMgRElSLlJJR0hUXG5cdFx0XHR2aWV3LnN0YXRlcy5zd2l0Y2hJbnN0YW50ICBQVVNILlJJR0hUXG5cdFx0XHRAY3VycmVudFZpZXcuc3RhdGVzLnN3aXRjaCBQVVNILkxFRlRcblx0XHRlbHNlIGlmIGRpcmVjdGlvbiBpcyBESVIuRE9XTlxuXHRcdFx0dmlldy5zdGF0ZXMuc3dpdGNoSW5zdGFudCAgUFVTSC5ET1dOXG5cdFx0XHRAY3VycmVudFZpZXcuc3RhdGVzLnN3aXRjaCBQVVNILlVQXG5cdFx0ZWxzZSBpZiBkaXJlY3Rpb24gaXMgRElSLkxFRlRcblx0XHRcdHZpZXcuc3RhdGVzLnN3aXRjaEluc3RhbnQgIFBVU0guTEVGVFxuXHRcdFx0QGN1cnJlbnRWaWV3LnN0YXRlcy5zd2l0Y2ggUFVTSC5SSUdIVFxuXHRcdGVsc2UgaWYgZGlyZWN0aW9uIGlzIERJUi5VUFxuXHRcdFx0dmlldy5zdGF0ZXMuc3dpdGNoSW5zdGFudCAgUFVTSC5VUFxuXHRcdFx0QGN1cnJlbnRWaWV3LnN0YXRlcy5zd2l0Y2ggUFVTSC5ET1dOXG5cdFx0ZWxzZVxuXHRcdFx0IyBJZiB0aGV5IHNwZWNpZmllZCBzb21ldGhpbmcgZGlmZmVyZW50IGp1c3Qgc3dpdGNoIGltbWVkaWF0ZWx5XG5cdFx0XHR2aWV3LnN0YXRlcy5zd2l0Y2hJbnN0YW50IFBVU0guQ0VOVEVSXG5cdFx0XHRAY3VycmVudFZpZXcuc3RhdGVzLnN3aXRjaEluc3RhbnQgUFVTSC5MRUZUXG5cblx0XHQjIFB1c2ggdmlldyB0byBDZW50ZXJcblx0XHR2aWV3LnN0YXRlcy5zd2l0Y2ggUFVTSC5DRU5URVJcblx0XHQjIGN1cnJlbnRWaWV3IGlzIG5vdyBvdXIgcHJldmlvdXNWaWV3XG5cdFx0QHByZXZpb3VzVmlldyA9IEBjdXJyZW50Vmlld1xuXHRcdCMgU2F2ZSB0cmFuc2l0aW9uIGRpcmVjdGlvbiB0byB0aGUgbGF5ZXIncyBjdXN0b20gcHJvcGVydGllc1xuXHRcdEBwcmV2aW91c1ZpZXcuY3VzdG9tID1cblx0XHRcdGxhc3RUcmFuc2l0aW9uOiBkaXJlY3Rpb25cblx0XHQjIFNldCBvdXIgY3VycmVudFZpZXcgdG8gdGhlIHZpZXcgd2UndmUgYnJvdWdodCBpblxuXHRcdEBjdXJyZW50VmlldyA9IHZpZXdcblxuXHRcdCMgU3RvcmUgdGhlIGxhc3QgdmlldyBpbiBoaXN0b3J5XG5cdFx0QGhpc3RvcnkucHVzaCBAcHJldmlvdXNWaWV3IGlmIHByZXZlbnRIaXN0b3J5IGlzIGZhbHNlXG5cdFx0XG5cdFx0IyBFbWl0IGFuIGV2ZW50IHNvIHRoZSBwcm90b3R5cGUgY2FuIHJlYWN0IHRvIGEgdmlldyBjaGFuZ2Vcblx0XHRAZW1pdCBcImNoYW5nZTp2aWV3XCJcblxuXHRyZW1vdmVCYWNrQnV0dG9uOiAodmlldykgLT5cblx0XHRVdGlscy5kZWxheSAwLjEsID0+XG5cdFx0XHR2aWV3LnN1YkxheWVyc0J5TmFtZShCQUNLQlVUVE9OX1ZJRVdfTkFNRSlbMF0udmlzaWJsZSA9IGZhbHNlXG5cblx0YmFjazogKCkgLT5cblx0XHRsYXN0VmlldyA9IEBfZ2V0TGFzdEhpc3RvcnlJdGVtKClcblx0XHRsYXN0VHJhbnNpdGlvbiA9IGxhc3RWaWV3LmN1c3RvbS5sYXN0VHJhbnNpdGlvblxuXHRcdG9wcG9zaXRlVHJhbnNpdGlvbiA9IEBfZ2V0T3Bwb3NpdGVEaXJlY3Rpb24obGFzdFRyYW5zaXRpb24pXG5cdFx0QHRyYW5zaXRpb24obGFzdFZpZXcsIGRpcmVjdGlvbiA9IG9wcG9zaXRlVHJhbnNpdGlvbiwgc3dpdGNoSW5zdGFudCA9IGZhbHNlLCBwcmV2ZW50SGlzdG9yeSA9IHRydWUpXG5cdFx0QGhpc3RvcnkucG9wKClcblxuXHRfZ2V0TGFzdEhpc3RvcnlJdGVtOiAoKSAtPlxuXHRcdHJldHVybiBAaGlzdG9yeVtAaGlzdG9yeS5sZW5ndGggLSAxXVxuXG5cdF9hcHBseUJhY2tCdXR0b246ICh2aWV3LCBmcmFtZSA9IEBiYWNrQnV0dG9uRnJhbWUpIC0+XG5cdFx0VXRpbHMuZGVsYXkgMCwgPT5cblx0XHRcdGlmIHZpZXcuYmFja0J1dHRvbiBpc250IGZhbHNlXG5cdFx0XHRcdGJhY2tCdXR0b24gPSBuZXcgTGF5ZXJcblx0XHRcdFx0XHRuYW1lOiBCQUNLQlVUVE9OX1ZJRVdfTkFNRVxuXHRcdFx0XHRcdHdpZHRoOiA4MFxuXHRcdFx0XHRcdGhlaWdodDogODBcblx0XHRcdFx0XHRzdXBlckxheWVyOiB2aWV3XG5cblx0XHRcdFx0aWYgQGRlYnVnTW9kZSBpcyBmYWxzZVxuXHRcdFx0XHRcdGJhY2tCdXR0b24uYmFja2dyb3VuZENvbG9yID0gXCJ0cmFuc3BhcmVudFwiXG5cblx0XHRcdFx0YmFja0J1dHRvbi5mcmFtZSA9IGZyYW1lXG5cblx0XHRcdFx0YmFja0J1dHRvbi5vbiBFdmVudHMuQ2xpY2ssID0+XG5cdFx0XHRcdFx0QGJhY2soKVxuXG5cdF9nZXRPcHBvc2l0ZURpcmVjdGlvbjogKGluaXRpYWxEaXJlY3Rpb24pIC0+XG5cdFx0aWYgaW5pdGlhbERpcmVjdGlvbiBpcyBESVIuVVBcblx0XHRcdHJldHVybiBESVIuRE9XTlxuXHRcdGVsc2UgaWYgaW5pdGlhbERpcmVjdGlvbiBpcyBESVIuRE9XTlxuXHRcdFx0cmV0dXJuIERJUi5VUFxuXHRcdGVsc2UgaWYgaW5pdGlhbERpcmVjdGlvbiBpcyBESVIuUklHSFRcblx0XHRcdHJldHVybiBESVIuTEVGVFxuXHRcdGVsc2UgaWYgaW5pdGlhbERpcmVjdGlvbiBpcyBESVIuTEVGVFxuXHRcdFx0cmV0dXJuIERJUi5SSUdIVFxuXHRcdGVsc2Vcblx0XHRcdHJldHVybiBESVIuTEVGVFxuXG4jIyNcblxuVVNBR0UgRVhBTVBMRSAxIC0gRGVmaW5lIEluaXRpYWxWaWV3TmFtZVxuXG5pbml0aWFsVmlld0tleSA9IFwidmlldzFcIlxuXG52bmMgPSBuZXcgVmlld05hdmlnYXRpb25Db250cm9sbGVyXG5cdGluaXRpYWxWaWV3TmFtZTogaW5pdGlhbFZpZXdLZXlcblxudmlldzEgPSBuZXcgTGF5ZXJcblx0bmFtZTogaW5pdGlhbFZpZXdLZXlcblx0d2lkdGg6ICBTY3JlZW4ud2lkdGhcblx0aGVpZ2h0OiBTY3JlZW4uaGVpZ2h0XG5cdGJhY2tncm91bmRDb2xvcjogXCJyZWRcIlxuXHRwYXJlbnQ6IHZuY1xuXG4jIyNcbiMjI1xuXG5VU0FHRSBFWEFNUExFIDIgLSBVc2UgZGVmYXVsdCBpbml0aWFsVmlld05hbWUgXCJpbml0aWFsVmlld1wiXG5cbnZuYyA9IG5ldyBWaWV3TmF2aWdhdGlvbkNvbnRyb2xsZXJcblxudmlldzEgPSBuZXcgTGF5ZXJcblx0bmFtZTogXCJpbml0aWFsVmlld1wiXG5cdHdpZHRoOiAgU2NyZWVuLndpZHRoXG5cdGhlaWdodDogU2NyZWVuLmhlaWdodFxuXHRiYWNrZ3JvdW5kQ29sb3I6IFwicmVkXCJcblx0cGFyZW50OiB2bmNcblxudmlldzIgPSBuZXcgTGF5ZXJcblx0d2lkdGg6ICBTY3JlZW4ud2lkdGhcblx0aGVpZ2h0OiBTY3JlZW4uaGVpZ2h0XG5cdGJhY2tncm91bmRDb2xvcjogXCJncmVlblwiXG5cdHBhcmVudDogdm5jXG5cbnZpZXcxLm9uQ2xpY2sgLT5cblx0dm5jLnRyYW5zaXRpb24gdmlldzJcblxudmlldzIub25DbGljayAtPlxuXHR2bmMuYmFjaygpXG5cbiMjIyIsImNsYXNzIG1vZHVsZS5leHBvcnRzIGV4dGVuZHMgTGF5ZXJcblx0XHRcblx0Y29uc3RydWN0b3I6IChvcHRpb25zPXt9KSAtPlxuXHRcdG9wdGlvbnMud2lkdGggPz0gU2NyZWVuLndpZHRoXG5cdFx0b3B0aW9ucy5oZWlnaHQgPz0gU2NyZWVuLmhlaWdodFxuXHRcdG9wdGlvbnMuY2xpcCA/PSB0cnVlXG5cdFx0b3B0aW9ucy5pbml0aWFsVmlld05hbWUgPz0gJ2luaXRpYWxWaWV3J1xuXHRcdG9wdGlvbnMuYmFja0J1dHRvbk5hbWUgPz0gJ2JhY2tCdXR0b24nXG5cdFx0b3B0aW9ucy5hbmltYXRpb25PcHRpb25zID89IHsgY3VydmU6IFwiY3ViaWMtYmV6aWVyKDAuMTksIDEsIDAuMjIsIDEpXCIsIHRpbWU6IC43IH1cblx0XHRvcHRpb25zLmJhY2tncm91bmRDb2xvciA/PSBcImJsYWNrXCJcblx0XHRvcHRpb25zLnNjcm9sbCA/PSBmYWxzZVxuXHRcdG9wdGlvbnMuYXV0b0xpbmsgPz0gdHJ1ZVxuXG5cdFx0c3VwZXIgb3B0aW9uc1xuXHRcdEBoaXN0b3J5ID0gW11cblxuXHRcdEBvbkNoYW5nZSBcInN1YkxheWVyc1wiLCAoY2hhbmdlTGlzdCkgPT5cblx0XHRcdHZpZXcgPSBjaGFuZ2VMaXN0LmFkZGVkWzBdXG5cdFx0XHRpZiB2aWV3P1xuXHRcdFx0XHQjIGRlZmF1bHQgYmVoYXZpb3JzIGZvciB2aWV3c1xuXHRcdFx0XHR2aWV3LmNsaXAgPSB0cnVlXG5cdFx0XHRcdHZpZXcub24gRXZlbnRzLkNsaWNrLCAtPiByZXR1cm4gIyBwcmV2ZW50IGNsaWNrLXRocm91Z2gvYnViYmxpbmdcblx0XHRcdFx0IyBhZGQgc2Nyb2xsY29tcG9uZW50XG5cdFx0XHRcdGlmIEBzY3JvbGxcblx0XHRcdFx0XHRjaGlsZHJlbiA9IHZpZXcuY2hpbGRyZW5cblx0XHRcdFx0XHRzY3JvbGxDb21wb25lbnQgPSBuZXcgU2Nyb2xsQ29tcG9uZW50XG5cdFx0XHRcdFx0XHRuYW1lOiBcInNjcm9sbENvbXBvbmVudFwiXG5cdFx0XHRcdFx0XHR3aWR0aDogQHdpZHRoXG5cdFx0XHRcdFx0XHRoZWlnaHQ6IEBoZWlnaHRcblx0XHRcdFx0XHRcdHBhcmVudDogdmlld1xuXHRcdFx0XHRcdHNjcm9sbENvbXBvbmVudC5jb250ZW50LmJhY2tncm91bmRDb2xvciA9IFwiXCJcblx0XHRcdFx0XHRpZiB2aWV3LndpZHRoIDw9IEB3aWR0aFxuXHRcdFx0XHRcdFx0c2Nyb2xsQ29tcG9uZW50LnNjcm9sbEhvcml6b250YWwgPSBmYWxzZVxuXHRcdFx0XHRcdGlmIHZpZXcuaGVpZ2h0IDw9IEBoZWlnaHRcblx0XHRcdFx0XHRcdHNjcm9sbENvbXBvbmVudC5zY3JvbGxWZXJ0aWNhbCA9IGZhbHNlXG5cdFx0XHRcdFx0Zm9yIGMgaW4gY2hpbGRyZW5cblx0XHRcdFx0XHRcdGMucGFyZW50ID0gc2Nyb2xsQ29tcG9uZW50LmNvbnRlbnRcblx0XHRcdFx0XHR2aWV3LnNjcm9sbENvbXBvbmVudCA9IHNjcm9sbENvbXBvbmVudCAjIG1ha2UgaXQgYWNjZXNzaWJsZSBhcyBhIHByb3BlcnR5XG5cdFx0XHRcdFx0IyByZXNldCBzaXplIHNpbmNlIGNvbnRlbnQgbW92ZWQgdG8gc2Nyb2xsQ29tcG9uZW50LiBwcmV2ZW50cyBzY3JvbGwgYnVnIHdoZW4gZHJhZ2dpbmcgb3V0c2lkZS5cblx0XHRcdFx0XHR2aWV3LnNpemUgPSB7d2lkdGg6IEB3aWR0aCwgaGVpZ2h0OiBAaGVpZ2h0fVxuXG5cdFx0dHJhbnNpdGlvbnMgPVxuXHRcdFx0c3dpdGNoSW5zdGFudDoge31cblx0XHRcdGZhZGVJbjpcblx0XHRcdFx0bmV3Vmlldzpcblx0XHRcdFx0XHRmcm9tOiB7b3BhY2l0eTogMH1cblx0XHRcdFx0XHR0bzoge29wYWNpdHk6IDF9XG5cdFx0XHR6b29tSW46XG5cdFx0XHRcdG5ld1ZpZXc6XG5cdFx0XHRcdFx0ZnJvbToge3NjYWxlOiAwLjgsIG9wYWNpdHk6IDB9XG5cdFx0XHRcdFx0dG86IHtzY2FsZTogMSwgb3BhY2l0eTogMX1cblx0XHRcdHpvb21PdXQ6XG5cdFx0XHRcdG9sZFZpZXc6XG5cdFx0XHRcdFx0dG86IHtzY2FsZTogMC44LCBvcGFjaXR5OiAwfVxuXHRcdFx0XHRuZXdWaWV3OlxuXHRcdFx0XHRcdHRvOiB7fVxuXHRcdFx0c2xpZGVJblVwOlxuXHRcdFx0XHRuZXdWaWV3OlxuXHRcdFx0XHRcdGZyb206IHt5OiBAaGVpZ2h0fVxuXHRcdFx0XHRcdHRvOiB7eTogMH1cblx0XHRcdHNsaWRlSW5SaWdodDpcblx0XHRcdFx0bmV3Vmlldzpcblx0XHRcdFx0XHRmcm9tOiB7eDogQHdpZHRofVxuXHRcdFx0XHRcdHRvOiB7eDogMH1cblx0XHRcdHNsaWRlSW5Eb3duOlxuXHRcdFx0XHRuZXdWaWV3OlxuXHRcdFx0XHRcdGZyb206IHttYXhZOiAwfVxuXHRcdFx0XHRcdHRvOiB7eTogMH1cblx0XHRcdHNsaWRlSW5MZWZ0OlxuXHRcdFx0XHRuZXdWaWV3OlxuXHRcdFx0XHRcdGZyb206IHttYXhYOiAwfVxuXHRcdFx0XHRcdHRvOiB7bWF4WDogQHdpZHRofVxuXHRcdFx0bW92ZUluVXA6XG5cdFx0XHRcdG9sZFZpZXc6XG5cdFx0XHRcdFx0dG86IHt5OiAtQGhlaWdodH1cblx0XHRcdFx0bmV3Vmlldzpcblx0XHRcdFx0XHRmcm9tOiB7eTogQGhlaWdodH1cblx0XHRcdFx0XHR0bzoge3k6IDB9XG5cdFx0XHRtb3ZlSW5SaWdodDpcblx0XHRcdFx0b2xkVmlldzpcblx0XHRcdFx0XHR0bzoge21heFg6IDB9XG5cdFx0XHRcdG5ld1ZpZXc6XG5cdFx0XHRcdFx0ZnJvbToge3g6IEB3aWR0aH1cblx0XHRcdFx0XHR0bzoge3g6IDB9XG5cdFx0XHRtb3ZlSW5Eb3duOlxuXHRcdFx0XHRvbGRWaWV3OlxuXHRcdFx0XHRcdHRvOiB7eTogQGhlaWdodH1cblx0XHRcdFx0bmV3Vmlldzpcblx0XHRcdFx0XHRmcm9tOiB7eTogLUBoZWlnaHR9XG5cdFx0XHRcdFx0dG86IHt5OiAwfVxuXHRcdFx0bW92ZUluTGVmdDpcblx0XHRcdFx0b2xkVmlldzpcblx0XHRcdFx0XHR0bzoge3g6IEB3aWR0aH1cblx0XHRcdFx0bmV3Vmlldzpcblx0XHRcdFx0XHRmcm9tOiB7bWF4WDogMH1cblx0XHRcdFx0XHR0bzoge3g6IDB9XG5cdFx0XHRwdXNoSW5SaWdodDpcblx0XHRcdFx0b2xkVmlldzpcblx0XHRcdFx0XHR0bzoge3g6IC0oQHdpZHRoLzUpLCBicmlnaHRuZXNzOiA3MH1cblx0XHRcdFx0bmV3Vmlldzpcblx0XHRcdFx0XHRmcm9tOiB7eDogQHdpZHRofVxuXHRcdFx0XHRcdHRvOiB7eDogMH1cblx0XHRcdHB1c2hJbkxlZnQ6XG5cdFx0XHRcdG9sZFZpZXc6XG5cdFx0XHRcdFx0dG86IHt4OiBAd2lkdGgvNSwgYnJpZ2h0bmVzczogNzB9XG5cdFx0XHRcdG5ld1ZpZXc6XG5cdFx0XHRcdFx0ZnJvbToge3g6IC1Ad2lkdGh9XG5cdFx0XHRcdFx0dG86IHt4OiAwfVxuXHRcdFx0cHVzaE91dFJpZ2h0OlxuXHRcdFx0XHRvbGRWaWV3OlxuXHRcdFx0XHRcdHRvOiB7eDogQHdpZHRofVxuXHRcdFx0XHRuZXdWaWV3OlxuXHRcdFx0XHRcdGZyb206IHt4OiAtKEB3aWR0aC81KSwgYnJpZ2h0bmVzczogNzB9XG5cdFx0XHRcdFx0dG86IHt4OiAwLCBicmlnaHRuZXNzOiAxMDB9XG5cdFx0XHRwdXNoT3V0TGVmdDpcblx0XHRcdFx0b2xkVmlldzpcblx0XHRcdFx0XHR0bzoge21heFg6IDB9XG5cdFx0XHRcdG5ld1ZpZXc6XG5cdFx0XHRcdFx0ZnJvbToge3g6IEB3aWR0aC81LCBicmlnaHRuZXNzOiA3MH1cblx0XHRcdFx0XHR0bzoge3g6IDAsIGJyaWdodG5lc3M6IDEwMH1cblx0XHRcdHNsaWRlT3V0VXA6XG5cdFx0XHRcdG9sZFZpZXc6XG5cdFx0XHRcdFx0dG86IHttYXhZOiAwfVxuXHRcdFx0XHRuZXdWaWV3OlxuXHRcdFx0XHRcdHRvOiB7fVxuXHRcdFx0c2xpZGVPdXRSaWdodDpcblx0XHRcdFx0b2xkVmlldzpcblx0XHRcdFx0XHR0bzoge3g6IEB3aWR0aH1cblx0XHRcdFx0bmV3Vmlldzpcblx0XHRcdFx0XHR0bzoge31cblx0XHRcdHNsaWRlT3V0RG93bjpcblx0XHRcdFx0b2xkVmlldzpcblx0XHRcdFx0XHR0bzoge3k6IEBoZWlnaHR9XG5cdFx0XHRcdG5ld1ZpZXc6XG5cdFx0XHRcdFx0dG86IHt9XG5cdFx0XHRzbGlkZU91dExlZnQ6XG5cdFx0XHRcdG9sZFZpZXc6XG5cdFx0XHRcdFx0dG86IHttYXhYOiAwfVxuXHRcdFx0XHRuZXdWaWV3OlxuXHRcdFx0XHRcdHRvOiB7fVxuXG5cdFx0IyBzaG9ydGN1dHNcblx0XHR0cmFuc2l0aW9ucy5zbGlkZUluID0gdHJhbnNpdGlvbnMuc2xpZGVJblJpZ2h0XG5cdFx0dHJhbnNpdGlvbnMuc2xpZGVPdXQgPSB0cmFuc2l0aW9ucy5zbGlkZU91dFJpZ2h0XG5cdFx0dHJhbnNpdGlvbnMucHVzaEluID0gdHJhbnNpdGlvbnMucHVzaEluUmlnaHRcblx0XHR0cmFuc2l0aW9ucy5wdXNoT3V0ID0gdHJhbnNpdGlvbnMucHVzaE91dFJpZ2h0XG5cblx0XHQjIGV2ZW50c1xuXHRcdEV2ZW50cy5WaWV3V2lsbFN3aXRjaCA9IFwidmlld1dpbGxTd2l0Y2hcIlxuXHRcdEV2ZW50cy5WaWV3RGlkU3dpdGNoID0gXCJ2aWV3RGlkU3dpdGNoXCJcblx0XHRMYXllcjo6b25WaWV3V2lsbFN3aXRjaCA9IChjYikgLT4gQG9uKEV2ZW50cy5WaWV3V2lsbFN3aXRjaCwgY2IpXG5cdFx0TGF5ZXI6Om9uVmlld0RpZFN3aXRjaCA9IChjYikgLT4gQG9uKEV2ZW50cy5WaWV3RGlkU3dpdGNoLCBjYilcdFx0XG5cblx0XHRfLmVhY2ggdHJhbnNpdGlvbnMsIChhbmltUHJvcHMsIG5hbWUpID0+XG5cblx0XHRcdGlmIG9wdGlvbnMuYXV0b0xpbmtcblx0XHRcdFx0bGF5ZXJzID0gRnJhbWVyLkN1cnJlbnRDb250ZXh0Ll9sYXllcnNcblx0XHRcdFx0Zm9yIGJ0biBpbiBsYXllcnNcblx0XHRcdFx0XHRpZiBfLmluY2x1ZGVzIGJ0bi5uYW1lLCBuYW1lXG5cdFx0XHRcdFx0XHR2aWV3Q29udHJvbGxlciA9IEBcblx0XHRcdFx0XHRcdGJ0bi5vbkNsaWNrIC0+XG5cdFx0XHRcdFx0XHRcdGFuaW0gPSBAbmFtZS5zcGxpdCgnXycpWzBdXG5cdFx0XHRcdFx0XHRcdGxpbmtOYW1lID0gQG5hbWUucmVwbGFjZShhbmltKydfJywnJylcblx0XHRcdFx0XHRcdFx0bGlua05hbWUgPSBsaW5rTmFtZS5yZXBsYWNlKC9cXGQrL2csICcnKSAjIHJlbW92ZSBudW1iZXJzXG5cdFx0XHRcdFx0XHRcdHZpZXdDb250cm9sbGVyW2FuaW1dIF8uZmluZChsYXllcnMsIChsKSAtPiBsLm5hbWUgaXMgbGlua05hbWUpXG5cblx0XHRcdEBbbmFtZV0gPSAobmV3VmlldywgYW5pbWF0aW9uT3B0aW9ucyA9IEBhbmltYXRpb25PcHRpb25zKSA9PlxuXG5cdFx0XHRcdHJldHVybiBpZiBuZXdWaWV3IGlzIEBjdXJyZW50Vmlld1xuXG5cblxuXHRcdFx0XHQjIG1ha2Ugc3VyZSB0aGUgbmV3IGxheWVyIGlzIGluc2lkZSB0aGUgdmlld2NvbnRyb2xsZXJcblx0XHRcdFx0bmV3Vmlldy5wYXJlbnQgPSBAXG5cdFx0XHRcdG5ld1ZpZXcuc2VuZFRvQmFjaygpXG5cblx0XHRcdFx0IyByZXNldCBwcm9wcyBpbiBjYXNlIHRoZXkgd2VyZSBjaGFuZ2VkIGJ5IGEgcHJldiBhbmltYXRpb25cblx0XHRcdFx0bmV3Vmlldy5wb2ludCA9IHt4OjAsIHk6IDB9XG5cdFx0XHRcdG5ld1ZpZXcub3BhY2l0eSA9IDFcblx0XHRcdFx0bmV3Vmlldy5zY2FsZSA9IDFcblx0XHRcdFx0bmV3Vmlldy5icmlnaHRuZXNzID0gMTAwXG5cdFx0XHRcdFxuXHRcdFx0XHQjIG9sZFZpZXdcblx0XHRcdFx0QGN1cnJlbnRWaWV3Py5wb2ludCA9IHt4OiAwLCB5OiAwfSAjIGZpeGVzIG9mZnNldCBpc3N1ZSB3aGVuIG1vdmluZyB0b28gZmFzdCBiZXR3ZWVuIHNjcmVlbnNcblx0XHRcdFx0QGN1cnJlbnRWaWV3Py5wcm9wcyA9IGFuaW1Qcm9wcy5vbGRWaWV3Py5mcm9tXG5cdFx0XHRcdGFuaW1PYmogPSBfLmV4dGVuZCB7cHJvcGVydGllczogYW5pbVByb3BzLm9sZFZpZXc/LnRvfSwgYW5pbWF0aW9uT3B0aW9uc1xuXHRcdFx0XHRfLmRlZmF1bHRzKGFuaW1PYmosIHsgcHJvcGVydGllczoge30gfSlcblx0XHRcdFx0b3V0Z29pbmcgPSBAY3VycmVudFZpZXc/LmFuaW1hdGUgYW5pbU9ialxuXG5cdFx0XHRcdCMgbmV3Vmlld1xuXHRcdFx0XHRuZXdWaWV3LnByb3BzID0gYW5pbVByb3BzLm5ld1ZpZXc/LmZyb21cblx0XHRcdFx0aW5jb21pbmcgPSBuZXdWaWV3LmFuaW1hdGUgXy5leHRlbmQge3Byb3BlcnRpZXM6IGFuaW1Qcm9wcy5uZXdWaWV3Py50b30sIGFuaW1hdGlvbk9wdGlvbnNcblx0XHRcdFx0XG5cdFx0XHRcdCMgbGF5ZXIgb3JkZXJcblx0XHRcdFx0aWYgXy5pbmNsdWRlcyBuYW1lLCAnT3V0J1xuXHRcdFx0XHRcdG5ld1ZpZXcucGxhY2VCZWhpbmQoQGN1cnJlbnRWaWV3KVxuXHRcdFx0XHRcdG91dGdvaW5nLm9uIEV2ZW50cy5BbmltYXRpb25FbmQsID0+IEBjdXJyZW50Vmlldy5icmluZ1RvRnJvbnQoKVxuXHRcdFx0XHRlbHNlXG5cdFx0XHRcdFx0bmV3Vmlldy5wbGFjZUJlZm9yZShAY3VycmVudFZpZXcpXG5cdFx0XHRcdFx0XG5cdFx0XHRcdEBlbWl0KEV2ZW50cy5WaWV3V2lsbFN3aXRjaCwgQGN1cnJlbnRWaWV3LCBuZXdWaWV3KVxuXHRcdFx0XHRcblx0XHRcdFx0IyBjaGFuZ2UgQ3VycmVudFZpZXcgYmVmb3JlIGFuaW1hdGlvbiBoYXMgZmluaXNoZWQgc28gb25lIGNvdWxkIGdvIGJhY2sgaW4gaGlzdG9yeVxuXHRcdFx0XHQjIHdpdGhvdXQgaGF2aW5nIHRvIHdhaXQgZm9yIHRoZSB0cmFuc2l0aW9uIHRvIGZpbmlzaFxuXHRcdFx0XHRAc2F2ZUN1cnJlbnRWaWV3VG9IaXN0b3J5IG5hbWUsIG91dGdvaW5nLCBpbmNvbWluZ1xuXHRcdFx0XHRAY3VycmVudFZpZXcgPSBuZXdWaWV3XG5cdFx0XHRcdEBlbWl0KFwiY2hhbmdlOnByZXZpb3VzVmlld1wiLCBAcHJldmlvdXNWaWV3KVxuXHRcdFx0XHRAZW1pdChcImNoYW5nZTpjdXJyZW50Vmlld1wiLCBAY3VycmVudFZpZXcpXG5cdFx0XHRcdFxuXHRcdFx0XHRpZiBpbmNvbWluZy5pc0FuaW1hdGluZ1xuXHRcdFx0XHRcdGhvb2sgPSBpbmNvbWluZyBcblx0XHRcdFx0ZWxzZVxuXHRcdFx0XHRcdGhvb2sgPSBvdXRnb2luZ1xuXHRcdFx0XHRob29rPy5vbiBFdmVudHMuQW5pbWF0aW9uRW5kLCA9PlxuXHRcdFx0XHRcdEBlbWl0KEV2ZW50cy5WaWV3RGlkU3dpdGNoLCBAcHJldmlvdXNWaWV3LCBAY3VycmVudFZpZXcpXG5cdFx0XHRcdFxuXG5cdFx0aWYgb3B0aW9ucy5pbml0aWFsVmlld05hbWU/XG5cdFx0XHRhdXRvSW5pdGlhbCA9IF8uZmluZCBGcmFtZXIuQ3VycmVudENvbnRleHQuX2xheWVycywgKGwpIC0+IGwubmFtZSBpcyBvcHRpb25zLmluaXRpYWxWaWV3TmFtZVxuXHRcdFx0aWYgYXV0b0luaXRpYWw/IHRoZW4gQHN3aXRjaEluc3RhbnQgYXV0b0luaXRpYWxcblxuXHRcdGlmIG9wdGlvbnMuaW5pdGlhbFZpZXc/XG5cdFx0XHRAc3dpdGNoSW5zdGFudCBvcHRpb25zLmluaXRpYWxWaWV3XG5cblx0XHRpZiBvcHRpb25zLmJhY2tCdXR0b25OYW1lP1xuXHRcdFx0YmFja0J1dHRvbnMgPSBfLmZpbHRlciBGcmFtZXIuQ3VycmVudENvbnRleHQuX2xheWVycywgKGwpIC0+IF8uaW5jbHVkZXMgbC5uYW1lLCBvcHRpb25zLmJhY2tCdXR0b25OYW1lXG5cdFx0XHRmb3IgYnRuIGluIGJhY2tCdXR0b25zXG5cdFx0XHRcdGJ0bi5vbkNsaWNrID0+IEBiYWNrKClcblxuXHRAZGVmaW5lIFwicHJldmlvdXNWaWV3XCIsXG5cdFx0XHRnZXQ6IC0+IEBoaXN0b3J5WzBdLnZpZXdcblxuXHRzYXZlQ3VycmVudFZpZXdUb0hpc3Rvcnk6IChuYW1lLG91dGdvaW5nQW5pbWF0aW9uLGluY29taW5nQW5pbWF0aW9uKSAtPlxuXHRcdEBoaXN0b3J5LnVuc2hpZnRcblx0XHRcdHZpZXc6IEBjdXJyZW50Vmlld1xuXHRcdFx0YW5pbWF0aW9uTmFtZTogbmFtZVxuXHRcdFx0aW5jb21pbmdBbmltYXRpb246IGluY29taW5nQW5pbWF0aW9uXG5cdFx0XHRvdXRnb2luZ0FuaW1hdGlvbjogb3V0Z29pbmdBbmltYXRpb25cblxuXHRiYWNrOiAtPlxuXHRcdHByZXZpb3VzID0gQGhpc3RvcnlbMF1cblx0XHRpZiBwcmV2aW91cy52aWV3P1xuXG5cdFx0XHRpZiBfLmluY2x1ZGVzIHByZXZpb3VzLmFuaW1hdGlvbk5hbWUsICdPdXQnXG5cdFx0XHRcdHByZXZpb3VzLnZpZXcuYnJpbmdUb0Zyb250KClcblxuXHRcdFx0YmFja0luID0gcHJldmlvdXMub3V0Z29pbmdBbmltYXRpb24ucmV2ZXJzZSgpXG5cdFx0XHRtb3ZlT3V0ID0gcHJldmlvdXMuaW5jb21pbmdBbmltYXRpb24ucmV2ZXJzZSgpXG5cblx0XHRcdGJhY2tJbi5zdGFydCgpXG5cdFx0XHRtb3ZlT3V0LnN0YXJ0KClcblxuXHRcdFx0QGN1cnJlbnRWaWV3ID0gcHJldmlvdXMudmlld1xuXHRcdFx0QGhpc3Rvcnkuc2hpZnQoKVxuXHRcdFx0bW92ZU91dC5vbiBFdmVudHMuQW5pbWF0aW9uRW5kLCA9PiBAY3VycmVudFZpZXcuYnJpbmdUb0Zyb250KClcbiIsIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBSUFBO0FEQUEsSUFBQTs7O0FBQU0sTUFBTSxDQUFDOzs7RUFFQyxpQkFBQyxPQUFEO0FBQ1osUUFBQTs7TUFEYSxVQUFROzs7TUFDckIsT0FBTyxDQUFDLFFBQVMsTUFBTSxDQUFDOzs7TUFDeEIsT0FBTyxDQUFDLFNBQVUsTUFBTSxD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
