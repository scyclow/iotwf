$(document).ready(function() {

	var Pipe = function(id, htmlElement) {
		this.broken = false;
		this.pipeId = id;
		this.$htmlElement = htmlElement;
		this.break = function() {
			this.broken = true;
			this.$htmlElement.html("X");
		};
		this.repair = function() {
			this.broken = false;
			this.$htmlElement.html("_");
		};
	};

	var pipesHTML = document.getElementsByClassName("pipe");

	var pipes = [];

	for(var i=0; i < pipesHTML.length; i++) {
		var pipeId = pipesHTML[i].id;
		var pipeNum = pipeId.substr(5,pipeId.length - 5);
		var $pipeElement = $("#" + pipesHTML[i].id);
		pipes.push(new Pipe(pipeNum, $pipeElement));
	};


	setInterval(function() {
		$.ajax({
			url: '/', 
			success: function(data) {	
				for(var i=1; i <= pipes.length; i++) {
					if(data[i]['working'] === true && pipes[i-1].broken === true){
						pipes[i-1].repair();
					};
					if(data[i]['working'] === false && pipes[i-1].broken === false) {
						pipes[i-1].break();
					};
				};
			},
		dataType: 'json'
	});
	}, 1000);

  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
