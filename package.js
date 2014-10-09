Package.describe({
    summary: "Standalone test spies, stubs and mocks for JavaScript.",
    name: "spacejamio:sinon",
    version: "1.10.3_1",
    git: "https://github.com/spacejamio/meteor-sinon.git"
});

Package.onUse(function (api, where) {
    api.versionsFrom('0.9.3');

    api.use('coffeescript');
    api.use('spacejamio:chai@1.9.2_1');

    api.addFiles('sinon-1.10.3.js');
    api.addFiles('sinon-chai-2.6.0.js');
    api.addFiles('install-sinonChai.js');
    api.addFiles('Helpers.coffee');

    api.export(['sinon','sinonChai']);
    api.export(['spies','stubs']);
});

Package.onTest(function(api) {
  api.use(['spacejamio:chai', 'spacejamio:sinon', 'coffeescript', 'tinytest']);

  api.addFiles('tests/HelpersTest.coffee');
});
