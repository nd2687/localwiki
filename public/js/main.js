$(function(){
  var ta = $(".item-description");
  var edit = $("#item-ta-edit");
  if(ta.length == 0){ return; }

  ta.height(50);
  ta.css("lineHeight", "20px");

  resize(ta);

  if(edit.length){
    if(ta.get(0).scrollHeight > ta.get(0).offsetHeight){
      ta.height(ta.get(0).scrollHeight);
    } else {
      var lineHeight = Number(ta.css("lineHeight").split("px")[0]);

      while (true){
        ta.height(ta.height() - lineHeight);
        if(ta.get(0).scrollHeight > ta.get(0).offsetHeight){
          ta.height(ta.get(0).scrollHeight);
          break;
        }
      }
    }
  }
});

function resize(textarea){
  textarea.on("keyup", function(){
    var tval = textarea.val();
    var num = tval.match(/\n|\r\n/g);

    if(tval == "" || num == null){ return; }
    if(num != null){ var len = num.length + 1; }
    len = len + 1;
    textarea.css('height', len * 1.2 + "em");
  })
}
