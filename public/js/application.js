$(document).ready(function() {

	var Pipe = function(id, htmlElement) {
		this.broken = false;
		this.pipeId = id;
		this.$htmlElement = htmlElement;
		this.break = function() {
			this.$htmlElement.html("X");
		};
		this.repair = function() {
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
	debugger;

  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
