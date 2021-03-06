/* jshint node:true */
var RSVP = require('rsvp');
const { exec } = require('child_process');

// For details on each option run `ember help release`
module.exports = {
  // local: true,
  // remote: 'some_remote',
  annotation: "%@ [skip ci]",
  message: "%@ [skip ci]",
  // manifest: [ 'package.json', 'bower.json', 'someconfig.json' ],
  // publish: true,
  // strategy: 'date',
  // format: 'YYYY-MM-DD',
  // timezone: 'America/Los_Angeles',
  //
  beforeCommit: function(/* project, versions */) {
    return new RSVP.Promise(function(resolve, reject) {
      exec('auto-changelog -t compact --package', (err) => {
        if (err) {
          reject(err);
        }

        resolve();
      });
    });
  }
};
