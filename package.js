Npm.depends({
  'sinon':'1.7.3',
  'sinon-chai':'2.4.0'
});

Package.describe({
    summary: "Standalone test spies, stubs and mocks for JavaScript."
});

Package.on_use(function (api, where) {
    api.add_files(['server.js'], ['server']);
    api.add_files(['sinon-1.7.3.js'], ['client']);
    api.add_files(['sinon-chai.js'], ['client']);
    api.export(['sinon','sinonChai'],['client','server']);
});

Package.on_test(function(api) {
});
