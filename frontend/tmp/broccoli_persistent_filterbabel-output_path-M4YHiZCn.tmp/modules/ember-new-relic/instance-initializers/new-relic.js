export { initialize };
import Ember from 'ember';

function initialize() {
  var NREUM = window.NREUM;

  if (!NREUM) {
    return;
  }

  function mustIgnoreError(error) {
    // Ember 2.X seems to not catch `TransitionAborted` errors caused by regular redirects. We don't want these errors to show up in NewRelic so we have to filter them ourselfs.
    // Once the issue https://github.com/emberjs/ember.js/issues/12505 is resolved we can remove this ignored error.
    if (Ember.isNone(error)) {
      return false;
    }
    var errorName = Ember.get(error, 'name');
    return errorName === 'TransitionAborted';
  }

  function handleError(error) {
    if (mustIgnoreError(error)) {
      return;
    }

    try {
      NREUM.noticeError(error);
    } catch (e) {
      // Ignore
    }

    if (error && error.stack) {
      console.error(error.stack);
    }
  }

  function generateError(cause, stack) {
    var error = new Error(cause);

    error.stack = stack;

    return error;
  }

  Ember.onerror = handleError;

  Ember.RSVP.on('error', handleError);

  Ember.Logger.error = function (message, cause, stack) {
    handleError(generateError(cause, stack));
  };
}

export default {
  name: 'new-relic',
  initialize: initialize
};