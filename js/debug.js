if (window.Event) {
	document.captureEvents(Event.MOUSEMOVE);
}
document.onmousemove = getCursorXY;

function getCursorXY(e) {
	var rect = document.getElementById("image").getBoundingClientRect();

	document.getElementById('cursorX').value = ((window.Event) ? e.pageX : event.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft)) - Math.round(rect.left);
	document.getElementById('cursorY').value = ((window.Event) ? e.pageY : event.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop)) - Math.round(rect.top) - window.scrollY;
}
