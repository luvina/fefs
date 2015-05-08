describe('Vehicle List',function(){
 it('Should count the no. of vehicles',function(){
     beforeEach(function () {
         browser.ignoreSynchronization = false; // restore
         browser.get('/list');
     });

     var vehicleList = element.all(by.repeater('vendor in vehicles'));
     expect(vehicleList.count()).toEqual(0);
 })
});
