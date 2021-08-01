<script> 
	function showMeaning() { 
		var meanings = document.getElementsByClassName('meanings');
		for (i = 0; i < meanings.length; i += 1) {
            		meanings[i].style.visibility = meanings[i].style.visibility == "visible" ? 'hidden' : "visible";
            	}	  
	}

	function showReading() { 
		var readings = document.getElementsByClassName('readings');
		for (i = 0; i < readings.length; i += 1) {
            		readings[i].style.visibility = readings[i].style.visibility == "visible" ? 'hidden' : "visible";
            	}	  
	} 
</script>
