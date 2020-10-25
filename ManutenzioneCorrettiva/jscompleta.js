function CalcolaSLA(e)
{
var data_richiesta = $get('lblDataRichiesta').innerText; 
var ora_richiesta = $get('lblOraRichiesta').innerText; 
var orain = $get('OraIni').value;
var minutin= $get('MinitiIni').value;
var urg= $get('cmbsUrgenza').value.split(",");
var arr_num=ora_richiesta.split(".");
var ora_ric=arr_num[0];
var min_ric=arr_num[1];
var dataini=e.split("/");
var dataend=data_richiesta.split("/");			
var dstart=dataini[2] + dataini[1] + dataini[0]+orain+minutin;
var dfine=dataend[2] + dataend[1] + dataend[0]+ora_ric+min_ric;
var diff=(dstart - dfine);
var urgmin=(urg[1]*100)
	if(diff > urgmin)
	{
		return confirm('La data inizio lavori inserita crea uno SLA! Continuare il salvataggio?');
		
	}
	

}
function ContrallaNumSga()
{
if ($get('HSga').value=="")
	{
		alert('Impossibile inviare il documento DIE. Inviare prima il documento SGA')
		return false;
	}
}
function ManDiff()
 {
	var aseg= document.getElementById('CmbASeguito').value;//4
	var tipoman=document.getElementById('cmbsTipoIntrevento').value;//61

	if (aseg=='4'|| tipoman == '64')
	{
		alert('Non è possibile inserire una richiesta con manutenzione non differibile a seguito di un intervento non differibile.');
		return false;
	}
	else
	return true;
 }
function getkey(e)
{
	if (window.event)
	return window.event.keyCode;
	else if (e)
	return e.which;
	else
	return null;
}

function caratteriok(e, goods)
{
	var key, keychar;
	key = getkey(e);
	if (key == null) return true;

	// get character
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	goods = goods.toLowerCase();

	// check goodkeys
	if (goods.indexOf(keychar) != -1)
		return true;

	// control keys
	if ( key==null || key==0 || key==8 || key==9 
		|| key==13 || key==27 )
	return true;

	// else return false
	return false;
}

function ImpostaTotMateriali(e)
{
	
	document.getElementById('lblCostoMateriali').innerText = e;
	somma();
}
function ImpostaTotAddetti(e)
{
	document.getElementById('lblCostiPersonale').innerText = e;
	somma();
}


function SetPreventivo(Stato)
	{
	   
	    var crtl;
		switch (Stato)
		{
			case "3": //Straordinaria
			    crtl=document.getElementById("trprev1").style; 
				crtl.display="block";
			    crtl=document.getElementById("trprev2").style; 
				crtl.display="block";
				crtl=document.getElementById("trprev3").style; 
				crtl.display="block";
				if(document.getElementById("trc1")!=null)
				{
				  document.getElementById("trc1").style.display="block";
				  document.getElementById("trc2").style.display="block";
				}		
				break;
			case "1": //Ordinaria	
			    crtl=document.getElementById("trprev1").style; 
				crtl.display="none";			
				crtl=document.getElementById("trprev2").style; 
				crtl.display="none";
				crtl=document.getElementById("trprev3").style; 
				crtl.display="none";
				if(document.getElementById("trc1")!=null)
				{
				  document.getElementById("trc1").style.display="none";
				  document.getElementById("trc2").style.display="none";
				}	
				break;
			default:
			     crtl=document.getElementById("trprev1").style; 
				crtl.display="none";			
				crtl=document.getElementById("trprev2").style; 
				crtl.display="none";
				crtl=document.getElementById("trprev3").style; 
				crtl.display="none";
				if(document.getElementById("trc1")!=null)
				{
				  document.getElementById("trc1").style.display="none";
				  document.getElementById("trc2").style.display="none";
				}	
				break;
		}		
	}
