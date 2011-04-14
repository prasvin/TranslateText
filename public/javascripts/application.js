$(function() {
    $( "#tasklist" ).accordion({
      collapsible: true,
      active: false,
      autoHeight: false,
    });

    $( "#slider" ).slider({
          range: "min",
          value: 0,
          min: 0,
          max: 1000,
          slide: function( event, ui ) {
            $( "#points" ).val( ui.value );
          }
        });
  });