exports.config = {
    seleniumAddress: 'http://localhost:4444/wd/hub',
    specs: ['./e2e/protractor/controllers/*.js'],
    capabilities: {
        'browserName': 'chrome'
    },
    onPrepare: function() {
        var SpecReporter = require('jasmine-spec-reporter');
        // add jasmine spec reporter
        jasmine.getEnv().addReporter(new SpecReporter({displayStacktrace: true}));
    }

};