function IsValidDateWork()
{
	var aseg= document.getElementById('CmbASeguito').value;//4
	var tipoman=document.getElementById('cmbsTipoIntrevento').value;//61

	if (aseg=='4' && tipoman == '64')
	{
		alert('Non è possibile inserire una richiesta con manutenzione non differibile a seguito di un intervento non differibile.');
		return false;
	}
	
	 if(document.getElementById('CalendarPicker6_S_TxtDatecalendar')==null)
	    return;
	 var dini=document.getElementById('CalendarPicker6_S_TxtDatecalendar').value;
	 var dend=document.getElementById('CalendarPicker2_S_TxtDatecalendar').value;
	
	    
	 if (dini!="" || dend!="")
	 {
	
			var dataini=dini.split("/");
			var dataend=dend.split("/");
			if(dini=="")
			{
				alert("Inserire la Data Prevista Inizio Lavori!" ) ;
				return false;
			}
			if(dend=="")
			{
				alert("Inserire la Data Prevista Fine Lavori!" ) ;
				return false;
			}
			var dstart=dataini[2] + dataini[1] + dataini[0];
			var dfine=dataend[2] + dataend[1] + dataend[0];
			if(dstart>dfine)
			{
			    alert("Data Prevista Inizio Lavori non può essere maggiore della Data  Prevista Fine Lavori!");
				return false;
			}
	 }
}



function deletedoc()
{
	return confirm("Eliminare il documento selezionato!");
}
function IsEmissione()
{
	var msg='';
	if ($get('cmbsServizio').value=="")
	    msg="Selezionare un Servizio!";
	
	if ($get('cmbsAddetto').value=="" || $get('cmbsAddetto').value=="0")
	{
	   if(msg!="") msg=msg + "\n";
	     
	    msg=msg + "Selezionare un Addetto!";
	}
	    
/*	if ($get('CmbASeguito').value=="" || $get('CmbASeguito').value=="0")
	{
	   if(msg!="") msg=msg + "\n";
	     
	    msg=msg + "Selezionare un valore della sezione 'A SEGUITO DI'!";
	}*/
	
	if ($get('CalendarPicker6_S_TxtDatecalendar').value=="")
	{
	   if(msg!="") msg=msg + "\n";
	     
	    msg=msg + "Impostare la data prevista inizio lavori!";
	}
	
	if($get('CalendarPicker2_S_TxtDatecalendar')!=null)
	{
		if ($get('CalendarPicker2_S_TxtDatecalendar').value=="")
		{
		if(msg!="") msg=msg + "\n";
	     
	    msg=msg + "Impostare la data prevista fine lavori!";
		}
	}
	 if(msg!="") 
	 {
	    alert(msg);
		return false;
	 }
}
function SetStato(stato)
{
  if (stato=="8" || stato=="11" || stato=="12" || stato=="13" || stato=="14")
	$get("trsosp").style.display="block";
  else
    $get("trsosp").style.display="none";
    
    if(stato=="4")
      $get("trsod").style.display="block";
    else
      $get("trsod").style.display="none";
}
function SgaSalvata()
{
	if (IsCompleta()== false)
	{
		return false;
	 }
	 if ($get('cmbsstatolavoro').value=="4")
	return confirm('Attenzione, richiesta completata. Procedere comunque con il salvataggio?')
}

