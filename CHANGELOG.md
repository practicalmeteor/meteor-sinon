## 1.14.1_2

* Allow specifying a custom function in stubs.create. See [pr](https://github.com/practicalmeteor/meteor-sinon/pull/12).

## 1.14.1_1

* Upgrade to sinon 1.14.1

## 1.10.3_1

* Add 'spies' and 'stubs' factories with 'restoreAll' support that can be called during tear down of tests or test suites.
* Add tests to verify chai is actually working, not just exported.
* Update sinon to version 1.10.3
* Update sinonChai to version 2.6.0
* Remove npm dependency - sinon.js and sinon-chai.js are now included in both client and server, which improves build time
* Update required meteor version to 0.9.3
* Update package version to use the new "wrapper package" package versions, introduced in meteor 0.9.3

## 1.0.0

* Update required meteor version to 0.9.0
* Add package to meteor new packaging system
