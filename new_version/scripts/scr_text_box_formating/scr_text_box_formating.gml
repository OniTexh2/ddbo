function setupDialogue(_dlg) {
    pages = _dlg.pages;
    options = _dlg.options;
    current_page = 0;
    draw_char = 0;
}


//GLOBAL IS A PLACEHOLDER!
//will store this in a real way when the diolaouge is in 
global.text = {
txt_data : {
    pages: [
        { text: "Hello! This, is the textbox", portrait : sassy_normal, blip : sndTextBlip, font : fnt_velvet_font},
        { text: "Second page of dialogue.", portrait : noone, blip : sndTextBlip, font : fnt_velvet_font}, 
		 { text: "Thirdpage of dialogue.", portrait : sassy_normal, blip : sndTextBlip, font : fnt_velvet_font}
    ]
	/*
    options: [
        { text: "Yes", link: "branch_yes" },
        { text: "No",  link: "branch_no" }
    ]
	*/ 
}, 

/*
branch_yes : {
    pages: [
       { text: "You have selected Yes.", portrait: sprPortrait },
    ],

    options: [
        { text: "Yes", link: "branch_yes" },
        { text: "No",  link: "branch_no" }
    ]
}, 

branch_no : {
    pages: [
        { text: "You have selected No.", portrait: sprPortrait },
    ]
}
*/
}