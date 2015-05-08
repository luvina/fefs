describe('Adding Vehicle', function() {
    it('Should add vehicle', function() {
        browser.get('http://localhost:8100/#/tab/add');
        element(by.model('vehicle.name')).sendKeys('Toyota');
        var dropDown = element(by.model('vehicle.type'));
        dropDown.$('[value="sedan"]').click();

        element(by.id('save')).click()
    });
});