function IsCompleta()
{
	 
    
    
    //&& document.getElementById('cmbsstatolavoro').value=='4'
    
	var manutenzione=document.getElementById('cmbsTipoManutenzione').options[document.getElementById('cmbsTipoManutenzione').selectedIndex].value;
	
	if((manutenzione=='1' || manutenzione=='3') 
	&& (document.getElementById('cmbSoluzioni').selectedIndex==0 && document.getElementById('txtSoluzione').value=='')
	&& document.getElementById('cmbsstatolavoro').value==4
	){
//	if((manutenzione=='1' || manutenzione=='3') 
//	&& document.getElementById('txtSoluzione').value==''
//	&& document.getElementById('cmbsstatolavoro').value==4
//	){
		alert("Selezionare una soluzione problema-causa oppure digitare una nuova soluzione Problema-causa Testo!");
		document.getElementById('txtSoluzione').focus();
		return false;
	}
	
    if ($get('cmbsstatolavoro').value!="4") //Se lo stato è diverso da quello di completamento non faccio i controlli
		return true;
    
     var dini=document.getElementById('CalendarPicker7_S_TxtDatecalendar').value;
	 var dend=document.getElementById('CalendarPicker8_S_TxtDatecalendar').value;
	 //var dprev=document.getElementById('CalendarPicker10_S_TxtDatecalendar').value;
	 

	//if (dprev=="")
	//{alert ("Inserire la data prevista fine lavori");return false;}
	 if (dini!="" || dend!="")
	 {
	
			var dataini=dini.split("/");
			var dataend=dend.split("/");
			if(dini=="")
			{
				alert("Inserire la Data Inizio Lavori!" ) ;
				return false;
			}
			if(dend=="")
			{
				alert("Inserire la Data Fine Lavori!" ) ;
				return false;
			}
			var dstart=dataini[2] + dataini[1] + dataini[0];
			var dfine=dataend[2] + dataend[1] + dataend[0];
			if(dstart>dfine)
			{
			    alert("Data Inizio Lavori non può essere maggiore della Data Fine Lavori!");
				return false;
			}
	 }
	  if (CalcolaSLA(dini)== false)
	 return false;
    var msg='';
	if ($get('cmbsServizio').value=="")
	    msg="Selezionare un Servizio!";
	
	if ($get('cmbsAddetto').value=="" || $get('cmbsAddetto').value=="0")
	{
	   if(msg!="") msg=msg + "\n";
	     
	    msg=msg + "Selezionare un Addetto!";
	}
	    
	//if ($get('CmbASeguito').value=="" || $get('CmbASeguito').value=="0")
	//{
	//   if(msg!="") msg=msg + "\n";
	     
	//    msg=msg + "Selezionare un valore della sezione 'A SEGUITO DI'!";
//	}
	
	if ($get('CalendarPicker7_S_TxtDatecalendar').value=="")
	{
	     if(msg!="") msg=msg + "\n";
	     
	    msg=msg + "Selezionare la Data Inizio Intervento!";
	}
	if ($get('CalendarPicker8_S_TxtDatecalendar').value=="")
	{
	     if(msg!="") msg=msg + "\n";
	     
	    msg=msg + "Selezionare la Data Fine Intervento!";
	}    
	if(msg!="") 
	 {
	    alert(msg);
		return false;
	 }
	//Data Creazione
    //var dc=$get('lblDataRichiesta').innerText.split("/");
    //var di=$get('CalendarPicker7_S_TxtDatecalendar').value.split("/");
	//var dt=$get('CalendarPicker8_S_TxtDatecalendar').value.split("/");
	//var de=$get('CalendarPicker10_S_TxtDatecalendar').value.split("/");

	//var dc1=dc[2] + dc[1] + dc[0];
	//var dc2=di[2] + di[1] + di[0];
	//var dc3=dt[2] + dt[1] + dt[0];
	//var dc4=de[2] + de[1] + de[0];
   
	//if(dc1>dc2)
	//{
	//	alert("La Data Inizio Lavori non può essere maggiore della Data di Creazione!");
	//	return false;
	//}
	//if(dc1>dc3)
	//{
	//	alert("La Data Fine Lavori non può essere maggiore della Data di Creazione!");
	//	return false;
	//}
	
	//if(dc1>dc4)	{
	//	alert("La Data Provvisoria Fine Lavori non può essere maggiore della Data di Creazione!");
	//	return false;
	//}
}


function enablesopra(c)
{
	var b=!c.checked;
	$get("txtSopra").disabled=b;
	$get("CalendarPicker9_S_TxtDatecalendar").disabled=b;
	$get("CalendarPicker5_S_TxtDatecalendar").disabled=b;
	$get("CalendarPicker9_btCalendar").disabled=b;
	$get("CalendarPicker5_btCalendar").disabled=b;
	$get("txtSeguito4").disabled=b;	
}

