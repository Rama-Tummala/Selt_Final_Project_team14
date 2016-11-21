//= require jquery
//= require jasmine-jquery
//= require underscore


describe('Gmap',function(){
  beforeEach(function()
  {
    loadFixtures('home_page.html');
    window.google = {
      maps: {
        InfoWindow: function(){}
     }
    };
    
  
  });
  
  it('displays map',function(){
    fakeMap = jasmine.createSpyObj('map',['addListener']); 
    fakeHandler = jasmine.createSpyObj('mapHandler', ['addMarkers','getMap','buildMap']);
    spyOn(Gmaps,"build").and.returnValue(fakeHandler);
    spyOn(google.maps, 'InfoWindow');
    expect($('#map')).toExist();
    RP1.setup();
    expect(Gmaps.build).toHaveBeenCalled();
  });  
  
  it('right click diplays recomend location menu',function(){
    //check if add listener is called on  handler.getMap
    //mapHandler = jasmine.createSpyObj('mapHandler', ['addMarkers','getMap','buildMap']);
    //spyOn(Gmaps,'build').and.returnValue(mapHandler);
    test_click = {latLng: {lat: 41.67220658971898,lng: -91.56881332397461}};
    RP1.addRightClickMenu(test_click);
    expect($('#content')).toExist();
    expect($('#recomend_button')).toExist();
    expect($('#location_name')).toExist();
    
  });
  
  it('clicking marker displays visted menu');
  
  describe("when user recomends location",function(){
    it("calls the correct url")
    
    
    
  }
  
});
