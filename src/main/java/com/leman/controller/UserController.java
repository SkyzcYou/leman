package com.leman.controller;

import com.leman.entity.Books;
import com.leman.entity.User;
import com.leman.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;


    // 注册
    @RequestMapping(value = "/sign_up",method = RequestMethod.POST)
    @ResponseBody
    public String signUp(@RequestParam("email") String email,@RequestParam("password") String password){
        // 初始化用户资料
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setUsername(email);
        user.setGender("未填写");
        System.out.println(user);
        int temp = userService.addUser(user);
        if (temp ==1){
            return "success";
        }else {
            return "error";
        }
    }
    // 登录
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestParam("email") String email,@RequestParam("password") String password, HttpSession session){
        User user = userService.queryUserByEmailAndPassword(email,password);
        if (user != null){
            session.setAttribute("USER_SESSION",user);
            return "success";
        }else {
            System.out.println("登录错误");
            return "error";
        }
    }
    // 注销
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("USER_SESSION");
        return "redirect:/index";
    }

    // 修改资料
    @RequestMapping(value = "/updateInfo",method = RequestMethod.POST)
    public String updateInfo(Model model,User user ,HttpSession session){
        System.out.println(user);
        int temp = userService.updateUser(user);
        if (temp ==1){
            // 移除 session ，重建 session
            User handleUser = (User) session.getAttribute("USER_SESSION");
            String email = user.getEmail();
            String pwd = handleUser.getPassword();

            session.removeAttribute("USER_SESSION");
            User newUser = userService.queryUserByEmailAndPassword(email,pwd);
            session.setAttribute("USER_SESSION",newUser);

            model.addAttribute("msg","修改成功");
        }else {
            model.addAttribute("msg","修改失败");
        }
        return "user";
    }

    // 修改密码
    @RequestMapping(value = "/updatePwd",method = RequestMethod.POST)
    @ResponseBody
    public String updatePwd(Model model,User user ,HttpSession session){
        // 取得ID、邮箱、密码
        User handleUser = (User) session.getAttribute("USER_SESSION");
        user.setId(handleUser.getId());
        String email = handleUser.getEmail();
        String newPwd = user.getPassword();
        System.out.println("email:"+email+"pwd:"+newPwd);
        User newUser = userService.queryUserByEmailAndPassword(email,newPwd);
        int temp = userService.updatePassword(user);
        if (temp ==1){
            // 刷新 session
            session.setAttribute("USER_SESSION",newUser);
            return "success";
        }else {
            return "error";
        }
    }



    @RequestMapping("/allUser")
    public String list(Model model) {
        List<User> list = userService.queryAllUser();
        model.addAttribute("list", list);
        return "admin/allUser";
    }

    @RequestMapping("/toAddUser")
    public String toAddPaper() {
        return "admin/addUser";
    }

    @RequestMapping("/addUser")
    public String addPaper(User user) {
        System.out.println(user);
        userService.addUser(user);
        return "redirect:/user/allUser";
    }

    @RequestMapping("/toUpdateUser")
    public String toUpdateBook(Model model, int id) {
        User user = userService.queryUserById(id);
        System.out.println(user);
        model.addAttribute("user",user );
        return "admin/updateUser";
    }

    @RequestMapping("/updateUser")
    public String updateBook(Model model, User user) {
        System.out.println("user:"+user);
        userService.updateUser_allinfo(user);
        User user1 = userService.queryUserById(user.getId());
        model.addAttribute("user", user1);
        return "redirect:/user/allUser";
    }

    @RequestMapping("/del/{Id}")
    public String deleteBook(@PathVariable("Id") int id) {
        userService.deleteUserById(id);
        return "redirect:/user/allUser";
    }

}
