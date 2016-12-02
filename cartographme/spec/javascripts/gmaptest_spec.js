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
    test_click = {latLng: {lat: 41.67220658971898,lng: -91.56881332397461}};
    RP1.addRightClickMenu(test_click);
    expect($('#content')).toExist();
    expect($('#recomend_button')).toExist();
    expect($('#location_name')).toExist();
    
  });
  
  it('clicking marker displays visted menu');
  
  describe("when user recomends location",function(){
    it("calls ajax with the correct url",function()
    {
      spyOn($,'ajax');
      right_click_menu = jasmine.createSpyObj('right_click_menu',['close']);
      setFixtures('<input type="text" name="location_name" id="location_name" value="Test Location"><input type="text" name="description" id="description" value="This is a test"><input type="text" name="latitude" id="latitude" value="41.674835134557675"><input type="text" name="longitude" id="longitude" value="-91.55701160430908">');
      RP1.recomendLocation();
      expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/key_location/new');
    });
    
    it("places a new marker",function()
    {
      handler = jasmine.createSpyObj('handler',['addMarkers']);
      var fakeData="<ul><li id='lng' value='1'>1</li><li id='lat' value='2'>2</li></ul>.";
      RP1.successfullRecomendation(fakeData,"test","test");
      expect(handler.addMarkers).toHaveBeenCalledWith([{"lat": '2',"lng": '1',"infowindow": fakeData}]);
      
      
    });
    
  });
  
});
