console.warn('The spacjamio:sinon package has been renamed to practicalmeteor:sinon. Please use the new package name instead.');

// If the chai package is installed use it
if(Package['practicalmeteor:chai']){
  chai.use(sinonChai);
}
