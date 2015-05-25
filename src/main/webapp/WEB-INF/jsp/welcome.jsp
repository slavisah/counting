<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
  <script type="text/javascript" src="<%= response.encodeURL( request.getContextPath() + "/js/jquery-1.11.3.min.js" ) %>"></script>
  <script type="text/javascript" src="<%= response.encodeURL( request.getContextPath() + "/js/countdown.js" ) %>"></script>
</head>
<body>
  <c:url value="/resources/text.txt" var="url"/>
  <spring:url value="/resources/text.txt" htmlEscape="true" var="springUrl" />
  Current time: ${time}
  <br>
  Counting till: ${dohvatStartTimeInLong}
  <div>Counter: <span id="time" style="color: red"></span></div>
</body>
<script type="text/javascript">

    $(document).ready(function() {
			var dohvatStartTime = <c:out value="${ dohvatStartTimeInLong.time }"/>;
			countdown.setLabels(
				' | | | | | | | | | | ', 
				' | | | | | | | | | | ', 
				' : ', 
				' : ', 
				'Now.',
				function(n) {
				    return n.pad(2);
				});
			var timerId = countdown(new Date(dohvatStartTime),
				function(ts) {
			    	if (ts.hours == 0 && ts.minutes == 0 && ts.seconds == 0) {
			    		window.clearInterval(timerId);
			    	}
				    $('#time').text(ts.toCustomString());
				}, countdown.HOURS | countdown.MINUTES | countdown.SECONDS);
			});
    
    Number.prototype.pad = function(size) {
    	var s = String(this);
    	while (s.length < (size || 2)) {
    	    s = "0" + s;
    	}
    	return s;
    };
</script>
</html>