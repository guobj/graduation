package com.gbj.controller;

import com.gbj.model.Employee;
import com.gbj.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;
import java.util.Random;

@Controller
public class LoginController {
    @Autowired
    private EmployeeService employeeService;
    //登录操作
    @RequestMapping("/login")
    public String login(){
        return "login/login2";
    }
    @RequestMapping("/loginDo")
    public String loginDo(Employee employee,String code,Map<String , Object> map,HttpServletRequest request){
        map.put("employee" , employee);
        try{
            map = employeeService.login(map);
            HttpSession session = request.getSession();
            session.setAttribute("employee",map.get("employee"));
            String rand = session.getAttribute("rand").toString();
            if(!code.equals(rand)){
                map.put("message","验证码错误！请重试。");
                return "login/login2";
            }
            System.out.println(map.get("employee"));
            return "main/main";
        }catch(Exception e){
//            e.printStackTrace();            // TODO: handle exception
            map.put("message" , e.getMessage());
            //map.put("message" , e.getMessage());
            return "login/login2";
        }
    }
    //安全退出  销毁session
    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session!=null){
            session.invalidate();
        }
        return "login/login";
    }
    //进入index页
    @RequestMapping("/index")
    public String index(){
        return "main/index";
    }
    //验证码
    private static final long serialVersionUID = 1L;
    Color getRandColor(int fc,int bc){
        Random random = new Random();
        if(fc>255){
            fc=255;
        }
        if(bc>255){
            bc=255;
        }
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
    }
    @RequestMapping("/validate")
    public void imageValite(HttpServletResponse response,HttpServletRequest request) throws IOException{
        try{
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            int width = 60,height = 20;
            BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
            OutputStream os=response.getOutputStream();
            Graphics g=image.getGraphics();
            Random random=new Random();
            g.setColor(getRandColor(200, 250));
            g.fillRect(0, 0, width, height);
            g.setFont(new Font("Times New Roman",Font.PLAIN,10));
            g.setColor(getRandColor(160, 200));
            for(int i=0;i<155;i++){
                int x=random.nextInt(width);
                int y=random.nextInt(height);
                int x1=random.nextInt(12);
                int y1=random.nextInt(12);
                g.drawLine(x, y, x+x1, y+y1);
            }
            String sRand="";
            for(int i=0;i<4;i++){
                String rand= String.valueOf(random.nextInt(10));
                sRand+=rand;
                g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
                g.drawString(rand, 13*i+6, 16);
            }
            HttpSession session=request.getSession();
            session.setAttribute("rand", sRand);
            g.dispose();
            ImageIO.write(image, "JPEG", os);
            os.flush();
            os.close();
            /*response.flushBuffer();
                PrintWriter out=response.getWriter();
                out.clear();
                out=pageContext.pushBody();
             */      }catch(IllegalStateException e){
                 System.out.print(e.getMessage());
                 e.printStackTrace();
             }
    }
}
