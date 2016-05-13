<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DOE.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="..\css\styles.css" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="../JS/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.9.1.js"></script>
<script src="../JS/jquery-ui-1.9.2/jquery-1.10.0.min.js" type="text/javascript"></script>    
<script src="../JS/jquery-ui-1.9.2/jquery-ui.min.js" type="text/javascript"></script>
<link href="../JS/jquery-ui-1.9.2/jquery-ui.css" rel="stylesheet" type="text/css" />  

    <title>DOE</title>
   
    <style type="text/css">

.font8
	{color:blue;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:細明體, monospace;
	}
.font6
	{color:blue;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	}
        .style-doe-head{
            width:300px;
            height:50px;

        }
        .style-doe-head-2{
            width:500px;
            height:50px;

        }
        .style-doe-head-blue
        {
            width:400px;
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
           
            
            background: #538ED5;
        }
        .style-doe-head-gray
        {
           
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
           
            
            background: #7F7F7F;
        }
        
        .style-doe-head-orange
        {
            width:400px;
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            /*padding-left: 2px;
            padding-right: 2px;
            padding-top: 2px;
            padding-bottom: 2px;*/
            
            background: #FFC000;
        }
        .auto-style1 {
            width: 40px;
        }
    </style>
<script type="text/javascript">
        
        
        var save_row = 0;
        var rowspan_count = 0;
        var row_count = 0;
        var row_array = new Array();        
        var temp = 0;
        var temp_delete = 0;

        var rowspan_temp=0;
       
        function index(r) {

            
            var row_obj

                     
            row = r.parentNode.parentNode.rowIndex;
            row_array[temp]=row;
            

            if (row != row_array[temp - 1]) {              
                row_count = 0;              
            }
            

            
                                             
            row_count++;
            
            save_row = row + row_count;
            rowspan_temp = row;
            row_obj = document.getElementById('doe_1').insertRow(save_row);
            row_obj.id = 'row_' + (save_row).toString();
            row_obj.className = "row_"+row.toString();


                     

            for (i = 0; i < 14; i++) {

                var a = row_obj.insertCell(i);

                a.id = "td_" + (save_row).toString() + "_" + i.toString();

                if (i == 0) {

                    var btn = document.createElement("INPUT");
                    btn.type = "button";
                    btn.id = "but_" + (save_row).toString() + "_" + i.toString();

                    btn.value = "Delete"

                    btn.onclick = deleteRow;
                    a = document.getElementById("td_" + (save_row).toString() + "_" + i.toString()).appendChild(btn);
                    a.innerHTML = (save_row).toString() + '_' + i.toString();

                }
                else if(i==1)
                {
                    a.innerHTML = "+";
                }
                else if(i==2)
                {
                    a.innerHTML = "-";
                }
                else if(i==12)
                {
                    var text = document.createElement("INPUT");
                    text.type = "text";
                    text.id = "text_" + (save_row).toString() + "_" + i.toString();
                    text.value = (save_row).toString() + '_' + i.toString();

                    a = document.getElementById("td_" + (save_row).toString() + "_" + i.toString()).appendChild(text);
                    document.getElementById("text_" + (save_row).toString() + "_" + i.toString()).style.width = "50%";
                    a.innerHTML = (save_row).toString() + '_' + i.toString();


                    var btn = document.createElement("INPUT");
                    btn.type = "button";
                    btn.id = "but_" + (save_row).toString() + "_" + i.toString();

                    btn.value = "+"

                    btn.onclick = addselect;
                    a = document.getElementById("td_" + (save_row).toString() + "_" + i.toString()).appendChild(btn);
                    a.innerHTML = (save_row).toString() + '_' + i.toString();
                }

                else {
                    if (i == 13)
                    {
                        break;
                    }
                    var text = document.createElement("INPUT");
                    text.type = "text";
                    text.id = "text_" + (save_row).toString() + "_" + i.toString();
                    text.value = (save_row).toString() + '_' + i.toString();
                    
                    a = document.getElementById("td_" + (save_row).toString() + "_" + i.toString()).appendChild(text);
                    document.getElementById("text_" + (save_row).toString() + "_" + i.toString()).style.width = "90%";
                    a.innerHTML = (save_row).toString() + '_' + i.toString();
                }



            }

            var str_class="row_"+row.toString()
            var row_len = document.getElementById('doe_1').getElementsByClassName(str_class).length;

            var mums_2_0 = document.getElementById('doe_1').rows[row].cells[0].rowSpan = row_len+1;
            var mums_2_1 = document.getElementById('doe_1').rows[row].cells[1].rowSpan = row_len+1;
            var mums_2_2 = document.getElementById('doe_1').rows[row].cells[2].rowSpan = row_len+1;
            rowspan_count = row_len + 1;

            temp++;
        }

        function deleteRow(r) {           
            var i = this.parentNode.parentNode.rowIndex;
            document.getElementById("doe_1").deleteRow(i);

                                    
            row_count--;
            var mums_2_0 = document.getElementById('doe_1').rows[row].cells[0].rowSpan = i - rowspan_temp;
            var mums_2_1 = document.getElementById('doe_1').rows[row].cells[1].rowSpan = i - rowspan_temp;
            var mums_2_2 = document.getElementById('doe_1').rows[row].cells[2].rowSpan = i - rowspan_temp;
           
            var tab = document.getElementById("doe_1");
            var show = document.getElementById("show_len");
            var value = tab.rows.length;
            show.textContent = value.toString();
        }
        
        function addselect()
        {
            var myOption;
            var i = this.parentNode.parentNode.rowIndex
            var select_temp="td_"+i.toString()+"_13"
            var res_Select = document.createElement("Select");
            res_Select.name = "DOE_result"
            document.getElementById(select_temp).appendChild(res_Select);

            myOption = document.createElement("option");
            myOption.text = "AVG";
            myOption.value = "AVG";
            res_Select.appendChild(myOption);
            myOption = document.createElement("option");
            myOption.text = "MAX";
            myOption.value = "MAX";
            res_Select.appendChild(myOption);
            myOption = document.createElement("option");
            myOption.text = "MIN";
            myOption.value = "MIN";
            res_Select.appendChild(myOption);
            

        }
        



    </script>
