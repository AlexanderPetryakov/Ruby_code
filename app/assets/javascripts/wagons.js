$(document).ready(function() {
  $("#wagon_type").change(function() {
    
    var value = $('select').val();
    //console.log(value);
    $('.field').hide();
    switch(value) {
      case 'CoupeWagon':
      $("#bs").show();
      $("#ts").show();
      break;

      case 'DayWagon':
      $("#ss").show();
      break;

      case 'EconomyWagon':
      $("#bs").show();
      $("#ts").show();
      $("#sbs").show();
      $("#sts").show();
      break;

      case 'LuxuryWagon':
      $("#bs").show();
      break;
    }
  });
});