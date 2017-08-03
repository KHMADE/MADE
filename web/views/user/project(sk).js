$.fn.setPreview = function(opt){
    "use strict"
    var defaultOpt = {
        inputFile: $(this),
        img: null,
        w: 200,
        h: 200
    };
    $.extend(defaultOpt, opt);
 
    var previewImage = function(){
        if (!defaultOpt.inputFile || !defaultOpt.img) return;
 
        var inputFile = defaultOpt.inputFile.get(0);
        var img       = defaultOpt.img.get(0);
 
        // FileReader
        if (window.FileReader) {
            // image 파일만
            if (!inputFile.files[0].type.match(/image\//)) return;
 
            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    img.src = e.target.result;
                    img.style.width  = defaultOpt.w+'px';
                    img.style.height = defaultOpt.h+'px';
                    img.style.display = '';
                }
                reader.readAsDataURL(inputFile.files[0]);
            } catch (e) {
                // exception...
            }
        // img.filters (MSIE)
        } else if (img.filters) {
            inputFile.select();
            inputFile.blur();
            var imgSrc = document.selection.createRange().text;
 
            img.style.width  = defaultOpt.w+'px';
            img.style.height = defaultOpt.h+'px';
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";           
            img.style.display = '';
        // no support
        } else {
            // Safari5, ...
        }
    };
 
    // onchange
    $(this).change(function(){
        previewImage();
    });
};
 
 
$(document).ready(function(){
    var opt = {
        img: $('#img_preview'),
        w: 200,
        h: 200
    };
 
    $('#input_file').setPreview(opt);
});
$(document).ready(function(){
    var opt = {
        img: $('#img_preview'),
        w: 200,
        h: 200
    };
 
    $('#input_file2').setPreview(opt);
});
function appendYear(){

	var date = new Date();

	var year = date.getFullYear();

	var selectValue = document.getElementById("year");

	var optionIndex = 0;



	for(var i=year-100;i<=year;i++){

			selectValue.add(new Option(i+"년",i),optionIndex++);                        

	}

}





function appendMonth(){

	var selectValue = document.getElementById("month"); 

	var optionIndex = 0;



	for(var i=1;i<=12;i++){

			selectValue.add(new Option(i+"월",i),optionIndex++);

	}

}





function appendDay(){

	var selectValue = document.getElementById("day");

	var optionIndex = 0;



	for(var i=1;i<=31;i++){

			selectValue.add(new Option(i+"일",i),optionIndex++);

	}

} 





