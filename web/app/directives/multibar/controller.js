	app.directive('multibar', function() {
        return {
            restrict: 'E',
            scope: { data: '=' },
            templateUrl: '/app/directives/multibar/template.html',
            css: '/app/directives/multibar/style.css',

            link: function(scope) {
                nv.addGraph(function() {
                    var chart = nv.models.multiBarChart()
                        .x(function(d) { return d.label })
                        .y(function(d) { return d.value })
                        .showControls(false)        //Allow user to switch between "Grouped" and "Stacked" mode.
                        .options({ duration: 1300 });

                    chart.yAxis.tickFormat(d3.format(',.2f'));

                    d3.select('multibar svg')
                        .datum(data)
                        .call(chart);

                    nv.utils.windowResize(chart.update);

                    return chart;
              });
        }
    }
});
