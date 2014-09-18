Npm.depends({
  'sinon':'1.7.3',
  'sinon-chai':'2.4.0'
});

Package.describe({
    summary: "Standalone test spies, stubs and mocks for JavaScript. This is Sinon.JS v1.7.3.",
    name: "spacejamio:sinon",
    version: "0.1.6",
    git: "https://github.com/spacejamio/meteor-sinon.git"
});

Package.onUse(function (api, where) {
    api.addFiles(['server.js'], ['server']);
    api.add_files(['sinon-1.7.3.js'], ['client']);
    api.add_files(['sinon-chai.js'], ['client']);
    api.imply('spacejamio:chai@0.1.6');
    api.export(['sinon','sinonChai'],['client','server']);
});

Package.on_test(function(api) {
});