function ApriPopUp(url)
{	
	var windowW = 800;  
	var windowH = 700;	
	W = window.open(url,'Rapporto','top=0,menubar=yes,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,copyhistory=no,width='+windowW+',height='+windowH+',align=center');			
}
var f1;
var f2;
function OpenMateriali(wr_id)
{ 			
	var param="CostoMateriali.aspx?WR_ID=" + wr_id;  
	f1=window.open(param,"lin","width=800px,height=400px,left=10px,top=10px,toolbar=no,location=no,status=yes,menubar=no,scrollbars=yes,resizable=yes");

}

function OpenPopUpAddetti(wr_id)
{ 
	var param="CostiAddetti.aspx?WR_ID=" + wr_id;  
	f2=window.open(param,"lin","width=800px,height=400px,left=10px,top=10px,toolbar=no,location=no,status=yes,menubar=no,scrollbars=yes,resizable=yes");
}



function SoloNumeri()
{	
if (event.keyCode < 48	|| event.keyCode > 57)
		{
		event.keyCode = 0;
		}	
}


function somma1()
{
    var t1=($get("txtCostiMateriali1").value!="")?$get("txtCostiMateriali1").value:'0';
    var t1m= ($get("txtCostiMateriali2").value!="")?$get("txtCostiMateriali2").value:'00';
	t1	=t1+ '.' + t1m;
	var t2=($get("txtCostiPersonale1").value!="")?$get("txtCostiPersonale1").value:"0";
    var t2m=($get("txtCostiPersonale2").value!="")?$get("txtCostiPersonale2").value:"00";
    t2	=t2+ '.' + t2m;
   
    var numero = parseFloat(t1)+parseFloat(t2);
	numero=numero + '';

	var arr_num = numero.split(".");

	if (numero.indexOf(".") != (-1))
	{
		$get("txtCostiTotale1").value=arr_num[0];
		$get("txtCostiTotale2").value=arr_num[1].substring(0, 2);
	}


	var t3=($get("lblCostoMateriali").innerText!="")?$get("lblCostoMateriali").innerText:"0";
	var t4=($get("lblCostiPersonale").innerText!="")?$get("lblCostiPersonale").innerText:"0";

 
    $get("LblTotale").innerText=parseFloat(t3)+parseFloat(t4);    
   
   //  alert(parseFloat(t1)+parseFloat(t3));
    // alert(' mio result  ' + sommaformatta(t1,t3));  
    //$get("LblTotMateriali").innerText=parseFloat(t1) + parseFloat(t3);
    //alert( 't1 ' + t1 + ' t3 ' +  t3 +' mio result  ' + sommaformatta(t1,t3));
    $get("LblTotMateriali").innerText=sommaformatta(t1,t3);
 
    $get("LblTotPersonale").innerText=parseFloat(t2) + parseFloat(t4);
    
    $get("LblTotGenerale").innerText=(parseFloat($get("LblTotMateriali").innerText) + parseFloat($get("LblTotPersonale").innerText)).toFixed(2);
	
/*
     if($get("txtCostiMateriali1")==null) return;
     var imp1;
     var imp2;
     if ($get("txtCostiMateriali1").value=="")
        imp1="0";
     else
        imp1=$get("txtCostiMateriali1").value;
        
     if ($get("txtCostiMateriali2").value=="")
        imp2="00";
     else
        imp2=$get("txtCostiMateriali2").value;
     
     var impp1;
     var impp2;
     
     if ($get("txtCostiPersonale1").value=="")
        impp1="0";
     else
        impp1=$get("txtCostiPersonale1").value;
        
     if ($get("txtCostiPersonale2").value=="")
		impp2="00";
	 else
	   impp2=$get("txtCostiPersonale2").value;
		
		var t1=imp1 + '.' + imp2;
		var t2=impp1 + '.' + impp2;
		var numero = parseFloat(t1)+parseFloat(t2);
		numero=numero + '';
		var arr_num = numero.split(".");

		if (numero.indexOf(".") != (-1))
		{
		    $get("txtCostiTotale1").value=arr_num[0];
			$get("txtCostiTotale2").value=arr_num[1].substring(0, 2);
		}
	
		var tot1;
		var tot2;
		var tot;
	if ($get("txtCostiTotale1").value=="")
        tot1="0";
     else
        tot1=$get("txtCostiTotale1").value;
        
     if ($get("txtCostiTotale2").value=="")
        tot2="00";
     else
        tot2=$get("txtCostiTotale2").value;
     
		tot =tot1 + '.' + tot2;
	//lbltotale
	var impadd;
	var impadd;
	 if ($get("lblCostoMateriali").innerText=="")
        impmat="0";
     else
        impmat=$get("lblCostoMateriali").innerText;
        
    if ($get("lblCostiPersonale").innerText=="")
        impadd="00";
     else
        impadd=$get("lblCostiPersonale").innerText;
       
     $get("LblTotale").innerText=parseFloat(impmat)+parseFloat(impadd);
     
     //lbltotmateriali
       $get("LblTotMateriali").innerText= parseFloat(t1)+parseFloat(impmat);
     //lbltotadd
       $get("LblTotPersonale").innerText= parseFloat(t2)+parseFloat(impadd);
     //LblTotGenerale
      $get("LblTotGenerale").innerText= parseFloat( $get("LblTotale").innerText)+parseFloat(tot);*/
}



