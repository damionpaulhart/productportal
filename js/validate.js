function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function setProductType()
{
	var selectPrdType = document.searchsupport.ProductType.value;
	var pName="";
	var optionLength = 0;
	var a =0;
	if(selectPrdType!="")
	{
		optionLength = document.searchsupport.Series.length;
		a=optionLength-1;
		while(a>=0)
		{
			deleteIndex=document.searchsupport.Series.options.length-1;
			document.searchsupport.Series.options[deleteIndex]=null;
			a=a-1;
		}
		for(i=0;i<allSeries.length;i++)
		{
			if(i==0)
			{
				myOption=new Option();
				myOption.text ="           -           ";
				myOption.value = "";
				insertIndex=document.searchsupport.Series.options.length;
				document.searchsupport.Series.options[insertIndex]=myOption;
			}
			pName = allSeries[i].productType;
			if(selectPrdType==pName)
			{
				myOption=new Option();
				myOption.text =allSeries[i].seriesName ;
				myOption.value = allSeries[i].seriesName;
				insertIndex=document.searchsupport.Series.options.length;
				document.searchsupport.Series.options[insertIndex]=myOption;
			}
		}
		setSeries();
	}
	else
	{
		optionLength = document.searchsupport.Series.length;
		a=optionLength-1;
		while(a>=0)
		{
			deleteIndex=document.searchsupport.Series.options.length-1;
			document.searchsupport.Series.options[deleteIndex]=null;
			a=a-1;
		}
		myOption=new Option();
		myOption.text ="           -           ";
		myOption.value = "";
		insertIndex=document.searchsupport.Series.options.length;
		document.searchsupport.Series.options[insertIndex]=myOption;
		document.searchsupport.Series.options[0].selected=true
		setSeries();
	}
}


function setSeries()
{

	var selectSeries = document.searchsupport.Series.options[document.searchsupport.Series.selectedIndex].value;
	var sName="";
	var optionLength = 0;
	var a =0;
	if(selectSeries!="")
	{
		for(i=0;i<allSeries.length;i++)
		{
			sName = allSeries[i].seriesName;
			if(selectSeries==sName)
			{
				optionLength = document.searchsupport.Model.length;
				a=optionLength-1;
				while(a>=0)
				{
					deleteIndex=document.searchsupport.Model.options.length-1;
					document.searchsupport.Model.options[deleteIndex]=null;
					a=a-1;
				}

				for(k=0;k<allSeries[i].models.length;k++)
				{
					if(k==0)
					{
						myOption=new Option();
						myOption.value="";
						myOption.text="            -            ";
						insertIndex=document.searchsupport.Model.options.length;
						document.searchsupport.Model.options[insertIndex]=myOption;

					}

					myOption=new Option();
					myOption.value=allSeries[i].models[k];
					myOption.text=allSeries[i].models[k] ;
					insertIndex=document.searchsupport.Model.options.length;
					document.searchsupport.Model.options[insertIndex]=myOption;

				}
				break;
			}
		}
	}
	else
	{
		optionLength = document.searchsupport.Model.length;
		a=optionLength-1;
		while(a>=0)
		{
			deleteIndex=document.searchsupport.Model.options.length-1;
			document.searchsupport.Model.options[deleteIndex]=null;
			a=a-1;
		}
		myOption=new Option();
		myOption.value="";
		myOption.text="            -            ";
		insertIndex=document.searchsupport.Model.options.length;
		document.searchsupport.Model.options[insertIndex]=myOption;
		document.searchsupport.Model.options[0].selected=true


	}
}


function prodObj() {
	var j;
	this.productType = prodObj.arguments[0];
	this.seriesName = prodObj.arguments[1];
	this.models = new Array(0);
	for (j=2; j<prodObj.arguments.length; j++) { this.models[j-2] = prodObj.arguments[j]; }
 }

