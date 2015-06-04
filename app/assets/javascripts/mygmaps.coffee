class MarkerRepo

  constructor: (map) ->
    @map = map
    @markers = []
    @curSeverity = 0

  addMarker: (newMarker, newSeverity) ->
    if @shouldAddMarker(@curSeverity, newSeverity)
      @markers.push(newMarker)
      newMarker.setMap(@map)
      @curSeverity = newSeverity
 
  shouldAddMarker: (prev, cur) ->
    if (cur is 0) and (prev is 0)
      return true
    if (cur > prev)
      return true
    else
      return false

  toggle: () ->
    for marker, i in @markers
      if marker.getVisible()
        marker.setVisible(false)
      else
        marker.setVisible(true)

  remove: () ->
    for marker, i in @markers
      marker.setMap(null)
    @markers = []

$ ->
  opts =
    zoom: 15
    center: new google.maps.LatLng(35.690921, 139.700258)
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map").get(0), opts)

  markers = []
  markers["markers1"] = new MarkerRepo(map) 
  markers["markers1"].addMarker(
    new google.maps.Marker(position: new google.maps.LatLng(35.690921, 139.700258)),
    0
  )
     
  markers["markers1"].addMarker(
    new google.maps.Marker(position: new google.maps.LatLng(35.687529,139.702098)),
    1
  )
  
  markers["markers2"] = new MarkerRepo(map)
  markers["markers2"].addMarker(
    new google.maps.Marker(position: new google.maps.LatLng(35.694193,139.702791)),
    0
  )
  markers["markers2"].addMarker(
    new google.maps.Marker(position: new google.maps.LatLng(35.694588, 139.700152)),
    1
  )

  $("#marker1").click(->
    markers["markers1"].toggle()
  )

  $("#marker1_r").click(->
    markers["markers1"].remove()
  )

  $("#marker2").click(->
    markers["markers2"].toggle()
  )

  $("#marker2_r").click(->
    markers["markers2"].remove()
  )