function VisualizzaNote(chk)
{
	var ctrl=!document.getElementById(chk).checked;
	$get('TxtAForfait').disabled=ctrl;
	if (ctrl==true)
		$get('TxtAForfait').value="";
}


function closewin()
{
	if (f1!=null)
	    f1.close();
	if (f2!=null)
	    f2.close();    
}

function $get(ct)
{
 return document.getElementById(ct);
}

 function checkFileExtension(elem) {
        var filePath = elem.value;

        if(filePath.indexOf('.') == -1)
            return false;
        
        var validExtensions = new Array();
        var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
    
        validExtensions[0] = 'jpg';
        validExtensions[1] = 'jpeg';
        validExtensions[2] = 'gif';  
        validExtensions[3] = 'tif';  
        validExtensions[4] = 'zip';
        validExtensions[5] = 'pdf';
    
        for(var i = 0; i < validExtensions.length; i++) {
            if(ext == validExtensions[i])
                return true;
        }

        alert("L'estenzione del file ' + ext.toUpperCase() + ' selezionato non è valida!");
        return false;
    }
    
function somma()
{
	RicalcolaTotaliAG();
}
  
   function sommaformatta(mio1, mio2) {
        var intero1 = 0.0;
        var decimale1 = 0.0;
        var intero2 = 0.0;
        var decimale2 = 0.0;
// trasformo le virgole in punto
//        mio1 = mio1 + '00';
//        mio2 = mio2 + '00';
        mio1 = mio1.replace(',', '.');
        mio2 = mio2.replace(',', '.');
        //alert('rep ' + mio1);
        //alert('rep ' + mio2);

        var arr_num1 = mio1.split(".");
        if (mio1.indexOf(".") != -1)  //s e è con decimale
        {
            if (arr_num1[1].length <= 2) {
                intero1 = parseFloat(arr_num1[0]);
                decimale1 = parseFloat(('0.'+arr_num1[1]));
            }
            else {
               intero1 = parseFloat(arr_num1[0]);
               decimale1 = parseFloat(('0.'+arr_num1[1].substring(0, 2)));
            }
        }
        else {
            intero1 = parseFloat(mio1);
            decimale1 = 0.00;
        }
       //alert(intero1);
       //alert(decimale1);
        var deciTemp = '0,00';
        var arr_num2 = mio2.split(".");
        if (mio2.indexOf(".") != -1)  //s e è con decimale
        {
            if (arr_num2[1].length <= 2) {
               intero2 = parseFloat(arr_num2[0]);
                decimale2 = parseFloat(('0.'+arr_num2[1]));
            }
            else {
               intero2 = parseFloat(arr_num2[0]);
               decimale2 = parseFloat(('0.'+arr_num2[1].substring(0, 2)));
            }
        }
        else {
            intero2 = parseFloat(mio2);
            decimale2 = 0.00;
        }
       //alert(decimale2);
       //alert(decimale1);
            
        var intero = parseFloat(intero1) + parseFloat(intero2);
        var decimale = decimale1 + decimale2;
        
        /*var appodecimale = ''+decimale;
        
        if(appodecimale.indexOf(".")!=-1){
			var arrappodecimale = appodecimale.split('.');
			if(arrappodecimale[1].length>0)
				decimale = parseFloat(arrappodecimale[0]+'.'+(arrappodecimale[1]).substring(0, 2));
        }*/
        var somma = parseFloat(intero) + parseFloat(decimale);
       somma = somma.toFixed(2);
        /*var apposomma = ''+somma;
        if(apposomma.indexOf(".")!=-1){
			var arrapposomma = apposomma.split('.');
			if(arrapposomma[1].length>0)
				somma = parseFloat(arrapposomma[0]+'.'+(arrapposomma[1]).substring(0, 2));
	    }    */
       
        var rusultato = '0,0';
        if (somma.toString().indexOf(".") != -1)  //s e è con decimale
        {
            rusultato = somma.toString().replace('.', ',');
          //  alert(' ce il punto somma   ' + somma);
            
        }
        else {
            rusultato = somma.toString() + ',00';
            // alert(' NON il punto somma   ' + somma);
        }
        //alert(rusultato);
        return rusultato;
        // alert(rusultato);
    }
      function RicalcolaTotaliAG() {
        // manuale # txtCostiMateriali1-2  txtCostiPersonale1-2  txtCostiTotale1 e 2
        // misura #  lblCostoMateriali   lblCostiPersonale   LblTotale
        // totale #  LblTotMateriali     LblTotPersonale     LblTotGenerale
        
        // manuale #
        var txtCMat1 = document.getElementById('txtCostiMateriali1').value;
        var txtCMat2 = document.getElementById('txtCostiMateriali2').value;
        var txtCPer1 = document.getElementById('txtCostiPersonale1').value;
        var txtCPer2 = document.getElementById('txtCostiPersonale2').value; 

        var txtCMat12= txtCMat1 + ',' + txtCMat2;
        var txtCPer12= txtCPer1 + ',' + txtCPer2;
      
     // alert(txtCMat12 + '  -  ' + txtCPer12); // 30,00 - 0,00

        var sommaManuale = sommaformatta(txtCMat12, txtCPer12);
        var arr_sommaManuale = sommaManuale.split(",");
         $get("txtCostiTotale1").value = arr_sommaManuale[0];
        $get("txtCostiTotale2").value = arr_sommaManuale[1];

        // a misura #
        var txtCMat=($get("lblCostoMateriali").innerText!="")?$get("lblCostoMateriali").innerText:"0";
        var txtCPer=($get("lblCostiPersonale").innerText!="")?$get("lblCostiPersonale").innerText:"0";
      //  var txtCPer = document.getElementById('lblCostiPersonale').value;
        var sommaMisura = sommaformatta(txtCMat, txtCPer);
        $get("LblTotale").value = sommaMisura;
        $get("LblTotale").innerText = sommaMisura;
        //alert(txtCMat1 +' - '+ txtCMat);
        //alert(sommaformatta(txtCMat1, txtCMat));
      // totali -----------------------------------------------------------------
        var sommaMateriali = sommaformatta(txtCMat12, txtCMat);
        $get("LblTotMateriali").value = sommaMateriali;
        $get("LblTotMateriali").innerText = sommaMateriali;
         
        var sommaPersonale = sommaformatta(txtCPer12, txtCPer);
        $get("LblTotPersonale").value = sommaPersonale;
        $get("LblTotPersonale").innerText = sommaPersonale;         
         
         //  LblTotPersonale   LblTotMateriali 
        // alert(sommaMateriali);
        // alert(sommaPersonale);
        // alert('somma mat + per ' +  sommaPersonale  + ' -,- ' + sommaMateriali + '  -  ' + sommaformatta(sommaMateriali,sommaPersonale));
        $get("LblTotGenerale").value = sommaformatta(sommaMateriali, sommaPersonale);
        $get("LblTotGenerale").innerText = sommaformatta(sommaMateriali, sommaPersonale);

    }