$(function() {
	$('img.map').maphilight();
});

function show_info(index) {
	var text = '<h2>' + title[index] + '</h2>\n';

	if (desc[index] != undefined) {
		text += desc[index];
	}

	if (impl[index] == 'yes') {
		text += '<span class="yes">Implemented</span>';
	} else if (impl[index] == 'no') {
		text += '<span class="no">Not implemented!</span>';
	} else if (impl[index] != undefined) {
		text += '<span>Partially implemented - ' + impl[index] + '</span>';
	}

	$('div.info').html(text);
	$('div.info').show();
}

function hide_info() {
	$('div.info').hide();
}
