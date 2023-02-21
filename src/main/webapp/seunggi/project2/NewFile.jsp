<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="seunggi.movieDAO"%>
<%@ page import="seunggi.movieVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript" >

// $(document).ready(function(){
//     var area = $('#area option:selected').val();
//     console.log(area);
// })
        window.onload = function(){
            // var submit_1 = document.querySelector('#submit_1').value;
            // console.log(submit_1);
            // document.querySelector('#submit').value="추가하기"
            
            //클릭이벤트 주기-출력해주기-addeventlisener
            //select 콘솔출력
            var submit_1= document.getElementById('submit_1');
            submit_1.addEventListener('click',function(event){ //클릭을 변경
       
                var time= document.getElementById('time').value;
                console.log(time);
                var area= document.getElementById('area').value;
                console.log(area);
                var choice = document.getElementById('choice').value;
                console.log(choice);
                var pnum = document.getElementById('pnum').value;
                console.log(pnum);
                var aa = document.getElementById('pnum').value*10000;
                console.log(aa);
//                 var title = document.getElementById('title').value;
//                 console.log(title);
//                 var title= document.getElementById('title').value;
//                 console.log(title);
                document.getElementById('area_2').innerHTML="<div>"+area+"</div>";
                document.getElementById('area_3').innerHTML="<div>"+choice+"</div>";
                document.getElementById('area_4').innerHTML="<div>"+time+"</div>";
                document.getElementById('area_5').innerHTML="<div>"+"인원수: "+pnum+"</div>";
                document.getElementById('area_6').innerHTML="<div>"+"영화결제 금액: "+aa+"</div>";
//                 document.getElementById('area_5').innerHTML="<div>"+title+"</div>";
//                 document.getElementById('area_6').innerHTML="<div>"+"영화"+title+"</div>";
				//document.getElementById('aaname1').value= aa
                // document.getElementById('#area').innerHTML="asdf";
               // getElementById인데 #안쓰고 적용됨
               //area 클래스 
               
            })
         
		document.getElementById('choice').addEventListener('change',function(event){
			var choice = document.getElementById('choice').value;
             console.log(choice);
             
          if(choice =="영화선택"){
        	document.getElementById('poster').src = "/project1/human.png"
          }else if(choice == "교섭"){
      		document.getElementById('poster').src ="https://t1.daumcdn.net/movie/d331d74e425a3c71989ab14d9cbe83241377daa5"
      	  }else if(choice =="아바타: 물의 길"){
       		document.getElementById('poster').src =" https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMzFfMjQ3%2FMDAxNjcyNDkyMTEyODc2.X3XgAMXFxkVEWAcE4brxRvl-VwjUcMoSJYnqRe0DG1Ug.V_Koq9cW3AOPzass2_Q26YKrO01pfOqH_ELOK8jsN5Yg.JPEG.soyul9292%2Fcommon.jpeg&type=sc960_832"
       	  }else if(choice =="유령"){
         	document.getElementById('poster').src ="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMjRfMTgg%2FMDAxNjcxODkwMzkzODg1.FbqRN2YjTCjEnqPP8ZODYFUAWec-oBRK0FM1mOyCCMwg.vRyGh7O3fabtD3FEtcJonZpCeKY6lxfnnlN7AeInkAkg.JPEG.xman55555%2Fmovie_image.jpg&type=sc960_832"
       	  }else if(choice =="더 퍼스트 슬램덩크"){
       		document.getElementById('poster').src ="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMjJfMTI3%2FMDAxNjc0MzE1MDE4ODk0.rl6O1UHC0XmL5NcJPiTIAHEQPgkRPiDyEBWomwF613Ug.EQS6rqnN7gudcsjpqtYoMtO4r3o8xzyVce-If7ZE9ucg.JPEG.goodnamshiri%2F%25B4%25D9%25BF%25EE%25B7%25CE%25B5%25E5%25C6%25C4%25C0%25CF%25A3%25DF20230122%25A3%25DF002914.jpg&type=sc960_832"
       	  }
       })


//         $(document).ready(function() {
//             $("#choice").change( function() {
//                 $("#choice option:selected").each(function() {  
//                     $('.pic').hide().filter('#'+$(this).text()).fadeIn();
//                 }); //each 닫기
//             }); //change 닫기
//         }); // ready 닫기
//         })

        }
        function btn(){
            alert('결제가 완료되었습니다!')
            frm.method = "post";
    		frm.action = "moviepay";
    		frm.submit();
    		
        }
        
