// SET THIS VARIABLE FOR DELAY, 1000 = 1 SECOND
var delayLength = 10000;
	
function doMove(panelWidth, tooFar) {
    
	var leftValue = $j("#mover").css("left");
	
	// Fix for IE
	if (leftValue == "auto") { leftValue = 0; };
	
	var movement = parseFloat(leftValue, 10) - panelWidth;
	
	if (movement == tooFar) {
		$j(".slide img").animate({
			"top": -200
		}, function() {
			$j("#mover").animate({
				"left": 0
			}, function() {
				$j(".slide img").animate({
					"top": 20
				});
			});
		});
	}
	else {
		$j(".slide img").animate({
			"top": -200
		}, function() {
			$j("#mover").animate({
				"left": movement
			}, function() {
				$j(".slide img").animate({
					"top": 20
				});
			});
		});
	}
}

$j(document).ready(function() {
    var $slide1 = $j("#slide-1");

	var panelWidth = $slide1.css("width");
	var panelPaddingLeft = $slide1.css("paddingLeft");
	var panelPaddingRight = $slide1.css("paddingRight");

	panelWidth = parseFloat(panelWidth, 10);
	panelPaddingLeft = parseFloat(panelPaddingLeft, 10);
	panelPaddingRight = parseFloat(panelPaddingRight, 10);

	panelWidth = panelWidth + panelPaddingLeft + panelPaddingRight;
	
	var numPanels = $j(".slide").length;
	var tooFar = -(panelWidth * numPanels);
	var totalMoverwidth = numPanels * panelWidth;
	$j("#mover").css("width", totalMoverwidth);

	

	sliderIntervalID = setInterval(function(){
		doMove(panelWidth, tooFar);
	}, delayLength);
	


});