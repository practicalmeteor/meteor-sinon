sinon = Npm.require("sinon");
sinonChai = Npm.require("sinon-chai");
// If the chai package is installed use it
if( Package['spacejamio:chai']){
  Package['spacejamio:chai'].chai.use(sinonChai)
}