function populateProductType()
{
	var curProdType = "";
	var prevProdType = "";
	var optionLength = 0;
	var a =0;
	optionLength = document.searchsupport.ProductType.length;
	p=optionLength-1;
	while(p>=0)
	{
		deleteIndex=document.searchsupport.ProductType.options.length-1;
		document.searchsupport.ProductType.options[deleteIndex]=null;
		p=p-1;
	}
	myOption=new Option();
	myOption.value="";
	myOption.text="            -            ";
	insertIndex=document.searchsupport.ProductType.options.length;
	document.searchsupport.ProductType.options[insertIndex]=myOption;

	for(i=0;i<allSeries.length;i++)
	{
		curProdType = allSeries[i].productType;
		if(curProdType!=prevProdType)
		{
			myOption=new Option();
			myOption.text =curProdType;
			myOption.value = curProdType;
			insertIndex=document.searchsupport.ProductType.options.length;
			document.searchsupport.ProductType.options[insertIndex]=myOption;
			prevProdType = curProdType;
		}
	}

}

function setCurrentSelection(pType, sName, mName)
{
	var i=0;
	while(i<document.searchsupport.ProductType.length)
	{
		if(document.searchsupport.ProductType.options[i].value == pType)
		{
			document.searchsupport.ProductType.options[i].selected = true;
			break;
		}
		i = i + 1;
	}
	setProductType();
	i =0;
	while(i<document.searchsupport.Series.length)
	{
		if(document.searchsupport.Series.options[i].value == sName)
		{
			document.searchsupport.Series.options[i].selected = true;
			break;
		}
		i = i + 1;
	}
	setSeries();
	i=0;
	while(i<document.searchsupport.Model.length)
	{
		if(document.searchsupport.Model.options[i].value == mName)
		{
			document.searchsupport.Model.options[i].selected = true;
			break;
		}
		i = i + 1;
	}
}

function validate(msrch)
{
	if(msrch=="model")
	{
		{
			alert("Please select Product Type, Series and Model to search");
			return false;
		}
		else
		{
			return true;
		}
	}
	else if(msrch=="config")
	{
		configval=document.searchsupport.config.value;
		
		if(configval=="")
		{
			alert("Please enter configuration number");
			return false;
		}
		if(configval.length < 3 || configval.length > 16 )
		{
			alert("Please enter a valid Configuration number");
			return false;
		}
		else
		{
			for (i=0; i < configval.length; i++)		
			{
				if((configval.charCodeAt(i) > 32 && configval.charCodeAt(i) < 48) ||
					(configval.charCodeAt(i) > 57 && configval.charCodeAt(i) < 65) ||
					(configval.charCodeAt(i) > 90 && configval.charCodeAt(i) < 97))
				{
					alert("Configuration number contains invalid characters.");
					return false;
					break;
				}
			}
			return true;
		}
	}
	else if(msrch=="serial")
	{
		serialval=document.searchsupport.serial.value;
		if(serialval=="")
		{
			alert("Please enter serial number");
			return false;
		}
		if(serialval.length >12)
		{
			alert("Please enter a valid Serial number");
			return false;
		}
		else
		{
			for (i=0; i < serialval.length; i++)		
			{
				if((serialval.charCodeAt(i) > 32 && serialval.charCodeAt(i) < 48) ||
					(serialval.charCodeAt(i) > 57 && serialval.charCodeAt(i) < 65) ||
					(serialval.charCodeAt(i) > 90 && serialval.charCodeAt(i) < 97))
				{
					alert("Serial number contains invalid characters.");
					return false;
					break;
				}
			}
			return true;
		}
	}
}
function populateProductType()
{
	var curProdType = "";
	var prevProdType = "";
	var optionLength = 0;
	var a =0;
	optionLength = document.searchsupport.ProductType.length;
	p=optionLength-1;
	while(p>=0)
	{
		deleteIndex=document.searchsupport.ProductType.options.length-1;
		document.searchsupport.ProductType.options[deleteIndex]=null;
		p=p-1;
	}
	myOption=new Option();
	myOption.value="";
	myOption.text="            -            ";
	insertIndex=document.searchsupport.ProductType.options.length;
	document.searchsupport.ProductType.options[insertIndex]=myOption;

	for(i=0;i<allSeries.length;i++)
	{
		curProdType = allSeries[i].productType;
		if(curProdType!=prevProdType)
		{
			myOption=new Option();
			myOption.text =curProdType;
			myOption.value = curProdType;
			insertIndex=document.searchsupport.ProductType.options.length;
			document.searchsupport.ProductType.options[insertIndex]=myOption;
			prevProdType = curProdType;
		}
	}

}
