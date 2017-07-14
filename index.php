<?php
	$file = basename($_SERVER["REQUEST_URI"]);

	if (substr($file, -4) != ".xml") {
		$file = "index.xml";
	}

	$xml = new domdocument;
	$xslt = new domdocument;

	if ($xml->load($file) == false) {
		exit("Error loading XML.");
	}
	if ($xslt->load("index.xslt") == false) {
		exit("Error loading stylesheet.");
	}

	$processor = new xsltprocessor();
	if ($processor->importstylesheet($xslt) == false) {
		exit("Error importing stylesheet.");
	}
	if (($html = $processor->transformtoxml($xml)) == false) {
		exit("Error transforming to HTML.");
	}

	print $html;
?>