//         function btn2(){
//             alert('결제가 완료되었습니다!')
//             frm.method = "post";
//     		frm.action = "NewFile.jsp";
//     		frm.submit();
    		
//         }
        
//         let changeimg = document.getElementById("choice");
//         let myImg = document.getElementById("myimg");
// 			console.log(choice);
//         function choice(){
//             let index = choice.selectedIndex;
//             myimg.src = choice.options[index].value;
//         }
        
//         changeImage();
//         choice.onchange = changeImage;
        
        
    </script>

    <style>
    
        table{
           background-color: lightblue;
           background-image: url( "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTULo1n9_y3_G_QZyfskzqx3bwf9ta83jNTSqYiwnrnmfTl_qM2ZyGwYFC57Njk9kFm9Iw&usqp=CAU");
           background-size: 100%;
           width: 100%;
            height: 700px;
           text-align: center;
           border-radius:20px;
           padding: 10px;
            /* border: 2px solid lightblue; */
            
        }
        #submit_1{
            background-color:#0a0a23;
            color: #fff;
            border-radius:10px;
            padding:10px;
            min-height:20px; 
            min-width: 100px;
        }

        #submit_2{
            background-color:#0a0a23;
            color: #fff;
            border-radius:10px;
            padding:10px;
            min-height:20px; 
            min-width: 100px;
        }
        #submit_3{
            background-color:#0a0a23;
            color: #fff;
            border-radius:10px;
            padding:10px;
            min-height:20px; 
            min-width: 100px;
        }
     
        
        .table_2{
            display: inline-block;
            width: 100%;
            color: purple;
            display: inline-block; 
            font-size: larger;
            font-style:oblique;
            text-align: center;
        }
        select{
            width: 50%;
            height: 50%;
        }
        #btn_1{
            width: 30%;
            height: 60%;
        }
        .top_10{
            display: inline-block;
        }
        
        .pic{
        	width: 10%;
        	height: 30
        }
        
        #poster {
        	width: 30%;
        	height:40%;
        	padding:5px;
        }
/*         #choice{ */
/*     position:relative; */
/*     display:inline-block; */
/*     height: 100px; */
/*     width:100px; */
/*     border:solid 1px grey; */
/*     overflow:hidden; */
/* } */
/* .pic{ */
/*     position: absolute; */
/*     left: 0px; */
/*     top: 0px; */
/*     cursor: pointer; */
/*     display:none; */
/* } */

     
    </style>
</head>
<body>
    <form name="frm" action="/project1/moviepay">
 
    <div class="table_1">
        <div class="table_2">
  
        <table id="table" border="2">
            <thead>
                <tr> <h1>영화예매</h1></tr>
             
             </thead>
             
            <tbody>
                 <tr>
                        <td>
              <label  for="date">날짜를 선택하세요:
 				<input type="date" 
 						name="datename"
					   id="date"
				       max="2077-06-20"
			           min="2023-02-10"
		   		         value="2023-02-10">
				</label>
                   

                    <tr>
                        <td>
                    <select name="areaname" id="area">
                        <option value="지역선택">지역선택</option>
                        <option value="천안역">천안역</option>
                        <option value="천안터미널">천안터미널</option>
                        <option value="불당동">불당동</option>
                     </select>
                    </td>
                    </tr>
               
               <tr>
                <td>
                 <form name="movieSend">
                    <select name="choicename" id="choice" >
                        <option value="영화선택" >영화선택</option>
                        <option value="교섭" >교섭</option>
                        <option value="아바타: 물의 길">아바타: 물의 길</option>
                        <option value="유령">유령</option>
                        <option value="더 퍼스트 슬램덩크">더 퍼스트 슬램덩크</option>
                     </select>
                  <tr>
                	<td>
                     <select name="timename" id="time">
                        <option value="시간선택" >시간선택</option>
                        <option value="12:00" >12:00</option>
                        <option value="1:00" >1:00</option>
                        <option value="2:00">2:00</option>
                        <option value="3:00">3:00</option>
                        <option value="4:00">4:00</option>
                        <option value="5:00">5:00</option>
                        <option value="6:00">6:00</option>
                        <option value="7:00">7:00</option>
                     </select>
                      </td>
                    </tr>
                      </form>
