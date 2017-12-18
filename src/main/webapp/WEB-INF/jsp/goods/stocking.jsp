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
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 1000px;height:600px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        option = {
            title: {
                text: '库存盘点',
                subtext: '以实际数据为准'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['库存']
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {
                        show: true
                    },
                    dataView: {
                        show: true,
                        readOnly: false
                    },
                    magicType: {
                        show: true,
                        type: ['line', 'bar']
                    },
                    restore: {
                        show: true
                    },
                    saveAsImage: {
                        show: true
                    }
                }
            },
            calculable: true,
            xAxis: [{
                type: 'category',
                data: (function(){  
                	   var arr=[];  
                	   $.ajax(  
                    	 {  
                    	     url:"datastocking",  
                    	     dataType:"text",  
                    	     async: false,  
                    	     success:function(data)  
                    	     {  
                    	    	var rows=eval(data);  
                    	     //调用函数获取值，转换成数组模式  
                    	        for(var i=0;i<rows.length;i++)  
                    	        {  
                    	        arr.push(rows[i].goods_name);
                    	        
                    	        }  
                    	      }  
                    	     });  
                    	return arr;  
                    	})()
            }],
            yAxis: [{
                type: 'value'
            }],
            series: [{
                name: '库存',
                type: 'bar',
                data: (function(){  
                    var arr=[];  
                    $.ajax(  
                      {  
                          url:"datastocking",  
                          dataType:"text",  
                          async: false,  
                          success:function(data)  
                          {  
                             var rows=eval(data);  
                          //调用函数获取值，转换成数组模式  
                             for(var i=0;i<rows.length;i++)  
                             {  
                             arr.push(rows[i].goods_nums);
                             
                             }  
                           }  
                          });  
                     return arr;  
                     })(),
                itemStyle: {
                    normal: {
                        color: function(params) {
                            // build a color map as your need.
                            var colorList = [
                                '#C1232B', '#B5C334', '#FCCE10', '#E87C25', '#27727B',
                                '#FE8463', '#9BCA63', '#FAD860', '#F3A43B', '#60C0DD',
                                '#D7504B', '#C6E579', '#F4E001', '#F0805A', '#26C0C0'
                            ];
                            return colorList[params.dataIndex]
                        },
                        label: {
                            show: true,
                            position: 'top',
                            formatter: '{b}\n{c}'
                        }
                    }
                }
            }]
        };
     // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
		
	</body>
</html>