$(document).ready(function() {
  $('.new_search').submit(function() {
    var dep_st;
    var arr_st;

    dep_st = $(this).find('#search_departure_station_id');
    arr_st = $(this).find('#search_arrival_station_id');

    console.log('123');

    if(dep_st.val() == arr_st.val()) {
      alert('Выберите конечную станцию');
      return false;
    }
  });
});