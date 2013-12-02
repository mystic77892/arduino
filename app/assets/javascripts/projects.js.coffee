# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Project ||= {}
Project.show = () ->
	$ ->
	  new Highcharts.Chart(
	  	chart:
	    	renderTo: "projectchart"
	    title:
	    	text: gon.project.name
	    xAxis:
	    	type: 'datetime'
	    	title: 
	    		text:gon.project.x_name
	    	labels:
	        formatter: ->
	        	Highcharts.dateFormat("%b %e %H:%M", this.value);
	    yAxis: 
	    	title: 
	    		text: gon.project.y_name 
	    series: [
	    					data: if gon.data_values? then $.map(gon.data_values, (item, index) -> item.value) else []
	    				]
	    plotOptions:
	    	series:
	    		pointStart: new Date(gon.data_values[0].created_at).getDate()
	  )