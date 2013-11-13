$(document).ready(function(){
  onLoadSalaryDataSet();


  

  $( '#data2' ).click(function(){
    var team_id = $( '#select_team' ).data().ddslick.selectedData.value
    costPerformanceScoreDataSet(team_id);
  })

  $( '#data1' ).click(function(){
    var team_id = $( '#select_team' ).data().ddslick.selectedData.value
    salaryDataSet(team_id);
  })

  $('#select_team').ddslick({
    onSelected: function(data){
      var team_id = data.selectedData.value
      salaryDataSet(team_id);

      // console.log(team_id)
    }
  })

  // $('#select_data_type').ddslick({
  //   onSelected: function(data){
  //     var team_id = $( '#select_team' ).data().ddslick.selectedData.value
  //     costPerformanceScoreDataSet(team_id);
  //   }
  // })


})



function getPlayerInfo(name){
  $.ajax({
    url: '/player_data',
    data: {name: name},
    method: 'GET',
    dataType: 'json'
  }).done(function(name){

    $( '#salary_data' ).text("2013 Salary: " + "$" + name[0].salary)
    $( '#cost_performance_score' ).text("2013 Cost vs. Performance Score: " + name[0].cost_performance_score)
  })
 
}

function onLoadSalaryDataSet(){
   $.ajax({
    url: '/players',
    method: 'GET',
    dataType: 'json'
  }).done(function(player){


    var w = 500,                
    h = 500,                          
    r = 250,                            
    color = d3.scale.category20c();      
 
    salary_data = [{"label":player[0].name, "value":player[0].salary * .00001}, 
            {"label":player[1].name, "value":player[1].salary * .00001},  
            {"label":player[2].name, "value":player[2].salary * .00001}, 
            {"label":player[3].name, "value":player[3].salary * .00001},
            {"label":player[4].name, "value":player[4].salary * .00001},
            {"label":player[5].name, "value":player[5].salary * .00001},
            {"label":player[6].name, "value":player[6].salary * .00001},
            {"label":player[7].name, "value":player[7].salary * .00001},
            {"label":player[8].name, "value":player[8].salary * .00001},
            {"label":player[9].name, "value":player[9].salary * .00001},
            {"label":player[10].name, "value":player[10].salary * .00001},
            {"label":player[11].name, "value":player[11].salary * .00001},
            {"label":player[12].name, "value":player[12].salary * .00001},
            {"label":player[13].name, "value":player[13].salary * .00001},
            {"label":player[14].name, "value":player[14].salary * .00001},
            {"label":player[15].name, "value":player[15].salary * .00001},
            {"label":player[16].name, "value":player[16].salary * .00001},
            {"label":player[17].name, "value":player[17].salary * .00001},
            {"label":player[18].name, "value":player[18].salary * .00001},
            {"label":player[19].name, "value":player[19].salary * .00001}
            
            ];
    
    var vis = d3.select("#pie_area")
        .append("svg")              
        .data([salary_data])                   
        .attr("width", w)         
        .attr("height", h)
        .append("svg:g")                
        .attr("transform", "translate(" + r + "," + r + ")")   
    var arc = d3.svg.arc()              
        .outerRadius(r);
 
    var pie = d3.layout.pie()           
        .value(function(d) { return d.value; });    
 
    var arcs = vis.selectAll("g.slice")     
        .data(pie)                          
        .enter()                            
            .append("svg:g")               
                .attr("class", "slice")
                .on("mouseover", function(e, i){
                  // console.log(e, i)
                  // console.log(e.data.label)
                  var name = e.data.label
                  $( '#player_name' ).text(e.data.label)
                  getPlayerInfo(name)
                })    
 
        arcs.append("svg:path")
                .attr("fill", function(d, i) { return color(i); } ) 
                .attr("d", arc);                                   
 
        arcs.append("svg:text")                                   
                .attr("transform", function(d) {                   
                d.innerRadius = 0;
                d.outerRadius = r;
                return "translate(" + arc.centroid(d) + ")";        
            })
            .attr("class", "player_label")
            .attr("display", "none")
            .attr("text-anchor", "middle")

            .text(function(d, i) { return salary_data[i].label; });
            })

 }


 function costPerformanceScoreDataSet(team_id){
   $.ajax({
    url: '/cost_performance_data',
    data: {team_id: team_id},
    method: 'GET',
    dataType: 'json'
  }).done(function(player){
    console.log(player[0].name)

   var w = 500,                
    h = 500,                          
    r = 250,                           
    color = d3.scale.category20b(); 

    value_data = [{"label":player[0].name, "value":parseFloat(player[0].cost_performance_score) * .00001},
                  {"label":player[1].name, "value":parseFloat(player[1].cost_performance_score) * .00001},
                  {"label":player[2].name, "value":parseFloat(player[2].cost_performance_score) * .00001},
                  {"label":player[3].name, "value":parseFloat(player[3].cost_performance_score) * .00001},
                  {"label":player[4].name, "value":parseFloat(player[4].cost_performance_score) * .00001},
                  {"label":player[5].name, "value":parseFloat(player[5].cost_performance_score) * .00001},
                  {"label":player[6].name, "value":parseFloat(player[6].cost_performance_score) * .00001},
                  {"label":player[7].name, "value":parseFloat(player[7].cost_performance_score) * .00001},
                  {"label":player[8].name, "value":parseFloat(player[8].cost_performance_score) * .00001},
                  {"label":player[9].name, "value":parseFloat(player[9].cost_performance_score) * .00001},
                  {"label":player[10].name, "value":parseFloat(player[10].cost_performance_score) * .00001},
                  {"label":player[11].name, "value":parseFloat(player[11].cost_performance_score) * .00001},
                  {"label":player[12].name, "value":parseFloat(player[12].cost_performance_score) * .00001},
                  {"label":player[13].name, "value":parseFloat(player[13].cost_performance_score) * .00001},
                  {"label":player[14].name, "value":parseFloat(player[14].cost_performance_score) * .00001},
                  {"label":player[15].name, "value":parseFloat(player[15].cost_performance_score) * .00001},
                  {"label":player[16].name, "value":parseFloat(player[16].cost_performance_score) * .00001},
                  {"label":player[17].name, "value":parseFloat(player[17].cost_performance_score) * .00001},
                  {"label":player[18].name, "value":parseFloat(player[18].cost_performance_score) * .00001},
                  {"label":player[19].name, "value":parseFloat(player[19].cost_performance_score) * .00001}

                  ];

    var vis = d3.select("svg")
        .append("svg")              
        .data([value_data])                   
        .attr("width", w)         
        .attr("height", h)
        .append("svg:g")                
        .attr("transform", "translate(" + r + "," + r + ")")   
    var arc = d3.svg.arc()              
        .outerRadius(r);
 
    var pie = d3.layout.pie()           
        .value(function(d) { return d.value; });    
 
    var arcs = vis.selectAll("g.slice")     
        .data(pie)                          
        .enter()                            
            .append("svg:g")               
                .attr("class", "slice")
                .on("mouseover", function(e, i){
                  // console.log(e, i)
                  // console.log(e.data.label)
                  var name = e.data.label
                  $( '#player_name' ).text(e.data.label)
                  getPlayerInfo(name)
                })     
 
        arcs.append("svg:path")
                .attr("fill", function(d, i) { return color(i); } ) 
                .attr("d", arc);                                   
 
        arcs.append("svg:text")                                   
                .attr("transform", function(d) {                   
                d.innerRadius = 0;
                d.outerRadius = r;
                return "translate(" + arc.centroid(d) + ")";        
            })
            .attr("class", "player_label")
            .attr("display", "none")
            .attr("text-anchor", "middle")                                                   
            .text(function(d, i) { return value_data[i].label; });
            })

}



