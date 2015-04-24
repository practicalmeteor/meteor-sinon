Package.describe({
    summary: "Standalone test spies, stubs and mocks for JavaScript.",
    name: "practicalmeteor:sinon",
    version: "1.14.1",
    git: "https://github.com/practicalmeteor/meteor-sinon.git"
});

Package.onUse(function (api, where) {
    api.versionsFrom('0.9.3');

    api.use('coffeescript');
    api.use('practicalmeteor:chai@1.9.2_3');

    api.addFiles('sinon-1.14.1.js');
    api.addFiles('sinon-chai-2.6.0.js');
    api.addFiles('install-sinonChai.js');
    api.addFiles('Helpers.coffee');

    api.export(['sinon','sinonChai']);
    api.export(['spies','stubs']);
});

Package.onTest(function(api) {
  api.use(['practicalmeteor:chai@1.9.2_3', 'practicalmeteor:sinon@1.10.3_2', 'coffeescript', 'tinytest']);

  api.addFiles('tests/HelpersTest.coffee');
});
