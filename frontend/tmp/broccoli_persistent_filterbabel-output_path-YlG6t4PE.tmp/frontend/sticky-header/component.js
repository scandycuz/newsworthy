define('frontend/sticky-header/component', ['exports', 'ember'], function (exports, _ember) {
  var $ = _ember['default'].$;
  var run = _ember['default'].run;
  var computed = _ember['default'].computed;
  exports['default'] = _ember['default'].Component.extend({
    classNames: ['sticky-header-container'],
    classNameBindings: ['isSticky'],
    topPos: 0,
    isSticky: false,

    onWindowScroll: function onWindowScroll(e) {
      var scroll = $(e.currentTarget).scrollTop();
      var topPos = this.get('topPos');
      if (scroll > topPos) {
        this.set('isSticky', true);
      } else {
        this.set('isSticky', false);
      }
    },

    didInsertElement: function didInsertElement() {
      this._super.apply(this, arguments);
      this._windowScroll = run.bind(this, 'onWindowScroll');
      $(window).on('scroll', this._windowScroll);
      this.set('topPos', this.$('.sticky-header').offset().top);
    },

    willRemoveElement: function willRemoveElement() {
      $(window).off('scroll', this._windowScroll);
      this._super.apply(this, arguments);
    }

  });
});