package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import web.service.loginResult;
import web.service.loginService;

//import com.company.web_ch09_01.service.Ch09CommonService;


// @Controller 는 Annotation이라 하며 행동 양식을 설정하는 것이라 생각하면 된다.

@Controller
@RequestMapping("/")
public class HomeController {
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   // HomeController.class에서 사용할 log에 대한 작업
   
   @RequestMapping("home")
   public String home() {
      logger.info("HOMECONTROLLER ACTIVATE");
      //commonService.method();
      return "home";
   }
   
   @RequestMapping("/")
   public String login() {
      logger.info("login activate");
      return "login";
   }
   
   @Autowired
   private loginService service;
   
   @RequestMapping("login")
   public String login(String m_id, String m_pw, HttpSession session) {
      
      logger.info("HomeController login() Activate");
      logger.info("m_id = " + m_id + "\t m_pw = " + m_pw);
      
      loginResult result = service.login(m_id,m_pw, session);
      
      if(result == loginResult.FailId) {
         logger.info("Fail ID");
         return "login";
      }
      else if(result == loginResult.FailPw) {
         logger.info("Fail PW");         
         return "login";
      }
      
      // ID와 PW가 맞다면 Success일 테니까
      // members member_logined = (members)session.getAttribute("member_logined");
      // session.setAttribute("m_id", m_id); // 로그인된 ID 저장
      
      return "redirect:/home";
   }
   
   @RequestMapping("loginForm")
   public String loginForm(String error, Model model) {
      // get방식으로 error가 넘어올 경우
      // 즉 로그인이 성공하면 get으로 넘어오는 것이 없기에 error에 NULL값이지만
      // 그렇지 않을 경우 error 메세지가 있기에 출력이 가능하다.
      if(error != null) {
         if(error.equals("fail_id")) {
            model.addAttribute("Id_error","InCorrect ID");
         }
         else if(error.equals("fail_pw")) {
            model.addAttribute("Pw_error","InCorrect PW");
         }
         // model에 저장해서 넘긴다.
      }
      return "login";
   }
   
   @RequestMapping("logOut")
   public String logOut(HttpSession session) {
      logger.info("logOut() Activate");
      session.removeAttribute("member_logined");
      return "login";
   }
}