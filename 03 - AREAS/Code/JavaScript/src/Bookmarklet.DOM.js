javascript: with ((W = open("", "w", "width=540,height=380,resizable"))
  .document) {
  write(
    "<title>DOM of " +
      document.title +
      "</title><script>var ob;var objs=new Array();var lvls=new Array();function resized(){document.getElementById('doceval').style.height=document.body.clientHeight-document.getElementById('doceval').offsetTop+12;}onresize=resized;function evalExpr(){ob=document.forms[0].elements[0].value;var x=ob.split('[');lvls.length=0;for(var i=0;i<x.length;i++)lvls=lvls.concat(x[i].split('.'));for(var i=0;i<lvls.length;i++)if(lvls[i].indexOf(']')==lvls[i].length-1)lvls[i]=lvls[i].replace(']','');}function getProps(){evalExpr();var obj;try{obj=eval('window.opener.'+ob);}catch(e){alert('Could not evaluate '+ob);return}ob=document.forms[0].elements[0].value;var obj=eval('opener.'+ob);var slct=document.forms[0].elements['doceval'];slct.length=0;objs.length=0;for(var elem in obj){objs[objs.length]=elem;var newOpt=document.createElement('OPTION');slct.add(newOpt,0);}objs=objs.sort();for(var i=0;i<objs.length;i++){var opt=slct[i];opt.name=objs[i];opt.innerText=objs[i]+' = '+obj[objs[i]];}try{D.innerHTML='%C2%A0 '+obj.replace(/</g,'<').replace(/\\n/g,'<br>')}catch(e){D.innerHTML='%C2%A0 '+typeof(obj);return}}function selectProp(idx){if(idx<0)return;lvls[lvls.length]=objs[idx];showProps();}function goUp(){if(lvls.length>1){lvls.length--;showProps()}}function showProps(){var s='';for(var i=0;i<lvls.length;i++){if(!isNaN(lvls[i]))s+='['+lvls[i]+']';else{if(s!='')s+='.';s+=lvls[i]}}document.forms[0].elements[0].value=s;getProps();}</script>\n<body onLoad='getProps();resized()' style='margin:0px'><form onSubmit='getProps();return false'>"
  );
  write(
    "<input type=text value=document size=60> <input type=submit value=' Get ' onClick='getProps()'> <input type=button value=' Up ' onClick='goUp()'> <input type=button value='Close' onClick='window.close()'><div id=D></div><select id=doceval size=20 style='width:100%' onDblClick='selectProp(this.selectedIndex)'></select></form></body>"
  );
  close();
}
W.focus();