</head>







<body>
    <form id="form1" runat="server">
  <fieldset style="width:95%;" class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">DOE SET</legend>   
        <div id="div1">
            <!--border-collapse:collapse,要讓欄位邊框合併-->
            <table id="doe_1" border="1" style="border-color:black;width:100%;height:50%;border-collapse:collapse;">
                 <tr>
                     <td class="style-doe-head-blue" rowspan="2" >                     
                        <div>Area</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">
                      <div id="a1"></div>
                      <div>Control Item</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">
                      <div id="a2"></div>
                      <div>SPEC</div>
                     </td>
                     
                     <td class="style-doe-head-gray" style="width:400px;" rowspan="2" colspan="5">
                         <div id="show_len"></div>
                        <div>DOE LEGS</div>
                     </td>
                     <td class="style-doe-head-gray" style="width:550px;" rowspan="2" >
                         <div style="font-size:20px;">Wafer Qn'ty</div>
                     </td>                  
                     <td class="style-doe-head-orange" colspan="3">
                         <div>Wafer Count</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Atrribute</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Note</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Lot Number</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div style="font-size:15pt">Due date</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                          <div style="font-size:15pt">Result</div>
                     </td>                                      
                </tr>
                <tr>
                    <td style="width:100px; height:50px" class="style-doe-head-orange">
                        <div>DM</div>
                    </td>
                     <td style="width:100px;" class="style-doe-head-orange">
                         <div>PC</div>
                     </td>
                     <td style="width:100px;" class="style-doe-head-orange">
                         <div>Live</div>
                     </td>                                                                                               
                </tr>
                <tr id="row_2">
                    <td >a</td>
                     <td >b</td>
                     <td>
                         <input type="button" onclick="index(this)" value="+" />
                         <div>c</div>

                     </td>
                     <td></td>
                     <td>+</td>
                     <td>-</td>
                     <td><input id="doelge_1" name="doelge_1" type="text" maxlength="4"  class="auto-style1" value="saddsaf"/></td>
                     <td>14</td>
                     <td>jj</td>
                     <td>kk</td>
                     <td>ll</td>
                     <td>cc</td>
                     <td>dd</td>
                     <td>ll</td>
                     <td>pp</td>
                     <td>ii</td>
                     <td ></td>                                    
                </tr>
                
                <tr id="dd">
                    <td id="dd1">dd1</td>
                     <td>dd2</td>
                     <td>dd3</td>
                     <td>dd4</td>
                     <td>dd5</td>
                     <td>dd6</td>
                     <td>dd7</td>
                     <td>dd8</td>
                     <td>dd9</td>
                     <td>dd10</td>
                     <td>dd11</td>
                     <td>dd12</td>
                     <td >dd13</td>
                     <td >dd14</td>
                     <td >dd15</td>
                     <td>dd16</td>
                    <td ></td>                                             
                </tr>
                <tr id="ee" style="height:20px">
                     <td></td>
                     <td></td>
                     <td><input type="button" onclick="index(this)" value="+" /></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                       <td></td>
                    <td ></td>                      
                </tr>
                <tr style="height:20px">
                    <td></td>
                     <td>
                         <select name="color">
                             <option value="red">藍色</option>
                             <option value="blue">紅色</option>
                         </select>
                     </td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                       <td></td>
                    <td ></td>                    
                </tr>




            </table>


        </div>

      </fieldset>

    </form>
</body>
</html>
