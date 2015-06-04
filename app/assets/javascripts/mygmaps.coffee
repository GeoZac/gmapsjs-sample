$ ->
  latlng = new google.maps.LatLng(35.690921, 139.700258);
  opts =
    zoom: 15
    center: latlng
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map").get(0), opts)
  marker = new google.maps.Marker(
    position: latlng
    map: map
    title: 'Hello World!') 

  $("#marker1").click(->
    if marker.getVisible()
      marker.setVisible(false)
    else
      marker.setVisible(true)
  )

