<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
	<head>

		<base href="${basePath}">
		<meta charset="UTF-8">
		<title>H5模版:</title>
        <script src="js/echarts.min.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
	</head>
	<body>
    <div id="main" style="width: 1300px;height:575px;"></div>
    <script type="text/javascript">
         var myChart = echarts.init(document.getElementById('main'));
         var date = new Date();
         var year = date.getFullYear()+'年';
         var arr=[];
         var res=[];
         $.ajax({  
               url:"salesSumOrder",  
               dataType:"json",  
               async: false,  
               success:function(data){  
                  var rows=eval(data);  
               //调用函数获取值，转换成数组模式  
                  for(var i=0;i<rows.length;i++){  
                	  arr.push(rows[i].goods_name);
                  }
                  for( var j = 0; j < rows.length; j++){
                	  res.push({
                    	  name : rows[j].goods_name,
                    	  value : rows[j].num
                	  });
            	    }
               }
               });
         //alert(arr[1]);
    		/* var data = [{
                value: 3661,
                name: '2'
                    }, {
                value: 5713,
                name: '2'
                    }, {
                value: 9938,
                name: '2'
                    }, {
                value: 17623,
                name: '2'
                    }, {
                value: 3299,
                name: '2' */
                    //}];
        var option = {
                backgroundColor: '#fff',
                title: {
                    text: '销售报表',
                    subtext: year,
                    x: 'center',
                    y: 'center',
                    textStyle: {
                        fontWeight: 'normal',
                        fontSize: 16
                    }
                },
                tooltip: {
                    show: false,
                    trigger: 'item',
                    formatter: "{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'horizontal',
                    bottom: '0%',
                    data: arr
                },
                series: [{
                    type: 'pie',
                    selectedMode: 'single',
                    radius: ['25%', '58%'],
                    color: ['#86D560', '#AF89D6', '#59ADF3', '#FF999A', '#FFCC67'],
            
                    label: {
                        normal: {
                            position: 'inner',
                            formatter: '{d}%',
            
                            textStyle: {
                                color: '#fff',
                                fontWeight: 'bold',
                                fontSize: 14
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data: res
                }]
            };
            myChart.setOption(option);
        </script>		
	</body>
</html>