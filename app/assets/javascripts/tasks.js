$.ajax({
    url: '/teams',
    method: 'GET',
    dataType: 'json',
    success: function (data) {
        team = data

    }
});

$.ajax({
    url: '/players',
    method: 'GET',
    dataType: 'json',
    success: function (data) {
        player = data

    
    }
});

