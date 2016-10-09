	app.directive('multibar', function() {
    return {
        restrict: 'E',
        scope: { user: '=', show: '=' },
        templateUrl: '/app/directives/multibar/template.html',
        css: '/app/directives/multibar/style.css',

        controller: function($scope) {
		    nv.addGraph(function() {
			
				var data = [{
							"key": "Valor dos Bens (R$)",
							"color": "#d67222",
							"values": [
							  { 
								"label" : "Group A" ,
								"value" : 100.8746444827653
							  } , 
							  { 
								"label" : "Group B" ,
								"value" : -8.0961543492239
							  } , 
							  { 
								"label" : "Group C" ,
								"value" : -0.57072943117674
							  } , 
							  { 
								"label" : "Group D" ,
								"value" : -2.4174010336624
							  } ]
						}];
					  
				var chart = nv.models.multiBarChart()
					.x(function(d) { return d.label })
					.y(function(d) { return d.value })
					//.margin({top: 40, right: 40, bottom: 20, left: 40})
					//.showValues(true)           
					//.tooltip.enabled(false)            
					 .showControls(false)        //Allow user to switch between "Grouped" and "Stacked" mode.
					//.width(600)				
					 //.height(100%)	
					.options({ duration: 1300 });
					//.forceY([0, 2000]);
				chart.yAxis.tickFormat(d3.format(',.2f'));
				

				d3.select('#div1 svg')
				.datum(data)
				.call(chart);

				nv.utils.windowResize(chart.update);

				return chart;
		  });

			var chart2 = nv.models.multiBarChart().showControls(false);
			var data2 = [
			  {
				key: "S1",
				color: "#51A351",
				values:
				[      
				  { x : "A", y : 40 },
				  { x : "B", y : 30 },
				  { x : 5,   y : 20 }  
				]
			  },
			  {
				key: "S2",
				color: "#BD362F",
				values:
				[      
				  { x : "A", y : 60 },
				  { x : "B", y : 50 },
				  { x : 5,   y : 70 } 
				]
			  },
			 {
				key: "S2",
				color: "#DAAA99",
				values:
				[      
				  { x : "A", y : 60 },
				  { x : "B", y : 50 },
				  { x : 5,   y : 70 } 
				]
			  }
			];

			d3.select('#div2 svg').datum(data2).transition().duration(500).call(chart2);
        }
    }
});
