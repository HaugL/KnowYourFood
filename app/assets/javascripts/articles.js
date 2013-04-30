$(document).ready(function() {
	if(document.getElementById('section-content') != null){
		$(function action() {
	    $('.click').bind('click', function (e) {
	       $.ajax({
	       type: 'GET',
	       url: '/get_section?section_title='+e.target,
	       success: setSection,
	       error: setEmpty,
	       async:   false
	      });
	    });
	});

	}

});


	function getSection(target){}

	function setSection(section){
		//empty out div
		$('#section-content').empty();

		//If the section has text, then display it
		if(section.text != null)
			addSectionText(section.text);

		//For each sub_section add a sub section title and sub section text
		jQuery.each(section.sub_sections, function(i, val) {
			addSubSectionTitle(i);
			addSubSectionText(val.text);
		});
	}

	function setEmpty(){

	}

	function addSectionText(text){
		var section_content = document.getElementById('section-content');
		var newText = document.createElement('div');
		newText.setAttribute('class', 'section-text');
		newText.innerHTML = text;
		section_content.appendChild(newText);
	}

	function addSubSectionTitle(title){
		var section_content = document.getElementById('section-content');
		var newTitle = document.createElement('div');
		newTitle.setAttribute('class', 'title sub-section-title');
		newTitle.innerHTML = title;
		section_content.appendChild(newTitle);
	}

	function addSubSectionText(text){
		var section_content = document.getElementById('section-content');
		var newText = document.createElement('div');
		newText.setAttribute('class', 'sub-section-text');
		newText.innerHTML = text;
		section_content.appendChild(newText);
	}

	function stringify_names(titles){
		return 'tits';
	}