<!--                      <img id="myimg" src="https://t1.daumcdn.net/movie/d331d74e425a3c71989ab14d9cbe83241377daa5"  alt="이미지" /> -->
                    </td>
                    </tr>
            
                    <tr>   
                        <td>
                        <span>인원수</span> <input name= "pnumname" id = "pnum" class="number0" type="number" min="0"  max="10" step="1" value="0">
                            <input id="submit_1" type="button" value="확인">
                        </td> 
                     </tr>
                     <tr>
                        <td>
                      
                      <input type="hidden" name="aaname" value="10000">
                      
                
                      <img id="poster" src = "/project1/human.png" >
                     
                      
                      <input type="hidden" name="image" value="">
                      
                            <div class="top_10">
                                <div id="area_2">
                                  
                                </div>
                                <div id="area_3">
                                  
                                </div>
                                <div id="area_4">
                                  
                                </div>
                                <div id="area_5">
                                  
                                </div>
                                <div id="area_6">
<!--                         <img class="pic" id="교섭" src="https://t1.daumcdn.net/movie/d331d74e425a3c71989ab14d9cbe83241377daa5"> -->
<!--                         <img class="pic" id="아바타: 물의 길" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMzFfMjQ3%2FMDAxNjcyNDkyMTEyODc2.X3XgAMXFxkVEWAcE4brxRvl-VwjUcMoSJYnqRe0DG1Ug.V_Koq9cW3AOPzass2_Q26YKrO01pfOqH_ELOK8jsN5Yg.JPEG.soyul9292%2Fcommon.jpeg&type=sc960_832"> -->
<!--                         <img class="pic" id="유령" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMjRfMTgg%2FMDAxNjcxODkwMzkzODg1.FbqRN2YjTCjEnqPP8ZODYFUAWec-oBRK0FM1mOyCCMwg.vRyGh7O3fabtD3FEtcJonZpCeKY6lxfnnlN7AeInkAkg.JPEG.xman55555%2Fmovie_image.jpg&type=sc960_832"> -->
<!--                         <img class="pic" id="더 퍼스트 슬램덩크" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMjJfMTI3%2FMDAxNjc0MzE1MDE4ODk0.rl6O1UHC0XmL5NcJPiTIAHEQPgkRPiDyEBWomwF613Ug.EQS6rqnN7gudcsjpqtYoMtO4r3o8xzyVce-If7ZE9ucg.JPEG.goodnamshiri%2F%25B4%25D9%25BF%25EE%25B7%25CE%25B5%25E5%25C6%25C4%25C0%25CF%25A3%25DF20230122%25A3%25DF002914.jpg&type=sc960_832"> -->
                                  
                                   
                                   </div>
                                  
                                    </div>
<% 
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");

movieDAO dao = new movieDAO();
movieVO vo = new movieVO();

 // 겟파라미터해서 영화값 가져오기
 // 영화값을 
 String choicename = request.getParameter("choicename");
System.out.println(choicename);
List<movieVO> list=dao.listMovies(choicename);

for (int i=0; i<list.size();i++){
	movieVO memberVO=(movieVO) list.get(i);
	String areaname2 = memberVO.getAreaname2();
	String choicename2 = memberVO.getChoicename2();
	String pnumname2 = memberVO.getPnumname2();
	String aaname2 = memberVO.getAaname2();
	String title2 = memberVO.getTitle2();
	%>
	<div><img src="<%=title2%>"></div>
	
	
	
	<%
}
			%>
                        </td>
                     </tr>
<!--                      <tr> -->
<!--                         <td> -->
<!--                             선택한 메뉴명 -->
<!--                         </td> -->
<!--                      </tr> -->
<!--                      <tr> -->
<!--                         <td> -->
<!--                             음식 결제금액 -->
<!--                         </td> -->
<!--                      </tr> -->
<!--                      <tr> -->
<!--                         <td> -->
<!--                             총결제금액 -->
<!--                         </td> -->
<!--                      </tr> -->
                    
                     <tr>
                        <td>
                           <button id="submit_2" input type="submit" onclick="javascript:btn()">결제하기</button>
                         
								<input id="submit_3" type="button" value="다시 예매하기" onClick="window.location.reload()">
                        </td>
                     </tr>
                     
            </tbody>
            
        </table>
    
    </div>
        
       
           </div>
    </div>

    </div>
    
</body>
</form>

</html>