function salaryDataSet(team_id){
   $.ajax({
    url: '/salary_data',
    data: {team_id: team_id},
    method: 'GET',
    dataType: 'json'
  }).done(function(player){

    console.log(player[1].name)

    var w = 500,                
    h = 500,                          
    r = 250,                           //radius
    color = d3.scale.category20c();     //builtin range of colors
 
    salary_data = [{"label":player[0].name, "value":player[0].salary * .00001}, 
            {"label":player[1].name, "value":player[1].salary * .00001},  
            {"label":player[2].name, "value":player[2].salary * .00001}, 
            {"label":player[3].name, "value":player[3].salary * .00001},
            {"label":player[4].name, "value":player[4].salary * .00001},
            {"label":player[5].name, "value":player[5].salary * .00001},
            {"label":player[6].name, "value":player[6].salary * .00001},
            {"label":player[7].name, "value":player[7].salary * .00001},
            {"label":player[8].name, "value":player[8].salary * .00001},
            {"label":player[9].name, "value":player[9].salary * .00001},
            {"label":player[10].name, "value":player[10].salary * .00001},
            {"label":player[11].name, "value":player[11].salary * .00001},
            {"label":player[12].name, "value":player[12].salary * .00001},
            {"label":player[13].name, "value":player[13].salary * .00001},
            {"label":player[14].name, "value":player[14].salary * .00001},
            {"label":player[15].name, "value":player[15].salary * .00001},
            {"label":player[16].name, "value":player[16].salary * .00001},
            {"label":player[17].name, "value":player[17].salary * .00001},
            {"label":player[18].name, "value":player[18].salary * .00001},
            {"label":player[19].name, "value":player[19].salary * .00001}

            ];


    var vis = d3.select("svg")
        .append("svg")              
        .data([salary_data])                   
        .attr("width", w)         
        .attr("height", h)
        .append("svg:g")                
        .attr("transform", "translate(" + r + "," + r + ")")   
    var arc = d3.svg.arc()              
        .outerRadius(r);
 
    var pie = d3.layout.pie()           
        .value(function(d) { return d.value; });    
 
    var arcs = vis.selectAll("g.slice")     
        .data(pie)                          
        .enter()                            
            .append("svg:g")               
                .attr("class", "slice")
                .on("mouseover", function(e, i){
                  // console.log(e, i)
                  // console.log(e.data.label)
                  var name = e.data.label
                  $( '#player_name' ).text(e.data.label)
                  getPlayerInfo(name)
                })    
 
        arcs.append("svg:path")
                .attr("fill", function(d, i) { return color(i); } ) 
                .attr("d", arc);                                   
 
        arcs.append("svg:text")                                   
                .attr("transform", function(d) {                   
                d.innerRadius = 0;
                d.outerRadius = r;
                return "translate(" + arc.centroid(d) + ")";        
            }) 
            .attr("class", "player_label")
            .attr("display", "none")
            .attr("text-anchor", "middle")                          
            .text(function(d, i) { return salary_data[i].label; });
            })
 }
