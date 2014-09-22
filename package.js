Npm.depends({
  'sinon':'1.7.3',
  'sinon-chai':'2.4.0'
});

Package.describe({
    summary: "Standalone test spies, stubs and mocks for JavaScript. This is Sinon.JS v1.7.3.",
    name: "spacejamio:sinon",
    version: "1.0.0",
    git: "https://github.com/spacejamio/meteor-sinon.git"
});

Package.onUse(function (api, where) {
    api.versionsFrom('0.9.0');

    api.addFiles(['server.js'], ['server']);
    api.add_files(['sinon-1.7.3.js'], ['client']);
    api.add_files(['sinon-chai.js'], ['client']);
    api.use('spacejamio:chai', {weak: true});
    api.export(['sinon','sinonChai'],['client','server']);
});

Package.onTest(function(api) {
});
