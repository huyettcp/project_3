$.ajax({
    url: '/teams',
    method: 'GET',
    dataType: 'json',
    success: function (data) {
        team = data
        console.log(team[0].name)
        console.log(team[0].id)
        console.log(team[0].payroll)
    }
});

$.ajax({
    url: '/players',
    method: 'GET',
    dataType: 'json',
    success: function (data) {
        player = data
        console.log(player[0].name)
        console.log(parseFloat(player[0].cost_performance_score))
    
    }
});

